Extension { #name : #Object }

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICheckPointerOfType: type [
	self error: 'Cannot get a pointer from myself.'
]
