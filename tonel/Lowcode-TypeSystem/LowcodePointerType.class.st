Class {
	#name : #LowcodePointerType,
	#superclass : #LowcodeValueType,
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

{ #category : #accessing }
LowcodePointerType >> extraClassDependencies [
	^ pointed extraClassDependencies
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
