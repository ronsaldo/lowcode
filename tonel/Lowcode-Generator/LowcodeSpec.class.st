Class {
	#name : #LowcodeSpec,
	#superclass : #Object,
	#instVars : [
		'conditions',
		'instructions'
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

{ #category : #accessing }
LowcodeSpec >> conditions [
	^ conditions
]

{ #category : #initialization }
LowcodeSpec >> initialize [
	conditions := OrderedCollection new.
	instructions := OrderedCollection new.
]

{ #category : #accessing }
LowcodeSpec >> instructions [
	^ instructions
]
