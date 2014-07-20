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

{ #category : #'as yet unclassified' }
FFIUInt32Type >> lowcode: gen returnValue: calloutSpec [
	gen returnUInt32AsOop
]
