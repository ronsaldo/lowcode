Class {
	#name : #LowcodeSpecSistaInstruction,
	#superclass : #Object,
	#instVars : [
		'firstOpcode',
		'lastOpcode',
		'mnemonic',
		'description',
		'semantics'
	],
	#category : #'Lowcode-Generator'
}

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
	mnemonic := 'uknwn'.
	description := ''.
	semantics := Dictionary new.
	
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
