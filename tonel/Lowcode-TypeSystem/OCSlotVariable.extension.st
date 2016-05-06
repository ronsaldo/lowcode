Extension { #name : #OCSlotVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ slot lowcodeType
]
