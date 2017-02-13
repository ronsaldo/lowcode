Extension { #name : #Character }

{ #category : #'*Lowcode-UnifiedFFI' }
Character >> lowcodeFFICoerceCharacter [
	^ self charCode
]

{ #category : #'*Lowcode-UnifiedFFI' }
Character >> lowcodeFFICoerceFloat [
	^ self charCode asFloat
]

{ #category : #'*Lowcode-UnifiedFFI' }
Character >> lowcodeFFICoerceInteger [
	^ self charCode
]
