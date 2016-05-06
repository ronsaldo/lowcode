"
I am an extension to the semantic analyser that adds support for type checking.
"
Class {
	#name : #OCLowcodeASTSemanticAnalyzer,
	#superclass : #OCASTSemanticAnalyzer,
	#classVars : [
		'ArithmeticMessages',
		'ComparisonMessages',
		'IdentityEqualityMessages',
		'SpecialTypeConversionMessages'
	],
	#category : #'Lowcode-OpalCompiler-Semantic'
}

{ #category : #'class initialization' }
OCLowcodeASTSemanticAnalyzer class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	SpecialTypeConversionMessages := Dictionary new.
	#(
		asObject (any -> object)
		asNativeBoolean (any -> bool)
		asNativeByte (any -> uint8)
		asNativeSByte (any -> int8)
		asNativeShort (any -> short)
		asNativeInt (any -> int)
		asNativeLong (any -> long)
		asNativeInt8 (any -> int8)
		asNativeInt16 (any -> int16)
		asNativeInt32 (any -> int32)
		asNativeInt64 (any -> int64)
		asNativeUInt8 (any -> uint8)
		asNativeUInt16 (any -> uint16)
		asNativeUInt32 (any -> uint32)
		asNativeUInt64 (any -> uint64)
		asNativeFloat32 (any -> float32)
		asNativeFloat64 (any -> float64)
		asNativeFloat (any -> float)
		asNativeDouble (any -> double)
	) pairsDo: [ :selector :signature |
		SpecialTypeConversionMessages at: selector put: signature asLowcodeType
	].

	ArithmeticMessages := Set newFrom: #(+ - * / % **).
	ComparisonMessages := Set newFrom: #(< <= > >= = ~).
	IdentityEqualityMessages := Set newFrom: #(== ~~).
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode [
	| coercionType |
	coercionType := leftType arithmeticCoerceWith: rightType.
	coercionType ifNil: [
		OCLowcodeCannotCoerceTypeError new
				node: aMessageNode;
				compilationContext: compilationContext;
				messageText: 'Cannot perform arithmetic coercion for type ' , leftType printString , ' and ', rightType , '.';
				signal
	].
	^ coercionType
	
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkArithmeticMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType coercionType |
	selector := aMessageNode.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	
	leftType := receiverType.
	rightType := argumentTypes first.
	coercionType := self arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode.
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: coercionType.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkComparisonMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType coercionType |
	selector := aMessageNode.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	
	leftType := receiverType.
	rightType := argumentTypes first.
	coercionType := self arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode.
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: LowcodeType bool.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkConversionMessage: aMessageNode [
	| selector receiverType argumentTypes argumentType |
	selector := aMessageNode.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	argumentType := argumentTypes first.
	self halt.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkIdentityEqualityMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType |
	selector := aMessageNode.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	
	leftType := receiverType.
	rightType := argumentTypes first.
	self halt.
]

{ #category : #variables }
OCLowcodeASTSemanticAnalyzer >> declareVariableNode: aVariableNode as: anOCTempVariable [
	^ super declareVariableNode: aVariableNode as: anOCTempVariable
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isArithmeticMessage: aSelector [
	^ ArithmeticMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isComparisonMessage: aSelector [
	^ ComparisonMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isIdentityEqualityMessage: aSelector [
	^ IdentityEqualityMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isSpecialConversionMessage: aSelector [
	^ SpecialTypeConversionMessages includesKey: aSelector 
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseArgumentTypePragma: pragmaArguments [
	| name type |
	name := pragmaArguments first.
	type := self parseTypeExpression: pragmaArguments second.
	self halt.
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseReturnTypePragma: pragmaArguments [
	| type |
	type := self parseTypeExpression: pragmaArguments first.
	self halt.
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseTypeExpression: typeExpression [
	^ typeExpression asNativeFieldType
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseVariableTypePragma: pragmaArguments [
	| name type |
	name := pragmaArguments first.
	type := self parseTypeExpression: pragmaArguments second.
	self halt.
]

{ #category : #accessing }
OCLowcodeASTSemanticAnalyzer >> typeForTemporary: aTemporaryVariable [
	^ LowcodeType object
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitAssignmentNode: anAssignmentNode [
	super visitAssignmentNode: anAssignmentNode
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitCascadeNode: aCascadeNode [
	super visitCascadeNode: aCascadeNode.
	aCascadeNode propertyAt: #type put: (aCascadeNode messages last propertyAt: #type)
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitLiteralNode: aLiteralNode [
	super visitLiteralNode: aLiteralNode.
	aLiteralNode propertyAt: #type put: LowcodeType object.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitMessageNode: aMessageNode [
	| selector receiverType |
	super visitMessageNode: aMessageNode.
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	aMessageNode propertyAt: #type put: LowcodeType object.
	(self isSpecialConversionMessage: selector) ifTrue: [
		self checkConversionMessage: aMessageNode
	].

	(self isArithmeticMessage: selector) ifTrue: [
		self checkArithmeticMessage: aMessageNode
	].

	(self isComparisonMessage: selector) ifTrue: [ 
		self checkComparisonMessage: aMessageNode
	].

	(self isIdentityEqualityMessage: selector) ifTrue: [
		self checkIdentityEqualityMessage: aMessageNode
	]. 
	"self halt"
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitPragmaNode: aPragmaNode [
	super visitPragmaNode: aPragmaNode.
	(aPragmaNode selector = #argument:type:)
		ifTrue: [ self parseArgumentTypePragma: aPragmaNode asPragma arguments ].
	(aPragmaNode selector = #var:type:)
		ifTrue: [ self parseVariableTypePragma: aPragmaNode asPragma arguments ].
	(aPragmaNode selector = #returnType:)
		ifTrue: [ self parseReturnTypePragma: aPragmaNode asPragma arguments ]
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitVariableNode: aVariableNode [
	| binding |
	super visitVariableNode: aVariableNode.
	binding := aVariableNode propertyAt: #binding.
	aVariableNode propertyAt: #type put: (binding lowcodeTypeFor: self).
]
