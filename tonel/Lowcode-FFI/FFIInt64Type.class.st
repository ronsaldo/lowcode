Class {
	#name : #FFIInt64Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt64Type >> accept: visitor [
	^ visitor visitInt64Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentInt64
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen coerceArgumentValue: calloutSpec [
	gen oopToInt64.
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt64: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen returnValue: calloutSpec [
	gen returnInt64AsOop
]
