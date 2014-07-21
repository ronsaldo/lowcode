Class {
	#name : #FFIInternalStructureType,
	#superclass : #FFIExternalType,
	#instVars : [
		'objectClass'
	],
	#category : #'Lowcode-FFI-Types'
}

{ #category : #accessing }
FFIInternalStructureType class >> objectClass: aClass [
	^ self new objectClass: aClass
]

{ #category : #visitor }
FFIInternalStructureType >> accept: aVisitor [
	^ aVisitor visitInternalStructureType: self
]

{ #category : #'lowcode marshalling' }
FFIInternalStructureType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIInternalStructureType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Class verification can be skipped, if loader loads receiver"
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	gen firstIndexableFieldPointer
]
