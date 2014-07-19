Class {
	#name : #FFIUInt8Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt8Type >> accept: visitor [
	^ visitor visitUInt8Type: self
]
