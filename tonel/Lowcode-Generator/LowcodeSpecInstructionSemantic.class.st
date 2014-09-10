Class {
	#name : #LowcodeSpecInstructionSemantic,
	#superclass : #Object,
	#instVars : [
		'code',
		'locals'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> code [
	
	^ code
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> code: anObject [
	
	code := anObject
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> locals [
	
	^ locals
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> locals: anObject [
	
	locals := anObject
]
