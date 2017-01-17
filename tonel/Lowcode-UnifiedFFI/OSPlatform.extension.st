Extension { #name : #OSPlatform }

{ #category : #'*Lowcode-UnifiedFFI' }
OSPlatform >> lowcodeABI [
	^ LowcodeABI forCPU: self subtype
]
