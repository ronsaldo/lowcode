Class {
	#name : #FFI,
	#superclass : #Object,
	#category : #'Lowcode-FFI-API'
}

{ #category : #'memory management' }
FFI class >> allocate: size [
	^ self ffiCallout
		function: #(void* (size_t size)) emit:  [ :gen :calloutSpec |
		self pointerSize = 4 ifTrue: [ gen malloc32 ]
			ifFalse: [ gen malloc32  ]
	]
]

{ #category : #'memory management' }
FFI class >> free: pointer [
	^ self ffiCallout
		function: #(void (void *pointer)) emit:  [ :gen :calloutSpec |
			gen free
		]
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

{ #category : #'memory management' }
FFI class >> memCopy: source to: dest size: size [
	^ self ffiCallout
		function: #( void (void* dest, void* source, size_t size) ) emit: [ :gen :cs |
			self pointerSize = 4 ifTrue: [ self memcpy32 ]
				ifFalse: [ self memcpy64 ]
		]
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
