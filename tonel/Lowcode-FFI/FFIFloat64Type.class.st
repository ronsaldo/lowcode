Class {
	#name : #FFIFloat64Type,
	#superclass : #FFIFloatType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIFloat64Type >> accept: visitor [
	^ visitor visitFloat64Type: self
]

{ #category : #'lowcode marshalling' }
FFIFloat64Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToFloat64
]

{ #category : #'lowcode marshalling' }
FFIFloat64Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen float64ToOop 
]

{ #category : #'lowcode marshalling' }
FFIFloat64Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadFloat64FromMemory
]

{ #category : #'lowcode marshalling' }
FFIFloat64Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeFloat64ToMemory
]

{ #category : #accessing }
FFIFloat64Type >> valueSize [
	^ 8
]
