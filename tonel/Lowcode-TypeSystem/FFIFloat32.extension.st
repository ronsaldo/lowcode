Extension { #name : #FFIFloat32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePushConstantUInt32: offset;
		lowcodePointerAddOffset32;
		lowcodeLoadFloat32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> readFromInternalStructure: anObject at: offset [
	^ Float fromIEEE32Bit: ((((anObject basicAt: offset + 1)
		bitOr: ((anObject basicAt: offset + 2) bitShift: 8))
		bitOr: ((anObject basicAt: offset + 3) bitShift: 16))
		bitOr: ((anObject basicAt: offset + 4) bitShift: 24))
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> write: aValue internalStructure: anObject at: offset [
	| encodedValue |
	encodedValue := aValue asIEEE32BitWord.
	anObject basicAt: offset + 1 put: (encodedValue bitAnd: 16rff).
	anObject basicAt: offset + 2 put: ((encodedValue bitShift: -8) bitAnd: 16rff).
	anObject basicAt: offset + 3 put: ((encodedValue bitShift: -16) bitAnd: 16rff).
	anObject basicAt: offset + 4 put: ((encodedValue bitShift: -24) bitAnd: 16rff).
	^ aValue
]
