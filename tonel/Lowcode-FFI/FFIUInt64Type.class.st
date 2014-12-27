Class {
	#name : #FFIUInt64Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt64Type >> accept: visitor [
	^ visitor visitUInt64Type: self
]

{ #category : #'as yet unclassified' }
FFIUInt64Type >> callbackValueReturnType [
	^ CallbackReturnTypeWord64
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
FFIUInt64Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToUInt64
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen uint64ToOop
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt64: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadUInt64FromMemory 
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt64ToMemory
]

{ #category : #accessing }
FFIUInt64Type >> valueSize [
	^ 8
]
