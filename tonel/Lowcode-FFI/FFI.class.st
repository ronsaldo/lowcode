Class {
	#name : #FFI,
	#superclass : #Object,
	#classVars : [
		'CurrentFFISession',
		'LoadedModulesDictionary'
	],
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

{ #category : #'retrieving symbols' }
FFI class >> checkSession [
	CurrentFFISession ~~ Smalltalk session ifTrue: [ 
		CurrentFFISession := Smalltalk session.
		LoadedModulesDictionary := Dictionary new.
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
	^ self loadSymbol: aName fromModule: 0.
	"^ NativeBoost loadFunction: aName from: aPluginName"

]

{ #category : #'retrieving symbols' }
FFI class >> loadModule: aModuleNameOrHandle [
	| handle |
	aModuleNameOrHandle isInteger ifTrue: [ ^ FFIExternalAddress value: aModuleNameOrHandle ].
	self checkSession.
	^ LoadedModulesDictionary at: aModuleNameOrHandle ifAbsent: [
		handle := self primitiveDLOpen: FFIExternalAddress path: (self slowStringEncode: aModuleNameOrHandle).
		handle ifNotNil: [ LoadedModulesDictionary at: aModuleNameOrHandle put: handle ].
		^ handle
	]
]

{ #category : #'retrieving symbols' }
FFI class >> loadSymbol: aName fromModule: aModuleNameOrHandle [
	"This method is used to load dynamically a symbol from a module."
	| moduleHandle symbolPointer |
	
	"Load the module."
	moduleHandle := self loadModule: aModuleNameOrHandle.
	moduleHandle ifNil: [ ^ nil ].
	 
	"Retrieve the symbol from the module"
	symbolPointer := self primitiveDLSym: FFIExternalAddress handle: moduleHandle symbol: aName.
	symbolPointer ifNil:[ ^ nil].
	^ symbolPointer
]

{ #category : #'memory management' }
FFI class >> memCopy: source to: dest size: size [
	^ self ffiCallout
		function: #( void (void* dest, void* source, size_t size) ) emit: [ :gen :cs |
			self pointerSize = 4 ifTrue: [ gen memcpy32 ]
				ifFalse: [ gen memcpy64 ]
		]
]

{ #category : #'platform querying' }
FFI class >> pointerSize [
	^ FFIPlatform current pointerSize
]

{ #category : #primitives }
FFI class >> primitiveDLClose: handle [
	<primitive: #primitiveDLClose module: #LowcodeOSPlugin>
	self error: 'primitive failed'
]

{ #category : #primitives }
FFI class >> primitiveDLOpen: pointerClass path: path [
	<primitive: #primitiveDLOpen module: #LowcodeOSPlugin>
	self error: 'primitive failed'
]

{ #category : #primitives }
FFI class >> primitiveDLSym: pointerClass handle: handle symbol: symbol [
	<primitive: #primitiveDLSym module: #LowcodeOSPlugin>
	self error: 'primitive failed'
]

{ #category : #private }
FFI class >> slowStringEncode: string [
	| bytes size |
	size := string byteSize.
	bytes := ByteArray new: size + 1.
	bytes replaceFrom: 1 to: size with: string startingAt: 1.
	^ bytes
]

{ #category : #'platform querying' }
FFI class >> uniqueSessionIdentifier [
	^ Lowcode here: [ :gen |
		gen pushSessionIdentifier;
			returnUInt32
	]
]
