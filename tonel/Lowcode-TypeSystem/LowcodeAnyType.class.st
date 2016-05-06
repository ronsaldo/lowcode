Class {
	#name : #LowcodeAnyType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #comparing }
LowcodeAnyType >> = other [
	^ self class == other class
]

{ #category : #comparing }
LowcodeAnyType >> hash [
	^ self class hash
]

{ #category : #initialization }
LowcodeAnyType >> initialize [
	super initialize.
	self name: #any.
]

{ #category : #testing }
LowcodeAnyType >> isAny [
	^ true
]

{ #category : #printing }
LowcodeAnyType >> printOn: aStream [
	aStream print: #any
]
