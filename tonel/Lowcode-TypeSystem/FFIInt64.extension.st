Extension { #name : #FFIInt64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt64ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalInt64: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt64FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt64FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> readFromInternalStructure: anObject at: offset [
	| result |
	result := (((((((anObject byteAt: offset + 1)
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8))
		bitOr: ((anObject byteAt: offset + 3) bitShift: 16))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 24))
		bitOr: ((anObject byteAt: offset + 5) bitShift: 32))
		bitOr: ((anObject byteAt: offset + 6) bitShift: 40))
		bitOr: ((anObject byteAt: offset + 7) bitShift: 48))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 56).
	^ (result bitAnd: 16r7FFFFFFFFFFFFFFF) - (result bitAnd: 16r8000000000000000)
]
