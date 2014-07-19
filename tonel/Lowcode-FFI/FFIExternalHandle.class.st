Class {
	#name : #FFIExternalHandle,
	#superclass : #Object,
	#type : #bytes,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'instance creation' }
FFIExternalHandle class >> new [
	^ self basicNew: (FFI pointerSize)
]
