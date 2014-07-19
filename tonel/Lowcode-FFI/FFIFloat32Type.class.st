Class {
	#name : #FFIFloat32Type,
	#superclass : #FFIFloatType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIFloat32Type >> accept: visitor [
	^ visitor visitFloat32Type: self
]
