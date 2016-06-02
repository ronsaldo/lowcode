Extension { #name : #CompiledMethod }

{ #category : #'*Lowcode-TypeSystem' }
CompiledMethod >> lowcodeReturnType [
	(self hasPragmaNamed: #returnType:) ifTrue: [ 
		^ (self pragmaAt: #returnType:) arguments first asLowcodeTypeAtEnvironment: self methodClass.
	].

	^ LowcodeType object
]
