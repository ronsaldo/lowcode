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
		'encodingCode',
		'kind'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecInstruction >> allArguments [
	^ self arguments , self stackArguments , self stackResults
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

{ #category : #accessing }
LowcodeSpecInstruction >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecInstruction >> description: anObject [
	
	description := anObject
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
LowcodeSpecInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LowcodeSpecInstruction >> opcode: anObject [
	
	opcode := anObject
]

{ #category : #'as yet unclassified' }
LowcodeSpecInstruction >> printOn: aStream [
	aStream nextPutAll: mnemonic , ' := ' , opcode printString
]

{ #category : #accessing }
LowcodeSpecInstruction >> semantic: semantic for: languageVariant [
	semantics at: languageVariant put: semantic
]

{ #category : #accessing }
LowcodeSpecInstruction >> semanticFor: languageVariant ifAbsent: aBlock [
	^ semantics at: languageVariant ifAbsent: aBlock 
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
