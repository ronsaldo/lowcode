"
The FFIOopType is used to represent a raw Smalltalk Object Oriented Pointer. This is a no operation marshaller.

This marshalling is useful when generating user specified code.

The Lowcode marshalling for arguments does nothing. The return values marshalling process just returns the Smalltalk object.

"
Class {
	#name : #FFIOopType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIOopType >> accept: aVisitor [
	^ aVisitor visitOopType: self
]

{ #category : #'lowcode marshalling' }
FFIOopType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Do nothing"
]

{ #category : #'lowcode marshalling' }
FFIOopType >> lowcode: gen convertValueToOop: calloutSpec [
	"Do nothing"
]
