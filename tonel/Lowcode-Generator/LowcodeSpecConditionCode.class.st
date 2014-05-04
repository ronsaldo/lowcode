Class {
	#name : #LowcodeSpecConditionCode,
	#superclass : #Object,
	#instVars : [
		'code',
		'mnemonic',
		'name',
		'description'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecConditionCode >> code [
	
	^ code
]

{ #category : #accessing }
LowcodeSpecConditionCode >> code: anObject [
	
	code := anObject
]

{ #category : #accessing }
LowcodeSpecConditionCode >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecConditionCode >> description: anObject [
	
	description := anObject
]

{ #category : #accessing }
LowcodeSpecConditionCode >> initialize [
	code := 0.
	mnemonic := 'invalid'.
	name := 'Unknown'.
	description := ''
]

{ #category : #accessing }
LowcodeSpecConditionCode >> mnemonic [
	
	^ mnemonic
]

{ #category : #accessing }
LowcodeSpecConditionCode >> mnemonic: anObject [
	
	mnemonic := anObject
]

{ #category : #accessing }
LowcodeSpecConditionCode >> name [
	^ name
]

{ #category : #accessing }
LowcodeSpecConditionCode >> name: anObject [
	
	name := anObject
]
