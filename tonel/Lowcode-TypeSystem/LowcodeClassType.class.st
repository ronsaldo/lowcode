Class {
	#name : #LowcodeClassType,
	#superclass : #LowcodeObjectType,
	#instVars : [
		'referenced'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #accessing }
LowcodeClassType class >> referenced: aLowcodeType [
	^ self new referenced: aLowcodeType
]

{ #category : #accessing }
LowcodeClassType >> instanceType [
	^ referenced object
]

{ #category : #testing }
LowcodeClassType >> isClassType [
	^ true
]

{ #category : #printing }
LowcodeClassType >> printOn: aStream [
	aStream nextPutAll: '#('; print: referenced; nextPutAll: ' classType)'
]

{ #category : #accessing }
LowcodeClassType >> referenced [
	^ referenced
]

{ #category : #accessing }
LowcodeClassType >> referenced: anObject [
	referenced := anObject
]
