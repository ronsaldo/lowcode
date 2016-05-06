Extension { #name : #OCTempVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCTempVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ semanticAnalyzer typeForTemporary: self
]
