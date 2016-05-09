Class {
	#name : #LowcodeObjectReferenceType,
	#superclass : #LowcodeObjectType,
	#instVars : [
		'referenced'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeObjectReferenceType class >> referenced: aLowcodeType [
	^ self new referenced: aLowcodeType
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	referenced emitArgumentTypeCheck: aMethodBuilder name: argumentName

]

{ #category : #testing }
LowcodeObjectReferenceType >> isObjectReference [
	^ true
]

{ #category : #printing }
LowcodeObjectReferenceType >> printOn: aStream [
	aStream nextPutAll: '#('; print: referenced; nextPutAll: ' object)'
]

{ #category : #accessing }
LowcodeObjectReferenceType >> referenced [
	^ referenced
]

{ #category : #accessing }
LowcodeObjectReferenceType >> referenced: anObject [
	referenced := anObject
]
