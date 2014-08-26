Class {
	#name : #LowcodeSpecSistaInstruction,
	#superclass : #Object,
	#instVars : [
		'firstOpcode',
		'lastOpcode',
		'mnemonic',
		'description',
		'semantics',
		'kind',
		'stackArguments',
		'stackResults'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeSpecSistaInstruction >> allArguments [
	^ self arguments , self stackArguments , self stackResults
]

{ #category : #'as yet unclassified' }
LowcodeSpecSistaInstruction >> arguments [
	^ #()
]

{ #category : #'as yet unclassified' }
LowcodeSpecSistaInstruction >> asXMLElement [
	| element stackArgumentsElement stackResultsElement |
	element := XMLElement name: 'sista-instruction'.
	element attributeAt: 'firstOpcode' put: firstOpcode printString;
		attributeAt: 'lastOpcode' put: lastOpcode printString;
		attributeAt: 'mnemonic' put: mnemonic;
		attributeAt: 'kind' put: kind.

	stackArgumentsElement := XMLElement name: 'stack-arguments'.
	element addNode: stackArgumentsElement.
	stackArguments do: [ :arg | stackArgumentsElement addNode: arg asXMLElement].

	stackResultsElement := XMLElement name: 'stack-results'.
	element addNode: stackResultsElement.
	stackResults do: [ :arg | stackResultsElement addNode: arg asXMLElement].

	semantics keysAndValuesDo: [ :k :v |
		element addNode: ((XMLElement name: 'semantic') 
			attributeAt: 'language' put: k;
			contentString: v)
	].
	
	^ element
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> description: anObject [
	
	description := anObject
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> firstOpcode [
	
	^ firstOpcode
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> firstOpcode: anObject [
	
	firstOpcode := anObject
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> initialize [
	firstOpcode := 0.
	lastOpcode := 0.
	stackArguments := #().
	stackResults := #().
	mnemonic := 'uknwn'.
	description := ''.
	semantics := Dictionary new.
	
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> kind [
	^ kind
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> kind: aInstructionKind [
	kind := aInstructionKind
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> lastOpcode [
	
	^ lastOpcode
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> lastOpcode: anObject [
	
	lastOpcode := anObject
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> mnemonic [
	
	^ mnemonic
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> mnemonic: anObject [
	
	mnemonic := anObject
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> opcode: anInteger [
	firstOpcode := lastOpcode := anInteger
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> opcodes [
	^ firstOpcode to: lastOpcode
]

{ #category : #'as yet unclassified' }
LowcodeSpecSistaInstruction >> printOn: aStream [
	aStream nextPutAll: mnemonic , ' := [' , firstOpcode printString , ' , ' , lastOpcode printString , ']'
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> semantic: semantic for: languageVariant [
	semantics at: languageVariant put: semantic
]

{ #category : #'as yet unclassified' }
LowcodeSpecSistaInstruction >> semanticFor: languageVariant ifAbsent: aBlock [
	^ semantics at: languageVariant ifAbsent: aBlock 
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> stackArguments [
	
	^ stackArguments
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> stackArguments: anObject [
	
	stackArguments := anObject
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> stackResults [
	
	^ stackResults
]

{ #category : #accessing }
LowcodeSpecSistaInstruction >> stackResults: anObject [
	
	stackResults := anObject
]
