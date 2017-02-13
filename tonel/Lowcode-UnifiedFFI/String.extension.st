Extension { #name : #String }

{ #category : #'*Lowcode-UnifiedFFI' }
String >> lowcodeFFICoerceString [
	^ self asByteString
]
