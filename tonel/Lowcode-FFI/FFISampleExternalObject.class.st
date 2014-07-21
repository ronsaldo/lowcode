Class {
	#name : #FFISampleExternalObject,
	#superclass : #FFIExternalObject,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'instance creation' }
FFISampleExternalObject class >> new: size [
	^ self ffiCall: #(FFISampleExternalObject malloc(size_t size)) module: 0
]

{ #category : #'initialize-release' }
FFISampleExternalObject >> free [
	^ self ffiCall: #(void free(self)) module: 0
]
