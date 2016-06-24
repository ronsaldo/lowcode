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

{ #category : #'as yet unclassified' }
LowcodeClassType >> extraClassDependencies [
	^ referenced extraClassDependencies
]

{ #category : #accessing }
LowcodeClassType >> getCompiledMethodForSelector: aSelector [
	^ referenced structureClass class lookupSelector: aSelector
]

{ #category : #'type inference' }
LowcodeClassType >> getReturnTypeForSelector: aSelector [
	| method|
	referenced isStructureType ifFalse: [ ^ LowcodeType object ].
	method := referenced structureClass class lookupSelector: aSelector.
	^ method ifNotNil: [ method lowcodeReturnType ] ifNil: [ ^ LowcodeType object ]

]

{ #category : #accessing }
LowcodeClassType >> instanceType [
	^ referenced object
]

{ #category : #testing }
LowcodeClassType >> isAnyObject [
	^ false
]

{ #category : #testing }
LowcodeClassType >> isClassType [
	^ true
]

{ #category : #testing }
LowcodeClassType >> isConstructorMessage: aSelector [
	| method |
	method := referenced structureClass class lookupSelector: aSelector.
	^ method isNotNil and: [ method hasPragmaNamed: #constructor ]
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
