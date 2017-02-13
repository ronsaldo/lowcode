Extension { #name : #Number }

{ #category : #'*Lowcode-UnifiedFFI' }
Number >> lowcodeFFICoerceBoolean [
	 ^ self ~= 0
]

{ #category : #'*Lowcode-UnifiedFFI' }
Number >> lowcodeFFICoerceCharacter [
	^ self asInteger
]

{ #category : #'*Lowcode-UnifiedFFI' }
Number >> lowcodeFFICoerceFloat [
	^ self asFloat
]

{ #category : #'*Lowcode-UnifiedFFI' }
Number >> lowcodeFFICoerceInteger [
	^ self asInteger
]
