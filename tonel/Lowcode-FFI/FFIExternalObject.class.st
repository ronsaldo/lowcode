Class {
	#name : #FFIExternalObject,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIExternalObject class >> asFFIExternalType: gen [
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'instance creation' }
FFIExternalObject class >> null [
	^ self new
]

{ #category : #accessing }
FFIExternalObject >> handle [
	^ handle value
]

{ #category : #accessing }
FFIExternalObject >> handle: anUint [
	handle value: anUint
]

{ #category : #initialization }
FFIExternalObject >> initialize [
	handle := NBExternalHandle new
]

{ #category : #testing }
FFIExternalObject >> isNull [
	^ handle value = 0
]

{ #category : #printing }
FFIExternalObject >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '( 0x';
		nextPutAll: (handle value printStringBase: 16);
		space;
		nextPut: $)
]
