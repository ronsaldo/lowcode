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

{ #category : #'type decorators' }
LowcodeClassType >> classType [
	^ LowcodeType object
]

{ #category : #accessing }
LowcodeClassType >> instanceType [
	^ referenced object
]

{ #category : #testing }
LowcodeClassType >> isClassType [
	^ true
]

{ #category : #testing }
LowcodeClassType >> isConstructorMessage: aSelector [
	| method |
	method := referenced structureClass class methodDict at: aSelector ifAbsent: [ ^ false ].
	^ method hasPragmaNamed: #constructor
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
