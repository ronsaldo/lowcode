Class {
	#name : #FFIExternalAddressType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIExternalAddressType >> accept: aVisitor [
	^ aVisitor visitExternalAddressType: self
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen coerceArgumentPointer: calloutSpec [
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: FFIExternalAddress spec: calloutSpec.
	].

	gen firstIndexableFieldPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen coerceArgumentValue: calloutSpec [
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: FFIExternalAddress spec: calloutSpec.
	].

	gen oopToPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen convertValueToOop: calloutSpec [
	gen pointerToOop: (gen addLiteral: FFIExternalAddress)
]

{ #category : #'lowcode marshalling' }
FFIExternalAddressType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #accessing }
FFIExternalAddressType >> valueSize [
	^ FFI pointerSize
]
