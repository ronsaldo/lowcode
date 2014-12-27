Class {
	#name : #FFIPrimitiveType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'as yet unclassified' }
FFIPrimitiveType >> callbackValueReturnType [
	^ CallbackReturnTypeWord
]
