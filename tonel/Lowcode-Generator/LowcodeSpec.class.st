Class {
	#name : #LowcodeSpec,
	#superclass : #Object,
	#instVars : [
		'conditions',
		'instructions'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeSpec >> addConditionCode: aConditionCode [
	conditions add: aConditionCode
]

{ #category : #'as yet unclassified' }
LowcodeSpec >> addInstruction: anInstruction [
	instructions add: anInstruction
]

{ #category : #'as yet unclassified' }
LowcodeSpec >> initialize [
	conditions := OrderedCollection new.
	instructions := OrderedCollection new.
]
