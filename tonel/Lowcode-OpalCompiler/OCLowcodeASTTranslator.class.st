Class {
	#name : #OCLowcodeASTTranslator,
	#superclass : #OCASTTranslator,
	#classVars : [
		'ArithmeticMessages',
		'ComparisonMessages',
		'IdentityEqualityMessages',
		'SpecialTypeConversionMessages'
	],
	#category : #'Lowcode-OpalCompiler-Translator'
}

{ #category : #initialize }
OCLowcodeASTTranslator class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	SpecialTypeConversionMessages := Set newFrom:
	#(
		asObject
		asNativeBoolean
		asNativeByte
		asNativeSByte
		asNativeShort
		asNativeInt
		asNativeLong
		asNativeInt8
		asNativeInt16
		asNativeInt32
		asNativeInt64
		asNativeUInt8
		asNativeUInt16
		asNativeUInt32
		asNativeUInt64
		asNativeFloat32
		asNativeFloat64
		asNativeFloat
		asNativeDouble
	).

	ArithmeticMessages := Dictionary newFromPairs:
		#(
		+ emitAdd:
		- emitSubtract:
		* emitMultiply:
		/ emitDivide:
		% emitRem:
		\\ emitRem:
	).
	
	ComparisonMessages := Dictionary newFromPairs: #(
		< emitLessThan:
		<= emitLessEqualThan:
		> emitGreaterThan:
		>= emitGreaterEqualThan:
		= emitEquals:
		~ emitNotEquals:
	).
	
	IdentityEqualityMessages := Set newFrom: #(== ~~).
]

{ #category : #initialization }
OCLowcodeASTTranslator >> classForEffect [
	^ OCLowcodeASTTranslatorForEffect
]

{ #category : #initialization }
OCLowcodeASTTranslator >> classForValue [
	^ OCLowcodeASTTranslatorForValue
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitArithmeticMessage: aMessageNode [
	| coercionType |
	self emitCoercionsOfSpecialMessage: aMessageNode.
	coercionType := aMessageNode propertyAt: #coercionType.
	coercionType perform: (ArithmeticMessages at: aMessageNode selector) with: methodBuilder
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitCoercionsOfSpecialMessage: aMessageNode [
	| coercionType |
	coercionType := aMessageNode propertyAt: #coercionType.
	aMessageNode isCascaded ifFalse: [
		valueTranslator visitNode: aMessageNode receiver].
	self emitConversionFrom: (aMessageNode receiver propertyAt: #type) to: coercionType.
	aMessageNode arguments do: [:each | 
		valueTranslator visitNode: each.
		self emitConversionFrom: (each propertyAt: #type) to: coercionType].
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitComparisonMessage: aMessageNode [
	self halt.
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitConversionFrom: sourceType to: targetType [
	sourceType withoutAliases = targetType withoutAliases ifTrue: [ ^ self ].
	targetType isObject ifTrue: [ ^ sourceType emitConversionToObject: methodBuilder ].
	sourceType isObject ifTrue: [ ^ sourceType emitConversionFromObject: methodBuilder ].
	
	Transcript show: 'Convert from ' , sourceType printString , ' -> ' , targetType printString.
	self halt.
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitIdentityEqualityMessage: aMessageNode [
	self halt.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> emitMessageNode: aMessageNode [
	| selector |
	(aMessageNode propertyAt: #nativeInline) ifTrue: [
		selector := aMessageNode selector.
		(SpecialTypeConversionMessages includes: selector) ifTrue: [
			aMessageNode isCascaded ifFalse: [
				valueTranslator visitNode: aMessageNode receiver.
			].
		
			^ self emitConversionFrom: (aMessageNode receiver propertyAt: #type) to: (aMessageNode propertyAt: #type)
		].
	
		(ArithmeticMessages includesKey: selector) ifTrue: [
			^ self emitArithmeticMessage: aMessageNode.
		].
	
		(ComparisonMessages includesKey: selector) ifTrue: [
			^ self emitComparisonMessage: aMessageNode.
		].
	
		(IdentityEqualityMessages includesKey: selector) ifTrue: [
			^ self emitIdentityEqualityMessage: aMessageNode.
		]
	].

	self assert: (aMessageNode propertyAt: #type) isObject.
	
	aMessageNode isCascaded ifFalse: [
		valueTranslator visitNode: aMessageNode receiver].
	self emitConversionFrom: (aMessageNode receiver propertyAt: #type) to: LowcodeType object.
	aMessageNode arguments do: [:each | 
		valueTranslator visitNode: each.
		self emitConversionFrom: (each propertyAt: #type) to: LowcodeType object].
	aMessageNode isSuperSend
		ifTrue: [methodBuilder send: aMessageNode selector toSuperOf: self compilationContext getClass]
		ifFalse: [methodBuilder send: aMessageNode selector].

]

{ #category : #initialization }
OCLowcodeASTTranslator >> initialize [

	methodBuilder := IRLowcodeBuilder new.
	effectTranslator := self as: self classForEffect.
	valueTranslator := self as: self classForValue.
	effectTranslator instVarNamed: #effectTranslator put: effectTranslator.
	effectTranslator instVarNamed: #valueTranslator put: valueTranslator.
	valueTranslator instVarNamed: #valueTranslator put: valueTranslator.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> pushDupOfType: aType [
	aType emitDuplicate: methodBuilder
	
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitCascadeNode: aCascadeNode [ 

	| receiverType |
	valueTranslator visitNode: aCascadeNode receiver.
	receiverType := aCascadeNode receiver propertyAt: #type.
	aCascadeNode messages allButLastDo: [:node |
		self pushDupOfType: receiverType.
		effectTranslator visitNode: node.
	].
	self visitNode: aCascadeNode messages last.

]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitMethodNode: aMethodNode [
	
	| allTempNames argumentTemporaries temporaryVariables |
	aMethodNode arguments size > 15 ifTrue: [self backendError: 'Too many arguments' forNode: aMethodNode ].

	methodBuilder compilationContext: aMethodNode compilationContext.
	
	"Add the temporary variables, including the special variables that are required by Lowcode methods."
	allTempNames := aMethodNode scope tempVarNames asArray.
	argumentTemporaries := allTempNames first: aMethodNode arguments size.
	temporaryVariables := allTempNames allButFirst: aMethodNode arguments size.
	methodBuilder addTemps: argumentTemporaries.
	methodBuilder addTemps: #(__lowcodePreviousNativeStackPointer__ __lowcodeNativeFramePointer__ __lowcodeNativeStackPointer__ __lowcodeCalloutState__).
	methodBuilder addTemps: temporaryVariables.
		
	methodBuilder properties: aMethodNode properties.
	methodBuilder irPrimitive: aMethodNode primitiveFromPragma.
	aMethodNode pragmas do: [:each | self visitPragmaNode: each].
	methodBuilder numArgs: aMethodNode arguments size.
	
	aMethodNode scope tempVector ifNotEmpty: [
		methodBuilder 
			createTempVectorNamed: aMethodNode scope tempVectorName 
			withVars: (aMethodNode scope tempVector collect: [:each| each name]) asArray.
	].
	effectTranslator visitNode: aMethodNode body.
	aMethodNode body lastIsReturn ifFalse:  [methodBuilder pushReceiver; returnTop]
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitReturnNode: aReturnNode [ 
	| valueType |
	valueTranslator visitNode: aReturnNode value.
	
	valueType := aReturnNode value propertyAt: #type.
	self emitConversionFrom: valueType to: LowcodeType object.
	methodBuilder returnTop.
		

]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitVariableNode: aVariableNode [
	aVariableNode binding emitLowcodeValue: methodBuilder
]
