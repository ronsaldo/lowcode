Extension { #name : #FFIUInt64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> readFromInternalStructure: anObject at: offset [
	^ (((((((anObject basicAt: offset + 1)
		bitOr: ((anObject basicAt: offset + 2) bitShift: 8))
		bitOr: ((anObject basicAt: offset + 3) bitShift: 16))
		bitOr: ((anObject basicAt: offset + 4) bitShift: 24))
		bitOr: ((anObject basicAt: offset + 5) bitShift: 32))
		bitOr: ((anObject basicAt: offset + 6) bitShift: 40))
		bitOr: ((anObject basicAt: offset + 7) bitShift: 48))
		bitOr: ((anObject basicAt: offset + 4) bitShift: 56)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> write: aValue internalStructure: anObject at: offset [
	anObject basicAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject basicAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	anObject basicAt: offset + 3 put: ((aValue bitShift: -16) bitAnd: 16rff).
	anObject basicAt: offset + 4 put: ((aValue bitShift: -24) bitAnd: 16rff).
	anObject basicAt: offset + 5 put: ((aValue bitShift: -32) bitAnd: 16rff).
	anObject basicAt: offset + 6 put: ((aValue bitShift: -40) bitAnd: 16rff).
	anObject basicAt: offset + 7 put: ((aValue bitShift: -48) bitAnd: 16rff).
	anObject basicAt: offset + 8 put: ((aValue bitShift: -56) bitAnd: 16rff).
	^ aValue
]
