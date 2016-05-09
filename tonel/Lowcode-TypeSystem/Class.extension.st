Extension { #name : #Class }

{ #category : #'*Lowcode-TypeSystem' }
Class >> asLowcodeType [
	^ self asLowcodeTypeAtEnvironment: thisContext sender receiver class
]

{ #category : #'*Lowcode-TypeSystem' }
Class >> asLowcodeTypeAtEnvironment: anEnvironment [
	^ LowcodeType object
]
