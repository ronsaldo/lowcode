Class {
	#name : #FFIUInt64Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt64Type >> accept: visitor [
	^ visitor visitUInt64Type: self
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentInt64
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen coerceArgumentValue: calloutSpec [
	gen oopToUInt64.
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt64: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen returnValue: calloutSpec [
	gen returnUInt64AsOop
]
