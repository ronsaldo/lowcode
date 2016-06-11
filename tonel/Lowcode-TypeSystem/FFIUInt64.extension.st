Extension { #name : #FFIUInt64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeBitInvert: aMethodBuilder [
	aMethodBuilder lowcodeNot64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeDuplicate: aMethodBuilder [
	aMethodBuilder lowcodeDuplicateInt64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalUInt64: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeMemoryStoreAndPop: aMethodBuilder [
	aMethodBuilder
		lowcodeStoreInt64ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt64FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeNegated: aMethodBuilder [
	aMethodBuilder lowcodeNeg64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodePop: aMethodBuilder [
	aMethodBuilder lowcodePopInt64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateInt64;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreInt64ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadUInt64FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> readFromInternalStructure: anObject at: offset [
	^ (((((((anObject byteAt: offset + 1)
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8))
		bitOr: ((anObject byteAt: offset + 3) bitShift: 16))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 24))
		bitOr: ((anObject byteAt: offset + 5) bitShift: 32))
		bitOr: ((anObject byteAt: offset + 6) bitShift: 40))
		bitOr: ((anObject byteAt: offset + 7) bitShift: 48))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 56)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt64 >> write: aValue internalStructure: anObject at: offset [
	anObject byteAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject byteAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	anObject byteAt: offset + 3 put: ((aValue bitShift: -16) bitAnd: 16rff).
	anObject byteAt: offset + 4 put: ((aValue bitShift: -24) bitAnd: 16rff).
	anObject byteAt: offset + 5 put: ((aValue bitShift: -32) bitAnd: 16rff).
	anObject byteAt: offset + 6 put: ((aValue bitShift: -40) bitAnd: 16rff).
	anObject byteAt: offset + 7 put: ((aValue bitShift: -48) bitAnd: 16rff).
	anObject byteAt: offset + 8 put: ((aValue bitShift: -56) bitAnd: 16rff).
	^ aValue
]
