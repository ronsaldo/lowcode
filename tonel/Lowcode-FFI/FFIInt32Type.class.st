Class {
	#name : #FFIInt32Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt32Type >> accept: visitor [
	^ visitor visitInt32Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcode: gen coerceArgumentValue: calloutSpec [
	gen oopToInt32

]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToInt32
]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen int32ToOop
]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadInt32FromMemory
]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt32ToMemory
]

{ #category : #accessing }
FFIInt32Type >> valueSize [
	^ 4
]
