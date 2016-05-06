"
I am the base class of a native field type.
"
Class {
	#name : #LowcodeNativeType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #testing }
LowcodeNativeType >> isNative [
	^ true
]

{ #category : #printing }
LowcodeNativeType >> printOn: aStream [
	aStream print: name
]
