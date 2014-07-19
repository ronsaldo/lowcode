Class {
	#name : #FFIVoidType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIVoidType >> visit: visitor [
	^ visitor visitVoidType: self
]
