Class {
	#name : #LowcodeAssembledMethod,
	#superclass : #Object,
	#instVars : [
		'literals',
		'instructions'
	],
	#category : #'Lowcode-Execution'
}

{ #category : #accessing }
LowcodeAssembledMethod >> instructions [
	
	^ instructions
]

{ #category : #accessing }
LowcodeAssembledMethod >> instructions: anObject [
	
	instructions := anObject
]

{ #category : #accessing }
LowcodeAssembledMethod >> literals [
	
	^ literals
]

{ #category : #accessing }
LowcodeAssembledMethod >> literals: anObject [
	
	literals := anObject
]
