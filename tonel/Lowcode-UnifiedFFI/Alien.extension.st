Extension { #name : #Alien }

{ #category : #'*Lowcode-UnifiedFFI' }
Alien >> lowcodeFFIIsAlienPointer [
	^ self sizeField = 0
]
