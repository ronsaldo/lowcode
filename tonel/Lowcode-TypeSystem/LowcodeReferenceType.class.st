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

{ #category : #comparing }
LowcodeReferenceType >> = other [
	^ self class = other class and: [ referenced = other referenced ]
]

{ #category : #accessing }
LowcodeReferenceType >> fieldOffset: fieldName [
	^ referenced fieldOffset: fieldName
]

{ #category : #accessing }
LowcodeReferenceType >> fieldType: aFieldName [
	^ referenced fieldType: aFieldName
]

{ #category : #comparing }
LowcodeReferenceType >> hash [
	^ self class hash bitXor: referenced hash
]

{ #category : #testing }
LowcodeReferenceType >> isAccessorMessage: selector [
	^ referenced isAccessorMessage: selector
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
LowcodeReferenceType >> referenced: aLowcodeType [
	self assert: aLowcodeType isReferenceType not.
	referenced := aLowcodeType
]

{ #category : #'type decorators' }
LowcodeReferenceType >> withoutReference [
	^ referenced
]
