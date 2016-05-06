Extension { #name : #FFIUInt16 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> readFromInternalStructure: anObject at: offset [
	^ (anObject basicAt: offset + 1)
		bitOr: ((anObject basicAt: offset + 2) bitShift: 8)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> write: aValue internalStructure: anObject at: offset [
	anObject basicAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject basicAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	^ aValue
]