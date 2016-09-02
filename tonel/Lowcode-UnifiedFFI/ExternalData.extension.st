Extension { #name : #ExternalData }

{ #category : #'*Lowcode-UnifiedFFI' }
ExternalData >> lowcodeFFICheckPointerOfType: pointerType [
	type = pointerType ifFalse: [ 
		self error: 'Expected pointer of type ' , type printString , ' instead of type ' , pointerType.
	].

	^ self getHandle
]
