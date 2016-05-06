Class {
	#name : #LowcodeObjectType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #comparing }
LowcodeObjectType >> = other [
	^ self class = other class
]

{ #category : #comparing }
LowcodeObjectType >> hash [
	^ self class hash
]

{ #category : #initialization }
LowcodeObjectType >> initialize [
	super initialize.
	self name: #object.
]

{ #category : #testing }
LowcodeObjectType >> isObject [
	^ true
]

{ #category : #printing }
LowcodeObjectType >> printOn: aStream [
	aStream print: #object
]
