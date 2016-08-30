Extension { #name : #Integer }

{ #category : #'*Lowcode-TypeSystem' }
Integer >> asLowcodeType [
	^ self asLowcodeTypeAtEnvironment: thisContext sender receiver class
]

{ #category : #'*Lowcode-TypeSystem' }
Integer >> asLowcodeTypeAtEnvironment: environment [
	^ LowcodePlaceHolderType new index: self
]

{ #category : #'*Lowcode-TypeSystem' }
Integer >> asNativePointerBoxWithType: pointedType [
	^ NativePointerBox type: pointedType pointer: (ExternalAddress fromAddress: self)
]
