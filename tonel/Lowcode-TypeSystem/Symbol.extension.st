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
