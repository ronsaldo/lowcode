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
FFIInt32Type >> lowcode: gen returnValue: calloutSpec [
	gen returnInt32AsOop
]
