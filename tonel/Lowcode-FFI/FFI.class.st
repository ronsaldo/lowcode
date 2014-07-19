Class {
	#name : #FFI,
	#superclass : #Object,
	#category : #'Lowcode-FFI-API'
}

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

{ #category : #'as yet unclassified' }
FFI class >> pointerSize [
	^ FFIPlatform current pointerSize
]

{ #category : #'as yet unclassified' }
FFI class >> uniqueSessionIdentifier [
	^ Lowcode here: [ :gen |
		gen pushSessionIdentifier;
			returnUInt32
	]
]
