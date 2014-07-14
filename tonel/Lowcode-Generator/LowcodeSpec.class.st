Class {
	#name : #LowcodeSpec,
	#superclass : #Object,
	#instVars : [
		'conditions',
		'instructions',
		'sistaInstructions'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #adding }
LowcodeSpec >> addConditionCode: aConditionCode [
	conditions add: aConditionCode
]

{ #category : #adding }
LowcodeSpec >> addInstruction: anInstruction [
	instructions add: anInstruction
]

{ #category : #adding }
LowcodeSpec >> addSistaInstruction: aSistaInstruction [
	sistaInstructions add: aSistaInstruction
]

{ #category : #accessing }
LowcodeSpec >> conditions [
	^ conditions
]

{ #category : #initialization }
LowcodeSpec >> initialize [
	conditions := OrderedCollection new.
	instructions := OrderedCollection new.
	sistaInstructions := OrderedCollection new.
]

{ #category : #accessing }
LowcodeSpec >> instructions [
	^ instructions
]

{ #category : #accessing }
LowcodeSpec >> sistaInstructions [
	^ sistaInstructions
]
