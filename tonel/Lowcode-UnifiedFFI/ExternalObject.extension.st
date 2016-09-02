Extension { #name : #ExternalObject }

{ #category : #'*Lowcode-UnifiedFFI' }
ExternalObject >> lowcodeFFICheckPointerOfType: type [
	self flag: 'Try to perform more type checking.'.
	^ self getHandle
]
