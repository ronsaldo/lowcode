Extension { #name : #Object }

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICheckPointerOfType: type [
	self error: 'Cannot get a pointer from myself.'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICoerceInteger [
	 self error: 'expected an integer argument'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFIIsAlienPointer [
	^ false
]
