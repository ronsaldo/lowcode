Class {
	#name : #FFIUInt16Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt16Type >> accept: visitor [
	^ visitor visitUInt16Type: self
]
