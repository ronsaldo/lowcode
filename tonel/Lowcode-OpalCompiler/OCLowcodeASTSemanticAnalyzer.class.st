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
		'NewObjectMessages',
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
	NewObjectMessages := Set newFrom: #(basicNew basicNew: new new:).
	
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

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> addClassDependencies: aClassCollection [
	| dependencies |
	aClassCollection ifEmpty: [ ^ self ].
	dependencies := self methodDependencies.
	dependencies addAll: (aClassCollection collect: #binding).
]

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> addClassDependency: aClass [
	| dependencies |
	dependencies := self methodDependencies.
	dependencies add: aClass binding.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> addMethodDependency: aCompiledMethod [
	| dependencies |
	dependencies := self methodDependencies.
	dependencies add: { aCompiledMethod classBinding . aCompiledMethod selector }.
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
OCLowcodeASTSemanticAnalyzer >> checkAccessorMessage: aMessageNode [
	| selector receiverType argumentTypes fieldName fieldType fieldOffset |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size <= 1.
	fieldName := argumentTypes ifEmpty: [ selector ] ifNotEmpty: [ selector allButLast asSymbol ].
	fieldType := receiverType fieldType: fieldName.
	fieldType ifNil: [
		OCLowcodeFieldNotPresentError new
			node: aMessageNode;
			compilationContext: compilationContext;
			messageText: 'Cannot access unexistent field named ' , fieldName , ' in object of type ' , receiverType printString , '.';
			signal
	].
	fieldOffset := receiverType fieldOffset: fieldName.
	
	self addMethodDependency: (receiverType getCompiledMethodForSelector: selector).
	
	argumentTypes ifEmpty: [
		aMessageNode propertyAt: #referenceAsked ifAbsentPut: false.
		(receiverType isReferenceType or: [ fieldType canBePushedInTheStack not or: [aMessageNode propertyAt: #referenceAsked] ] ) ifTrue: [
			aMessageNode propertyAt: #referenceAsked put: true.
			fieldType := receiverType fieldReferenceType: fieldName.
		].
	
		"Nothing to check"
		aMessageNode propertyAt: #type put: fieldType. 
	] ifNotEmpty: [ 
		self checkImplicitConversionFrom: argumentTypes first to: fieldType on: aMessageNode arguments first.
		aMessageNode propertyAt: #type put: receiverType.
	].
 
	aMessageNode propertyAt: #fieldType put: fieldType.
	aMessageNode propertyAt: #fieldOffset put: fieldOffset.
	aMessageNode propertyAt: #nativeInline put: true.
	aMessageNode propertyAt: #nativeInlineKind put: #Accessor.
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
	(coercionType isObject or: [ coercionType isStructureType ]) ifTrue: [ ^ self checkNormalMessage: aMessageNode ].
	
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: coercionType.
	aMessageNode propertyAt: #nativeInline put: true.
	aMessageNode propertyAt: #nativeInlineKind put: #Arithmetic.
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

	coercionType isObject ifTrue: [ ^ self checkNormalMessage: aMessageNode ].
	
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: coercionType.
	aMessageNode propertyAt: #nativeInline put: true.
	aMessageNode propertyAt: #nativeInlineKind put: #ArithmeticUnary.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkComparisonMessage: aMessageNode [
	| selector receiverType argumentTypes leftType rightType coercionType resultType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	self assert: argumentTypes size == 1.
	leftType := receiverType.
	rightType := argumentTypes first.
	coercionType := self arithmeticCoerceImplicitly: leftType with: rightType on: aMessageNode.
	coercionType isObject ifTrue: [ ^ self checkNormalMessage: aMessageNode ].
	
	resultType := LowcodeType bool.
	aMessageNode propertyAt: #coercionType put: coercionType.
	aMessageNode propertyAt: #type put: resultType.
	aMessageNode propertyAt: #nativeInline put: true.
	aMessageNode propertyAt: #nativeInlineKind put: #Comparison.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkConstructorMesage: aMessageNode [
	| selector receiverType argumentTypes instanceType fields fieldType argumentType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	argumentTypes ifEmpty: [
		OCLowcodeFieldNotPresentError new
			node: aMessageNode;
			compilationContext: compilationContext;
			messageText: 'Trying to use constructor ' , selector , ' without arguments in of type ' , receiverType printString , '.';
			signal
	].

	self addMethodDependency: (receiverType getCompiledMethodForSelector: selector).
	
	instanceType := receiverType instanceType.
	fields := (selector substrings: ':') collectWithIndex: [ :fieldName :index |
		fieldType := instanceType fieldType: fieldName.
		fieldType ifNil: [
			OCLowcodeFieldNotPresentError new
				node: aMessageNode;
				compilationContext: compilationContext;
				messageText: 'Cannot access unexistent field named ' , fieldName , ' in object of type ' , instanceType printString , '.';
				signal
		].
		argumentType := argumentTypes at: index.
		self checkImplicitConversionFrom: argumentType to: fieldType on: (aMessageNode arguments at: index).
		fieldType -> (instanceType fieldOffset: fieldName)
	].

	aMessageNode propertyAt: #type put: instanceType.
	aMessageNode propertyAt: #fields put: fields.
	aMessageNode propertyAt: #nativeInline put: true.
	aMessageNode propertyAt: #nativeInlineKind put: #Constructor.
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
	aMessageNode propertyAt: #nativeInlineKind put: #IdentityEquality.
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
OCLowcodeASTSemanticAnalyzer >> checkNormalMessage: aMessageNode [
	| selector receiverType argumentTypes objectType argumenType resultType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	argumentTypes := aMessageNode arguments collect: [ :arg | arg propertyAt: #type ].
	objectType := LowcodeType object.
	self checkImplicitConversionFrom: receiverType to: objectType on: aMessageNode.
	aMessageNode arguments do: [ :argument |
		argumenType := argument propertyAt: #type.
		self checkImplicitConversionFrom: argumenType to: objectType on: argument.
	].

	resultType := objectType.
	((self isNewObjectMessage: selector) and: [ receiverType isClassType ]) ifTrue: [
		resultType := receiverType instanceType.
	].
	selector == #class ifTrue: [
		resultType := receiverType classType. 
	].

	(self isConversionMessage: selector) ifTrue: [ 
		resultType := (selector allButFirst: 2) asSymbol asLowcodeTypeAtEnvironment: (compilationContext getClass).
		resultType := resultType object.
	].

	(resultType isAnyObject and: [ receiverType isAnyObject not or: [ receiverType isReferenceType ]]) ifTrue: [
		resultType := receiverType getReturnTypeForSelector: aMessageNode selector.
		resultType isAnyObject not ifTrue: [ self addMethodDependency: (receiverType getCompiledMethodForSelector: aMessageNode selector )]
	].
 
	aMessageNode propertyAt: #type put: resultType
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

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkPointerMessage: aMessageNode [
	self halt.
]

{ #category : #'message type checking' }
OCLowcodeASTSemanticAnalyzer >> checkSpecialConversionMessage: aMessageNode [
	| selector receiverType messageType |
	selector := aMessageNode selector.
	receiverType := aMessageNode receiver propertyAt: #type.
	self assert: aMessageNode arguments size == 0.
	messageType := SpecialTypeConversionMessages at: selector.
	aMessageNode propertyAt: #type put: messageType returnType.
	aMessageNode propertyAt: #nativeInline put: true.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> compiledMethodProperties [
	scope node methodNode properties ifNil: [ scope node methodNode properties: (AdditionalMethodState new copyWith: #eagerInstallationRequired -> true)].
	^ scope node methodNode properties
]

{ #category : #variables }
OCLowcodeASTSemanticAnalyzer >> declareVariableNode: aVariableNode as: anOCTempVariable [
	^ super declareVariableNode: aVariableNode as: anOCTempVariable
]

{ #category : #initialization }
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
OCLowcodeASTSemanticAnalyzer >> isConversionMessage: aSelector [
	| conversionClassName conversionClassBinding conversionType |
	aSelector size < 3 ifTrue: [ ^ false ].
	(aSelector beginsWith: #as) ifFalse: [ ^ false ]. 
	aSelector third isUppercase ifFalse: [ ^ false ].
	conversionClassName := aSelector allButFirst: 2.
	conversionClassBinding := compilationContext getClass bindingOf: conversionClassName.
	conversionClassBinding ifNil: [ ^ false ].
	conversionType := conversionClassBinding value asLowcodeType. 
	^ conversionType ~= LowcodeType object
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isIdentityEqualityMessage: aSelector [
	^ IdentityEqualityMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isNewObjectMessage: aSelector [
	^ NewObjectMessages includes: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isOptimizedInlineMessage: aSelector [
	^ OptimizedInlineMessages includesKey: aSelector 
]

{ #category : #testing }
OCLowcodeASTSemanticAnalyzer >> isSpecialConversionMessage: aSelector [
	^ SpecialTypeConversionMessages includesKey: aSelector 
]

{ #category : #'as yet unclassified' }
OCLowcodeASTSemanticAnalyzer >> methodDependencies [
	| result |
	^ self compiledMethodProperties propertyValueAt: #dependencies ifAbsent: [
		result := Set new.
		scope node methodNode properties: (scope node methodNode properties copyWith: #dependencies -> result).
		^ result
		]
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseArgumentTypePragma: pragmaNode scopeNode: aScopeNode [
	| type var nameOrNames names pragmaArguments |
	pragmaArguments := pragmaNode asPragma arguments.
	nameOrNames := pragmaArguments first.
	names := nameOrNames isArray ifTrue: [ nameOrNames ] ifFalse: [ { nameOrNames } ].
	type := self parseTypeExpression: pragmaArguments second.
	self addClassDependencies: type extraClassDependencies.
	names do: [ :name |
		var := scope lookupVar: name.
		var ifNil: [
			OCLowcodeVariableNotPresentError new
				node: pragmaNode;
				compilationContext: compilationContext;
				messageText: 'Non existent argument ', name printString;
				signal
		].
		var isArg ifFalse: [
			OCLowcodeVariableNotPresentError new
				node: pragmaNode;
				compilationContext: compilationContext;
				messageText: 'Variable ', name printString , ' is not an argument.';
				signal
		].

		variableTypeMap at: var put: type.
		(aScopeNode propertyAt: #argumentTypes ifAbsentPut: [ Dictionary new ]) at: name put: type.
	]
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseReturnTypePragma: aPragmaNode [
	| pragmaArguments type |
	pragmaArguments := aPragmaNode asPragma arguments.
	type := self parseTypeExpression: pragmaArguments first.
	self addClassDependencies: type extraClassDependencies.
	type isObject ifFalse: [ 
		OCLowcodeCannotCoerceTypeError new
			node: aPragmaNode;
			compilationContext: compilationContext;
			messageText: 'Only object return types are supported by now.';
			signal
	].

	scope node methodNode propertyAt: #returnType put: type.
	
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseTypeExpression: typeExpression [
	^ typeExpression asLowcodeTypeAtEnvironment: compilationContext getClass
]

{ #category : #parsing }
OCLowcodeASTSemanticAnalyzer >> parseVariableTypePragma: pragmaNode scopeNode: aScopeNode [
	| type var nameOrNames names pragmaArguments |
	pragmaArguments := pragmaNode asPragma arguments.
	nameOrNames := pragmaArguments first.
	names := nameOrNames isArray ifTrue: [ nameOrNames ] ifFalse: [ { nameOrNames } ].
	type := self parseTypeExpression: pragmaArguments second.
	self addClassDependencies: type extraClassDependencies.
	names do: [ :name |
		var := scope lookupVar: name.
		(var ~~nil and: [ var isArg ]) ifTrue: [ 
			OCLowcodeVariableNotPresentError new
				node: pragmaNode;
				compilationContext: compilationContext;
				messageText: 'Variable ', name printString , ' is an argument.';
				signal
		].

		variableTypeMap at: var put: type.
		(aScopeNode propertyAt: #temporaryTypes ifAbsentPut: [ Dictionary new ]) at: name put: type.
	]
	
]

{ #category : #accessing }
OCLowcodeASTSemanticAnalyzer >> referenceTypeForTemporary: aTemporaryVariable [
	^ (self typeForTemporary: aTemporaryVariable) ref
]

{ #category : #'type inference' }
OCLowcodeASTSemanticAnalyzer >> selfType [
	| methodClassOrMetaclass methodClass classType |
	methodClassOrMetaclass := compilationContext getClass.
	methodClassOrMetaclass isMeta ifTrue: [
		^ methodClassOrMetaclass baseClass asLowcodeType classType
	] ifFalse: [ 
		^ methodClassOrMetaclass asLowcodeType object
	].
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
OCLowcodeASTSemanticAnalyzer >> visitArrayNode: anArrayNode [ 
	super visitArrayNode: anArrayNode.
	anArrayNode propertyAt: #type put: LowcodeType object.
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitAssignmentNode: anAssignmentNode [
	| valueType type binding |
	super visitAssignmentNode: anAssignmentNode.
	binding := anAssignmentNode variable propertyAt: #binding.
	type := binding lowcodeTypeFor: self.
	anAssignmentNode variable propertyAt: #type put: type.
	valueType := anAssignmentNode value propertyAt: #type.
	self checkImplicitConversionFrom: valueType to: type on: anAssignmentNode.
	anAssignmentNode propertyAt: #variableType put: type.
	(type ~= valueType and: [ type hasDirectStoreFrom: valueType ]) ifTrue: [ 
		anAssignmentNode propertyAt: #type put: (binding lowcodeReferenceTypeFor: self).
	] ifFalse: [ 
		anAssignmentNode propertyAt: #type put: type.
	]
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
OCLowcodeASTSemanticAnalyzer >> visitLiteralArrayNode: aLiteralArrayNode [ 
	super visitLiteralArrayNode: aLiteralArrayNode.
	aLiteralArrayNode propertyAt: #type put: LowcodeType object.
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
		^ self checkOptimizedInlineMessage: aMessageNode
	].

	receiverType isClassType ifTrue: [ 
		(receiverType isConstructorMessage: selector) ifTrue: [
			^ self checkConstructorMesage: aMessageNode
		]
	].

	(receiverType isObjectReference or: [ receiverType isReferenceType ]) ifTrue: [
		(receiverType isAccessorMessage: selector) ifTrue: [
			^ self checkAccessorMessage: aMessageNode
		]
	].

	receiverType isPointerType ifTrue: [
		^ self checkPointerMessage: aMessageNode
	].
	
	(self isSpecialConversionMessage: selector) ifTrue: [
		^ self checkSpecialConversionMessage: aMessageNode
	].

	(self isArithmeticMessage: selector) ifTrue: [
		^ self checkArithmeticMessage: aMessageNode
	].

	(self isArithmeticUnaryMessage: selector) ifTrue: [ 
		^ self checkArithmeticUnaryMessage: aMessageNode
	].

	(self isComparisonMessage: selector) ifTrue: [ 
		^ self checkComparisonMessage: aMessageNode
	].

	(self isIdentityEqualityMessage: selector) ifTrue: [
		^ self checkIdentityEqualityMessage: aMessageNode
	]. 

	^ self checkNormalMessage: aMessageNode
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitMethodNode: aMethodNode [

	scope := compilationContext scope newMethodScope. 
	aMethodNode scope: scope.  scope node: aMethodNode.
	aMethodNode arguments do: [:node | self declareArgumentNode: node ].
	aMethodNode pragmas do: [:each | self visitNode: each].
	self compiledMethodProperties.
	self visitNode: aMethodNode body.
	scope := scope outerScope.

]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitPragmaNode: aPragmaNode [
	super visitPragmaNode: aPragmaNode.
	(aPragmaNode selector = #argument:type:)
		ifTrue: [ self parseArgumentTypePragma: aPragmaNode scopeNode: aPragmaNode parent].
	(aPragmaNode selector = #var:type:)
		ifTrue: [ self parseVariableTypePragma: aPragmaNode scopeNode: aPragmaNode parent].
	(aPragmaNode selector = #returnType:)
		ifTrue: [ self parseReturnTypePragma: aPragmaNode ]
]

{ #category : #visitor }
OCLowcodeASTSemanticAnalyzer >> visitReturnNode: aReturnNode [
	| valueType returnType |
	super visitReturnNode: aReturnNode.
	valueType := aReturnNode value propertyAt: #type.
	returnType := scope node propertyAt: #returnType ifAbsent: [ LowcodeType object ].
	self checkImplicitConversionFrom: valueType to: returnType on: aReturnNode.
	aReturnNode propertyAt: #type put: returnType
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
	| binding variableType valueType |
	super visitVariableNode: aVariableNode.
	binding := aVariableNode propertyAt: #binding.
	valueType := variableType := binding lowcodeTypeFor: self.
	aVariableNode propertyAt: #referenceAsked ifAbsentPut: false.
	(variableType canBePushedInTheStack not or: [aVariableNode propertyAt: #referenceAsked]) ifTrue: [
		aVariableNode propertyAt: #referenceAsked put: true.
		valueType := binding lowcodeReferenceTypeFor: self
	].

	aVariableNode propertyAt: #variableType put: variableType.
	aVariableNode propertyAt: #type put: valueType.
]
