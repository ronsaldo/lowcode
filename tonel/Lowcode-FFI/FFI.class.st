Class {
	#name : #FFI,
	#superclass : #Object,
	#category : #'Lowcode-FFI-API'
}

{ #category : #'memory management' }
FFI class >> allocate: size [
	^ self ffiCall: #(void* malloc(size_t size)) module: 0
]

{ #category : #'memory management' }
FFI class >> free: pointer [
	^ self ffiCall: #(void free(void* pointer)) module: 0
]

{ #category : #'retrieving symbols' }
FFI class >> loadFunction: aName from: aPluginName [
	"FIXME: Use a proper interpreter plugin."
	^ NativeBoost loadFunction: aName from: aPluginName
]

{ #category : #'retrieving symbols' }
FFI class >> loadSymbol: aName fromModule: aModuleNameOrHandle [
	"FIXME: Use a proper interpreter plugin."
	^ NativeBoost loadSymbol: aName fromModule: aModuleNameOrHandle
]

{ #category : #'platform querying' }
FFI class >> pointerSize [
	^ FFIPlatform current pointerSize
]

{ #category : #'platform querying' }
FFI class >> uniqueSessionIdentifier [
	^ Lowcode here: [ :gen |
		gen pushSessionIdentifier;
			returnUInt32
	]
]
