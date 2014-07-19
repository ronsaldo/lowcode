Class {
	#name : #FFIInt16Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt16Type >> accept: visitor [
	^ visitor visitInt16Type: self
]
