Extension { #name : #ExternalAddress }

{ #category : #'*Lowcode-TypeSystem' }
ExternalAddress >> asNativePointerBoxWithType: pointedType [
	^ NativePointerBox type: pointedType pointer: self
]
