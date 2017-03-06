Class {
	#name : #LowcodeSpecInstruction,
	#superclass : #Object,
	#instVars : [
		'opcode',
		'mnemonic',
		'name',
		'description',
		'warning',
		'arguments',
		'stackArguments',
		'stackResults',
		'semantics',
		'semanticLocals',
		'encodingCode',
		'kind'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecInstruction >> allArguments [
	^ self arguments , self stackArguments , self stackResults
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> allocatedRegisters [
	stackArguments size == 0 ifTrue: [ 
		^ {#() . stackResults reversed select: #allocate }
	] ifFalse: [ 
		^ {stackArguments reversed . (stackResults reversed reject: #aliased) }
	]
]

{ #category : #accessing }
LowcodeSpecInstruction >> argumentEncodingCode [
	encodingCode ifNil: [
		encodingCode := ''.
		arguments do: [ :arg | encodingCode := encodingCode , arg encodingCode ].
	].
	
	^ encodingCode
	
]

{ #category : #accessing }
LowcodeSpecInstruction >> arguments [
	
	^ arguments
]

{ #category : #accessing }
LowcodeSpecInstruction >> arguments: anObject [
	
	arguments := anObject
]

{ #category : #'as yet unclassified' }
LowcodeSpecInstruction >> asXMLElement [
	| element argumentsElement  stackArgumentsElement stackResultsElement |
	element := XMLElement name: 'instruction'.
	element attributeAt: 'opcode' put: opcode printString;
		attributeAt: 'mnemonic' put: mnemonic;
		attributeAt: 'kind' put: kind.

	element addNode: ((XMLElement name: 'name')
				contentString: name);
			addNode: ((XMLElement name: 'description')
				contentString: description).
	warning ifNotEmpty: [
		element addNode: ((XMLElement name: 'warning')
			contentString: description).
	].

	argumentsElement := XMLElement name: 'arguments'.
	element addNode: argumentsElement.
	arguments do: [ :arg | argumentsElement addNode: arg asXMLElement].

	stackArgumentsElement := XMLElement name: 'stack-arguments'.
	element addNode: stackArgumentsElement.
	stackArguments do: [ :arg | stackArgumentsElement addNode: arg asXMLElement].

	stackResultsElement := XMLElement name: 'stack-results'.
	element addNode: stackResultsElement.
	stackResults do: [ :arg | stackResultsElement addNode: arg asXMLElement].
	
	semantics keysAndValuesDo: [ :k :v |
		| contentNode |
		contentNode := v asXMLElement.
		contentNode attributeAt: 'language' put: k.
		element addNode: contentNode
	].
	
	^ element
]

{ #category : #accessing }
LowcodeSpecInstruction >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecInstruction >> description: anObject [
	
	description := anObject
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> flattenArray: anArray [
	^ Array streamContents: [ :out |
		anArray do: [ :el | el isArray ifTrue: [ out nextPutAll: el ] ifFalse: [ out nextPut: el ] ]
	]
]

{ #category : #accessing }
LowcodeSpecInstruction >> hasSemanticFor: languageVariant [
	^ semantics includesKey: languageVariant
]

{ #category : #accessing }
LowcodeSpecInstruction >> initialize [
	opcode := 0.
	arguments := #().
	stackArguments := #().
	stackResults := #().
	name := 'Unknown'.
	mnemonic := 'uknwn'.
	warning := ''.
	description := ''.
	semantics := Dictionary new.
	kind := #operation.
]

{ #category : #testing }
LowcodeSpecInstruction >> isConditional [
	^ arguments notEmpty and: [ arguments first type = 'condition' ]
]

{ #category : #accessing }
LowcodeSpecInstruction >> kind [
	^ kind
]

{ #category : #accessing }
LowcodeSpecInstruction >> kind: aKind [
	kind := aKind
]

{ #category : #accessing }
LowcodeSpecInstruction >> mnemonic [
	
	^ mnemonic
]

{ #category : #accessing }
LowcodeSpecInstruction >> mnemonic: anObject [
	
	mnemonic := anObject
]

{ #category : #accessing }
LowcodeSpecInstruction >> mnemonicUnderscored [
	^ mnemonic asUppercase
]

{ #category : #accessing }
LowcodeSpecInstruction >> name [
	^ name
]

{ #category : #accessing }
LowcodeSpecInstruction >> name: anObject [
	
	name := anObject
]

{ #category : #accessing }
LowcodeSpecInstruction >> oopStackArguments [
	^ stackArguments select: #isOop
]

{ #category : #accessing }
LowcodeSpecInstruction >> oopStackDifference [
	^ self oopStackArguments size - self oopStackResults size + 1
]

{ #category : #accessing }
LowcodeSpecInstruction >> oopStackResults [
	^ stackResults select: #isOop
]

{ #category : #accessing }
LowcodeSpecInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LowcodeSpecInstruction >> opcode: anObject [
	
	opcode := anObject
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> prettyPrintRegisterSignature: registerSignature [
	| arg result |
	arg := self prettyPrintRegisterSignaturePart: registerSignature first.
	result :=  self prettyPrintRegisterSignaturePart: registerSignature second.
	^ result ifNotEmpty: [ arg , 'Result', result ] ifEmpty: [ arg ]
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> prettyPrintRegisterSignaturePart: registerSignature [
	| count lastElement |
	count := 0.
	lastElement := nil.
	^ ByteString streamContents: [ :out |
		registerSignature do: [ :element |
			(element ~= lastElement and: [ lastElement isNotNil ]) ifTrue: [ 
				out nextPutAll: lastElement.
				count > 1 ifTrue: [ out print: count ].
				count := 0.
			].
		
			lastElement := element.
			count := count + 1.
		].
	
		lastElement ifNotNil: [ 
			out nextPutAll: lastElement.
			count > 1 ifTrue: [ out print: count ].
		]
	]
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> prettyRegisterSignature [
	^ self prettyPrintRegisterSignature: self registerSignature
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> prettyRegisterSignature64On32 [
	^ self prettyPrintRegisterSignature: self registerSignature64On32
]

{ #category : #'as yet unclassified' }
LowcodeSpecInstruction >> printOn: aStream [
	aStream nextPutAll: mnemonic , ' := ' , opcode printString
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> registerSignature [
	^ self allocatedRegisters collect: [:part | (part collect: #registerSignature) sorted]
]

{ #category : #'register signature' }
LowcodeSpecInstruction >> registerSignature64On32 [
	^ self allocatedRegisters collect: [:part | (self flattenArray: (part collect: #registerSignature64On32)) sorted]
]

{ #category : #accessing }
LowcodeSpecInstruction >> semantic: semantic for: languageVariant [
	semantics at: languageVariant put: semantic
]

{ #category : #accessing }
LowcodeSpecInstruction >> semanticDataFor: languageVariant ifAbsent: aBlock [
	^ semantics at: languageVariant ifAbsent: aBlock 
]

{ #category : #accessing }
LowcodeSpecInstruction >> semanticFor: languageVariant ifAbsent: aBlock [
	^ (semantics at: languageVariant ifAbsent: [ ^ aBlock value]) code
]

{ #category : #accessing }
LowcodeSpecInstruction >> stackArguments [
	^ stackArguments
]

{ #category : #accessing }
LowcodeSpecInstruction >> stackArguments: anArray [
	stackArguments := anArray
]

{ #category : #accessing }
LowcodeSpecInstruction >> stackResults [
	^ stackResults
]

{ #category : #accessing }
LowcodeSpecInstruction >> stackResults: anArray [
	stackResults := anArray
]

{ #category : #accessing }
LowcodeSpecInstruction >> warning [
	
	^ warning
]

{ #category : #accessing }
LowcodeSpecInstruction >> warning: anObject [
	
	warning := anObject
]
