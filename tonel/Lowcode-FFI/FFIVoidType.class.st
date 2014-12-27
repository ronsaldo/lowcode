Class {
	#name : #FFIVoidType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'as yet unclassified' }
FFIVoidType >> callbackValueReturnType [
	^ CallbackReturnTypeWord
]

{ #category : #'lowcode marshalling' }
FFIVoidType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIVoidType >> lowcode: gen returnValue: calloutSpec [
	gen returnReceiver
]

{ #category : #visitor }
FFIVoidType >> visit: visitor [
	^ visitor visitVoidType: self
]
