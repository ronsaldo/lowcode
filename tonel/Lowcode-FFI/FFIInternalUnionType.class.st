Class {
	#name : #FFIInternalUnionType,
	#superclass : #FFIInternalStructureType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInternalUnionType >> accept: aVisitor [
	^ aVisitor visitInternalUnionType: self
]
