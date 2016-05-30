Class {
	#name : #LowcodeReferenceType,
	#superclass : #LowcodeType,
	#instVars : [
		'referenced'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeReferenceType class >> referenced: aLowcodeType [
	^ self new referenced: aLowcodeType
]

{ #category : #testing }
LowcodeReferenceType >> isReferenceType [
	^ true
]

{ #category : #printing }
LowcodeReferenceType >> printOn: aStream [
	aStream nextPutAll: '#('; print: referenced; nextPutAll: ' ref)'
]

{ #category : #accessing }
LowcodeReferenceType >> referenced [
	^ referenced
]

{ #category : #accessing }
LowcodeReferenceType >> referenced: anObject [
	referenced := anObject
]
