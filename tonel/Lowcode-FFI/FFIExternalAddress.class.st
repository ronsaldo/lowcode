Class {
	#name : #FFIExternalAddress,
	#superclass : #FFIExternalHandle,
	#type : #bytes,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIExternalAddress class >> asFFIExternalType: gen [
	^ FFIExternalAddressType new
]

{ #category : #'as yet unclassified' }
FFIExternalAddress class >> null [
	^ self new
]

{ #category : #'as yet unclassified' }
FFIExternalAddress >> free [
	FFI free: self
]
