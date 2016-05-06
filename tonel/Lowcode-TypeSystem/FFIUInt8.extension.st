Extension { #name : #FFIUInt8 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> readFromInternalStructure: anObject at: offset [
	^ anObject basicAt: offset + 1
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> write: aValue internalStructure: anObject at: offset [
	anObject basicAt: offset + 1 put: (aValue bitAnd: 16rff).
	^ aValue
]
