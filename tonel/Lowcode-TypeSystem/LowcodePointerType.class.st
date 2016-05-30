Class {
	#name : #LowcodePointerType,
	#superclass : #LowcodeType,
	#instVars : [
		'pointed'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #accessing }
LowcodePointerType class >> pointed: aType [
	^ self new pointed: aType
]

{ #category : #accessing }
LowcodePointerType >> alignment [
	^ FFIExternalType pointerAlignment
]

{ #category : #testing }
LowcodePointerType >> isPointerType [
	^ true
]

{ #category : #accessing }
LowcodePointerType >> pointed [
	^ pointed
]

{ #category : #accessing }
LowcodePointerType >> pointed: anObject [
	pointed := anObject
]

{ #category : #printing }
LowcodePointerType >> printOn: aStream [
	aStream nextPutAll: '#('; print: pointed; nextPutAll: ' pointer)'
]

{ #category : #accessing }
LowcodePointerType >> size [
	^ FFIExternalType pointerSize
]
