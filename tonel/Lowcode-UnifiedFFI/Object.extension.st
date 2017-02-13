Extension { #name : #Object }

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICheckPointerOfType: type [
	self error: 'Cannot get a pointer from myself.'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICoerceBoolean [
	 self error: 'expected a boolean argument'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICoerceCharacter [
	 self error: 'expected a character argument'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICoerceFloat [
	 self error: 'expected a float argument'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFICoerceInteger [
	 self error: 'expected an integer argument'
]

{ #category : #'*Lowcode-UnifiedFFI' }
Object >> lowcodeFFIIsAlienPointer [
	^ false
]
