Class {
	#name : #FFIExternalUnionType,
	#superclass : #FFIExternalStructureType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIExternalUnionType >> accept: aVisitor [
	^ aVisitor visitExternalUnionType: self
]
