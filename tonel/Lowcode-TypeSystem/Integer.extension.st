Extension { #name : #Integer }

{ #category : #'*Lowcode-TypeSystem' }
Integer >> asLowcodeType [
	^ self asLowcodeTypeAtEnvironment: thisContext sender receiver class
]

{ #category : #'*Lowcode-TypeSystem' }
Integer >> asLowcodeTypeAtEnvironment: environment [
	^ LowcodePlaceHolderType new index: self
]
