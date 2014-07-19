Class {
	#name : #FFIInt8Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt8Type >> accept: visitor [
	^ visitor visitInt8Type: self
]
