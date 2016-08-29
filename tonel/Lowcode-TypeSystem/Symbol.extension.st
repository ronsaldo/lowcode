Extension { #name : #Symbol }

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> &=> aType [
	^ (NativeFieldSlot named: self) type: (aType asLowcodeTypeAtEnvironment: thisContext sender receiver class)
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> asLowcodeType [
	^ self asLowcodeTypeAtEnvironment: thisContext sender receiver class
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> asLowcodeTypeAtEnvironment: anEnvironment [
	^ LowcodeNativeType forSymbol: self atEnvironment: anEnvironment
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> nativeNew [
	^ self asLowcodeType nativeNew
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> nativeNew: size [
	^ self asLowcodeType nativeNew: size
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> nativeNullPointer [
	^ self asLowcodeType nativeNullPointer
]

{ #category : #'*Lowcode-TypeSystem' }
Symbol >> nativePointer: address [
	^ self asLowcodeType nativePointer: address
]
