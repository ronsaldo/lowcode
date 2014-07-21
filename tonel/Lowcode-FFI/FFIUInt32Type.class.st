Class {
	#name : #FFIUInt32Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt32Type >> accept: visitor [
	^ visitor visitUInt32Type: self
]

{ #category : #visitor }
FFIUInt32Type >> lowcode: gen coerceArgumentValue: calloutSpec [
	gen oopToUInt32.
]

{ #category : #'lowcode marshalling' }
FFIUInt32Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToUInt32
]

{ #category : #'lowcode marshalling' }
FFIUInt32Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen uint32ToOop
]

{ #category : #'lowcode marshalling' }
FFIUInt32Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadUInt32FromMemory 
]

{ #category : #'lowcode marshalling' }
FFIUInt32Type >> lowcode: gen returnValue: calloutSpec [
	gen returnUInt32AsOop
]

{ #category : #'lowcode marshalling' }
FFIUInt32Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt32ToMemory
]

{ #category : #accessing }
FFIUInt32Type >> valueSize [
	^ 4
]
