Extension { #name : #Win32Platform }

{ #category : #'*Lowcode-UnifiedFFI' }
Win32Platform >> lowcodeABI [
	self subtype = 'x64' ifTrue: [ ^ LowcodeABI_X64_Windows new ].
	^ super lowcodeABI
]
