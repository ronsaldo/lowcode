Class {
	#name : #LowcodeSpecInstruction,
	#superclass : #Object,
	#instVars : [
		'opcode',
		'mnemonic',
		'name',
		'description',
		'warning',
		'arguments'
	],
	#category : #'Lowcode-Generator'
}

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
	name := 'Unknown'.
	mnemonic := 'uknwn'.
	warning := ''.
	description := ''
]

{ #category : #testing }
LowcodeSpecInstruction >> isConditional [
	^ arguments notEmpty and: [ arguments first type = 'condition' ]
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

{ #category : #accessing }
LowcodeSpecInstruction >> warning [
	
	^ warning
]

{ #category : #accessing }
LowcodeSpecInstruction >> warning: anObject [
	
	warning := anObject
]
