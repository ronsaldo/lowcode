"
I am an extended version of the OpalCompier AST translator that uses the Lowcode IRMethodBuilder, and the lowcode instructions.
"
Class {
	#name : #OCLowcodeASTTranslator,
	#superclass : #OCASTTranslator,
	#instVars : [
		'gensymCount'
	],
	#classVars : [
		'ArithmeticMessages',
		'ArithmeticUnaryMessages',
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
	
	ArithmeticUnaryMessages := Dictionary newFromPairs: #(
		not emitNot:
		negated emitNegated:
		bitInvert emitBitInvert:
		bitInvert32 emitBitInvert:
		sqrt emitSqrt:
	).

	IdentityEqualityMessages := Set newFrom: #(== ~~).
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> addTemps: names types: typeDictionary isArgs: isArgs [
	| objectTemps nativeTemps type |
	objectTemps := OrderedCollection new.
	nativeTemps := OrderedCollection new.
	names do: [ :name |
		type := typeDictionary at: name ifAbsent: [ LowcodeType object ].
		type isObject ifTrue: [
			objectTemps add: name.
		] ifFalse: [
			nativeTemps add: name -> type size. 
			isArgs ifTrue: [ objectTemps add: ('__object_' , name ) asSymbol ] 
		]
	].

	methodBuilder addTemps: objectTemps.
	methodBuilder addNativeTemps: nativeTemps.
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
OCLowcodeASTTranslator >> emitAccessorMessage: aMessageNode [
	| fieldType receiverType tempVar fieldOffset |
	fieldType := aMessageNode propertyAt: #fieldType.
	aMessageNode isCascaded ifFalse: [
		valueTranslator visitNode: aMessageNode receiver
	].

	receiverType := aMessageNode receiver propertyAt: #type.	
	aMessageNode arguments ifNotEmpty: [
		tempVar := methodBuilder generateTempOfType: receiverType.
		receiverType emitLocalStoreAndPop: methodBuilder name: tempVar.
	].

	aMessageNode arguments do: [:each | 
		valueTranslator visitNode: each.
		self emitConversionFrom: (each propertyAt: #type) to: fieldType
	].
	
	fieldOffset := aMessageNode propertyAt: #fieldOffset.
	aMessageNode arguments ifNotEmpty: [
		receiverType emitLocalValue: methodBuilder name: tempVar.
		receiverType emitFieldStoreAndPop: methodBuilder type: fieldType offset: fieldOffset.
		receiverType emitLocalValue: methodBuilder name: tempVar.
	] ifEmpty: [
		(aMessageNode propertyAt: #referenceAsked) ifTrue: [
			receiverType emitFieldReference: methodBuilder type: fieldType offset: fieldOffset
		] ifFalse: [
			receiverType emitFieldValue: methodBuilder type: fieldType offset: fieldOffset
		]	
	].

]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitArgumentLoads: names types: typeDictionary [
	| objectTemps nativeTemps type objectArgTempName |
	objectTemps := OrderedCollection new.
	nativeTemps := OrderedCollection new.
	names do: [ :name |
		type := typeDictionary at: name ifAbsent: [ LowcodeType object ].
		type isObject ifTrue: [
			type isObjectReference ifTrue: [ 
				methodBuilder pushTemp: name.
				type emitArgumentTypeCheck: methodBuilder name: name.
				methodBuilder popTop.
			].
		] ifFalse: [
			objectArgTempName := ('__object_' , name ) asSymbol.
			methodBuilder pushTemp: objectArgTempName.
			type emitArgumentTypeCheck: methodBuilder name: name.
			self emitLocalStore: type valueType: LowcodeType object name: name.
		]
	].

	methodBuilder addTemps: objectTemps.
	methodBuilder addNativeTemps: nativeTemps.
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitArithmeticMessage: aMessageNode [
	| coercionType |
	self emitCoercionsOfSpecialMessage: aMessageNode.
	coercionType := aMessageNode propertyAt: #coercionType.
	coercionType perform: (ArithmeticMessages at: aMessageNode selector) with: methodBuilder
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitArithmeticUnaryMessage: aMessageNode [
	| coercionType |
	self emitCoercionsOfSpecialMessage: aMessageNode.
	coercionType := aMessageNode propertyAt: #coercionType.
	coercionType perform: (ArithmeticUnaryMessages at: aMessageNode selector) with: methodBuilder
	
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
	| coercionType |
	self emitCoercionsOfSpecialMessage: aMessageNode.
	coercionType := aMessageNode propertyAt: #coercionType.
	coercionType perform: (ComparisonMessages at: aMessageNode selector) with: methodBuilder
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitCondition: args boolean: aBoolean [
	"emits the jumps so that one of the 2 blocks in args is evaluated depending on boolean"
	methodBuilder jumpAheadTo: #else if: aBoolean.
	self visitInlinedBlockNode: args first.
	methodBuilder jumpAheadTo: #end.
	methodBuilder jumpAheadTarget: #else.
	self visitInlinedBlockNode: args last.
	methodBuilder jumpAheadTarget: #end.
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitConstructorMessage: aMessageNode [
	| resultType fields resultTemp fieldTypeAndOffset fieldType fieldOffset |
	aMessageNode isCascaded ifFalse: [
		valueTranslator visitNode: aMessageNode receiver
	].

	methodBuilder send: #new.
	resultType := aMessageNode propertyAt: #type.
	resultTemp := methodBuilder generateTempOfType: resultType.
	self emitLocalStore: resultType valueType: resultType name: resultTemp.
	fields := aMessageNode propertyAt: #fields.
	
	aMessageNode arguments doWithIndex: [ :arg :index |
		"Convert the value"
		valueTranslator visitNode: arg.
		fieldTypeAndOffset := fields at: index.
		fieldType := fieldTypeAndOffset key.
		fieldOffset := fieldTypeAndOffset value. 
		self emitConversionFrom: (arg propertyAt: #type) to: fieldType.

		"Store the value in the field."
		resultType emitLocalValue: methodBuilder name: resultTemp.
		resultType emitFieldStoreAndPop: methodBuilder type: fieldType offset: fieldOffset.
	].

]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitConversionFrom: sourceType to: targetType [
	sourceType withoutAliases = targetType withoutAliases ifTrue: [ ^ self ].
	targetType isObject ifTrue: [ ^ sourceType emitConversionToObject: methodBuilder ].
	sourceType isObject ifTrue: [ ^ targetType emitConversionFromObject: methodBuilder ].
	
	Transcript show: 'Convert from ' , sourceType printString , ' -> ' , targetType printString.
	self halt.
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitIdentityEqualityMessage: aMessageNode [
	self halt.
]

{ #category : #'inline messages factored' }
OCLowcodeASTTranslator >> emitIf: aMessageNode boolean: aBoolean [

	| receiverType |
	valueTranslator visitNode: aMessageNode receiver.
	receiverType := aMessageNode receiver propertyAt: #type.
	self emitConversionFrom: receiverType to: LowcodeType object.
	self emitCondition: aMessageNode arguments boolean: aBoolean
]

{ #category : #'inline messages factored' }
OCLowcodeASTTranslator >> emitIfNil: aMessageNode boolean: aBoolean [
	| args notNilBlock |
	
	valueTranslator visitNode: aMessageNode receiver.
	self halt.
	
	"emits the == nil code and push correct value on stack if the ifNotNil block has an argument"
	args := aMessageNode arguments.
	notNilBlock := aBoolean ifTrue: [args first] ifFalse: [args last].
	notNilBlock arguments ifNotEmpty: [ notNilBlock arguments first binding emitStore: methodBuilder ].
	methodBuilder pushLiteral: nil.
	methodBuilder send: #==.
	
	self emitCondition: args boolean: aBoolean
]

{ #category : #'native code emition' }
OCLowcodeASTTranslator >> emitLocalStore: variableType valueType: valueType name: localName [
	(variableType hasDirectStoreFrom: valueType) ifTrue: [
		variableType emitLocalStore: methodBuilder valueType: valueType name: localName
	] ifFalse: [
		self emitConversionFrom: valueType to: variableType.
		variableType emitLocalStore: methodBuilder valueType: variableType name: localName
	]
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> emitMessageNode: aMessageNode [
	| selector messageKind |
	(aMessageNode propertyAt: #nativeInline) ifTrue: [
		messageKind := aMessageNode propertyAt: #nativeInlineKind ifAbsent: [ nil ].
		messageKind ifNotNil: [ ^ self perform: ('emit' , messageKind, 'Message:') asSymbol with: aMessageNode ].
		
		selector := aMessageNode selector.
		(SpecialTypeConversionMessages includes: selector) ifTrue: [
			aMessageNode isCascaded ifFalse: [
				valueTranslator visitNode: aMessageNode receiver.
			].
		
			^ self emitConversionFrom: (aMessageNode receiver propertyAt: #type) to: (aMessageNode propertyAt: #type)
		].
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
OCLowcodeASTTranslator >> popOfType: aType [
	aType emitPop: methodBuilder
	
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> pushDupOfType: aType [
	aType emitDuplicate: methodBuilder
	
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitAssignmentNode: anAssignmentNode [

	| valueType variableType |
	valueTranslator visitNode: anAssignmentNode value.
	valueType := anAssignmentNode value propertyAt: #type.
	variableType := anAssignmentNode propertyAt: #type.
	(variableType hasDirectStoreFrom: valueType) ifTrue: [ 
		anAssignmentNode variable binding emitLowcodeStore: methodBuilder type: variableType valueType: valueType.
	] ifFalse: [ 
		self emitConversionFrom: valueType to: variableType.
		anAssignmentNode variable binding emitLowcodeStore: methodBuilder type: variableType valueType: variableType.
	]
	
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
	
	| allTempNames argumentTemporaries temporaryVariables argumentTypes temporaryTypes |
	aMethodNode arguments size > 15 ifTrue: [self backendError: 'Too many arguments' forNode: aMethodNode ].

	methodBuilder compilationContext: aMethodNode compilationContext.
	
	"Add the temporary variables, including the special variables that are required by Lowcode methods."
	allTempNames := aMethodNode scope tempVarNames asArray.
	argumentTypes := aMethodNode propertyAt: #argumentTypes ifAbsent: [Dictionary new].
	temporaryTypes := aMethodNode propertyAt: #temporaryTypes ifAbsent: [Dictionary new].
	
	argumentTemporaries := allTempNames first: aMethodNode arguments size.
	temporaryVariables := allTempNames allButFirst: aMethodNode arguments size.
	
	self addTemps: argumentTemporaries types: argumentTypes isArgs: true.
	methodBuilder addTemps: #(__lowcodePreviousNativeStackPointer__ __lowcodeNativeFramePointer__ __lowcodeNativeStackPointer__ __lowcodeCalloutState__).
	self addTemps: temporaryVariables types: temporaryTypes isArgs: false. 
		
	methodBuilder properties: aMethodNode properties.
	methodBuilder irPrimitive: aMethodNode primitiveFromPragma.
	aMethodNode pragmas do: [:each | self visitPragmaNode: each].
	methodBuilder numArgs: aMethodNode arguments size.
	
	aMethodNode scope tempVector ifNotEmpty: [
		methodBuilder 
			createTempVectorNamed: aMethodNode scope tempVectorName 
			withVars: (aMethodNode scope tempVector collect: [:each| each name]) asArray.
	].
	self emitArgumentLoads: argumentTemporaries types: argumentTypes.
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
	| type |
	type := aVariableNode propertyAt: #type.
	type isReferenceType ifTrue: [ 
		aVariableNode binding emitLowcodeReference: methodBuilder type: type.
	] ifFalse: [
		aVariableNode binding emitLowcodeValue: methodBuilder type: type.
	]
	
]
