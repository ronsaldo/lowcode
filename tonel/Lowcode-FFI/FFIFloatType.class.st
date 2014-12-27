Class {
	#name : #FFIFloatType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'as yet unclassified' }
FFIFloatType >> callbackValueReturnType [
	^ CallbackReturnTypeDouble
]
