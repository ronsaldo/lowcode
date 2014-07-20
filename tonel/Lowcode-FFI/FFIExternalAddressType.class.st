Class {
	#name : #FFIExternalAddressType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen coerceArgumentValue: calloutSpec [
	gen oopToPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen returnValue: calloutSpec [
	gen returnPointerAsOop: (gen addLiteral: FFIExternalAddress)
]
