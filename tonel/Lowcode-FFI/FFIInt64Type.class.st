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
FFIInt64Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToInt64
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen int64ToOop
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt64: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadInt64FromMemory
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt64ToMemory
]

{ #category : #accessing }
FFIInt64Type >> valueSize [
	^ 8
]
