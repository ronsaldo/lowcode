Extension { #name : #OCSelfVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCSelfVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ semanticAnalyzer selfType
]
