"
I am an extension to the semantic analyser that adds support for type checking.
"
Class {
	#name : #OCLowcodeASTSemanticAnalyzer,
	#superclass : #OCASTSemanticAnalyzer,
	#instVars : [
		'variableTypeMap'
	],
	#classVars : [
		'ArithmeticMessages',
		'ArithmeticUnaryMessages',
		'ComparisonMessages',
		'IdentityEqualityMessages',
		'OptimizedInlineMessages',
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

	ArithmeticUnaryMessages := Dictionary new.
	#(
		not (bool boolean)
		bitInvert (uint32 integer)
		bitInvert32 (uint32 integer)
		negated (int32 any)
		sqrt (float32 any)
	) pairsDo: [ :selector :signature |
		
		ArithmeticUnaryMessages at: selector put: signature first asLowcodeType -> signature second
	].
	
	ArithmeticMessages := Set newFrom: #(+ - * / % \\).
	ComparisonMessages := Set newFrom: #(< <= > >= = ~).
	IdentityEqualityMessages := Set newFrom: #(== ~~).
	
	OptimizedInlineMessages := Dictionary new.
	#(
		ifTrue:ifFalse: (bool , (-> 1), (-> 1) -> 1)
		ifFalse:ifTrue: (bool , (-> 1), (-> 1) -> 1)
		ifNil:ifNotNil: (object , (-> 1), (-> 1) -> 1)
		ifNotNil:ifNil: (object , (-> 1), (-> 1) -> 1)
	) pairsDo: [ :selector :signature |
		OptimizedInlineMessages at: selector put: signature asLowcodeType
	].

]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode [
	| coercionType |
	coercionType := leftType arithmeticCoerceWith: rightType.
	coercionType ifNil: [
		OCLowcodeCannotCoerceTypeError new
				node: aMessageNode;
				compilationContext: compilationContext;
				messageText: 'Cannot perform arithmetic coercion for type ' , leftType printString , ' and ', rightType printString , '.';
				signal
	].
	^ coercionType
	
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkArithmeticMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType coercionType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	
	leftType := receiverType.
	rightType := argumentTypes first.
	coercionType := self arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode.
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: coercionType.
	aMessageNode propertyAt: #nativeInline put: coercionType isObject not.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkArithmeticUnaryMessage: aMessageNode [
	| selector receiverType coercionType valueType signatureType signatureTypeAndConstraint signatureConstraint |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	self assert: aMessageNode arguments size == 0.
	
	valueType := receiverType.
	signatureTypeAndConstraint := ArithmeticUnaryMessages at: selector.
	signatureType := signatureTypeAndConstraint key.
	signatureConstraint := signatureTypeAndConstraint value.
	coercionType := self arithmeticCoerceImplicitly: valueType with: signatureType on: aMessageNode.
	coercionType isObject ifFalse: [
		((signatureConstraint == #boolean) and: [ coercionType isBooleanType not ]) ifTrue: [
			OCLowcodeInvalidTypesError new
				node: aMessageNode;
				compilationContext: compilationContext;
				messageText: 'Cannot send message ' , selector printString, ' to object of non boolean (or object) type.';
				signal
		].

		((signatureConstraint == #integer) and: [ coercionType isIntegerType not ]) ifTrue: [
			OCLowcodeInvalidTypesError new
				node: aMessageNode;
				compilationContext: compilationContext;
				messageText: 'Cannot send message ' , selector printString, ' to object of non integer (or object) type.';
				signal
		].
	].

	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: coercionType.
	aMessageNode propertyAt: #nativeInline put: coercionType isObject not.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkComparisonMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType coercionType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	
	leftType := receiverType.
	rightType := argumentTypes first.
	coercionType := self arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode.
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: LowcodeType bool.
	aMessageNode propertyAt: #nativeInline put: coercionType isObject not.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkConversionMessage: aMessageNode [
	| selector receiverType messageType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	self assert: aMessageNode arguments size == 0.
	messageType := SpecialTypeConversionMessages at: selector.
	aMessageNode propertyAt: #type put: messageType returnType.
	aMessageNode propertyAt: #nativeInline put: true.
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
	aMessageNode propertyAt: #nativeInline put: true.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkImplicitConversionFrom: sourceType to: targetType on: aNode [
	(sourceType hasImplicitConversionTo: targetType) ifFalse: [
		OCLowcodeCannotConvertImplicitlyTypeError  new
				node: aNode;
				compilationContext: compilationContext;
				messageText: 'Cannot perform implicit conversion from type ' , sourceType printString , ' to ', targetType printString, '.';
				signal
	].

]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkOptimizedInlineMessage: aMessageNode [
	| selector receiverType argumentTypes messageSignature allArgumentTypes instantiatedMessageType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	messageSignature := OptimizedInlineMessages at: selector.
	allArgumentTypes := { receiverType } , argumentTypes asArray.
	self assert: allArgumentTypes size == messageSignature arguments size.
	
	instantiatedMessageType := messageSignature instantiateTemplate: allArgumentTypes.
	instantiatedMessageType ifNil: [ 
		OCLowcodeCannotConvertImplicitlyTypeError new
			node: aMessageNode;
			compilationContext: compilationContext;
			messageText: 'Invalid types for special message ' , selector printString , '.';
			signal
	].

	aMessageNode propertyAt: #messageType put: instantiatedMessageType.
	aMessageNode propertyAt: #type put: instantiatedMessageType returnType.

	
]

{ #category : #variables }
OCLowcodeASTSemanticAnalyzer >> declareVariableNode: aVariableNode as: anOCTempVariable [
	^ super declareVariableNode: aVariableNode as: anOCTempVariable
]

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> initialize [
	super initialize.
	variableTypeMap := IdentityDictionary new.
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isArithmeticMessage: aSelector [
	^ ArithmeticMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isArithmeticUnaryMessage: aSelector [
	^ ArithmeticUnaryMessages includesKey: aSelector 
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
OCLowcodeASTSemanticAnalyzer >> isOptimizedInlineMessage: aSelector [
	^ OptimizedInlineMessages includesKey: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isSpecialConversionMessage: aSelector [
	^ SpecialTypeConversionMessages includesKey: aSelector 
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseArgumentTypePragma: pragmaArguments scopeNode: aScopeNode [
	| name type var |
	name := pragmaArguments first.
	type := self parseTypeExpression: pragmaArguments second.
	var := scope lookupVar: name.
	var isArg ifFalse: [ 
	].

	variableTypeMap at: var put: type.
	(aScopeNode propertyAt: #argumentTypes ifAbsentPut: [ Dictionary new ]) at: name put: type.
	
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseReturnTypePragma: pragmaArguments [
	| type |
	type := self parseTypeExpression: pragmaArguments first.
	self halt.
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseTypeExpression: typeExpression [
	^ typeExpression asLowcodeType
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseVariableTypePragma: pragmaArguments scopeNode: aScopeNode [
	| name type var |
	name := pragmaArguments first.
	type := self parseTypeExpression: pragmaArguments second.
	var := scope lookupVar: name.
	(var ~~nil and: [ var isArg ]) ifTrue: [ 
	].

	variableTypeMap at: var put: type.
	(aScopeNode propertyAt: #temporaryTypes ifAbsentPut: [ Dictionary new ]) at: name put: type.
	
]

{ #category : #accessing }
OCLowcodeASTSemanticAnalyzer >> typeForTemporary: aTemporaryVariable [
	| name temporaryTypes varType |
	^ variableTypeMap at: aTemporaryVariable ifAbsent: [
		name := aTemporaryVariable name.
		temporaryTypes := aTemporaryVariable scope node propertyAt: #temporaryTypes ifAbsentPut: [ Dictionary new ].
		varType := temporaryTypes at: name ifAbsent: [ ^ LowcodeType object ].
		variableTypeMap at: aTemporaryVariable put: varType.
		varType
	]
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitAssignmentNode: anAssignmentNode [
	| valueType type binding |
	super visitAssignmentNode: anAssignmentNode.
	binding := anAssignmentNode variable propertyAt: #binding.
	type := binding lowcodeTypeFor: self.
	anAssignmentNode variable propertyAt: #type put: type.
	anAssignmentNode propertyAt: #type put: type.
	valueType := anAssignmentNode value propertyAt: #type.
	self checkImplicitConversionFrom: valueType to: type on: anAssignmentNode.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitBlockNode: aBlockNode [
	super visitBlockNode: aBlockNode.
	aBlockNode isInlined ifTrue: [^ self visitInlinedBlockNode: aBlockNode ].
	self halt.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitCascadeNode: aCascadeNode [
	super visitCascadeNode: aCascadeNode.
	aCascadeNode propertyAt: #type put: (aCascadeNode messages last propertyAt: #type)
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitInlinedBlockNode: aBlockNode [
	| argumentTypes returnType blockType |
	super visitInlinedBlockNode: aBlockNode.
	argumentTypes := aBlockNode arguments collect: [ :arg | self halt. ].
	returnType := aBlockNode statements last propertyAt: #type.
	blockType := LowcodeFunctionType arguments: argumentTypes asArray returnType: returnType.
	aBlockNode propertyAt: #type put: blockType
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
	aMessageNode propertyAt: #nativeInline put: false.
	aMessageNode isSuperSend ifTrue: [ ^ self ].
	(aMessageNode isInlined and: [ self isOptimizedInlineMessage: selector ]) ifTrue: [
		self checkOptimizedInlineMessage: aMessageNode
	].
	
	(self isSpecialConversionMessage: selector) ifTrue: [
		self checkConversionMessage: aMessageNode
	].

	(self isArithmeticMessage: selector) ifTrue: [
		self checkArithmeticMessage: aMessageNode
	].

	(self isArithmeticUnaryMessage: selector) ifTrue: [ 
		self checkArithmeticUnaryMessage: aMessageNode
	].

	(self isComparisonMessage: selector) ifTrue: [ 
		self checkComparisonMessage: aMessageNode
	].

	(self isIdentityEqualityMessage: selector) ifTrue: [
		self checkIdentityEqualityMessage: aMessageNode
	]. 

]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitPragmaNode: aPragmaNode [
	super visitPragmaNode: aPragmaNode.
	(aPragmaNode selector = #argument:type:)
		ifTrue: [ self parseArgumentTypePragma: aPragmaNode asPragma arguments scopeNode: aPragmaNode parent].
	(aPragmaNode selector = #var:type:)
		ifTrue: [ self parseVariableTypePragma: aPragmaNode asPragma arguments scopeNode: aPragmaNode parent].
	(aPragmaNode selector = #returnType:)
		ifTrue: [ self parseReturnTypePragma: aPragmaNode asPragma arguments ]
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitReturnNode: aReturnNode [
	super visitReturnNode: aReturnNode.
	aReturnNode propertyAt: #type put: LowcodeType object.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitSequenceNode: aSequenceNode [
	| type |
	super visitSequenceNode: aSequenceNode.

	aSequenceNode statements ifEmpty: [
		^ aSequenceNode propertyAt: #type put: LowcodeType object.
	].

	type := aSequenceNode statements last propertyAt: #type.
	aSequenceNode propertyAt: #type put: type.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitVariableNode: aVariableNode [
	| binding |
	super visitVariableNode: aVariableNode.
	binding := aVariableNode propertyAt: #binding.
	aVariableNode propertyAt: #type put: (binding lowcodeTypeFor: self).
]
