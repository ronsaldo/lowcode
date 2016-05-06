Extension { #name : #FFIUInt32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> readFromInternalStructure: anObject at: offset [
	^ (((anObject basicAt: offset + 1)
		bitOr: ((anObject basicAt: offset + 2) bitShift: 8))
		bitOr: ((anObject basicAt: offset + 3) bitShift: 16))
		bitOr: ((anObject basicAt: offset + 4) bitShift: 24)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> write: aValue internalStructure: anObject at: offset [
	anObject basicAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject basicAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	anObject basicAt: offset + 3 put: ((aValue bitShift: -16) bitAnd: 16rff).
	anObject basicAt: offset + 4 put: ((aValue bitShift: -24) bitAnd: 16rff).
	^ aValue
]
