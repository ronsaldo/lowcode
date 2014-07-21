Class {
	#name : #FFIExternalUnion,
	#superclass : #FFIExternalStructure,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIExternalUnion class >> asFFIExternalType: gen [
	^ FFIExternalUnionType objectClass: self
]

{ #category : #accessing }
FFIExternalUnion class >> fieldsClass [
	^ FFIUnionFields
]
