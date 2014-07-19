Class {
	#name : #FFIFloat64Type,
	#superclass : #FFIFloatType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIFloat64Type >> accept: visitor [
	^ visitor visitFloat64Type: self
]
