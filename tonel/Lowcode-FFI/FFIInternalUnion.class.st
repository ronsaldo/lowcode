Class {
	#name : #FFIInternalUnion,
	#superclass : #FFIInternalStructure,
	#type : #bytes,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIInternalUnion class >> asFFIExternalType: gen [
	^ FFIInternalUnionType objectClass: self
]

{ #category : #accessing }
FFIInternalUnion class >> fieldsClass [
	^ FFIUnionFields
]
