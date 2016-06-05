Extension { #name : #FFIUInt16 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateInt32;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreInt16ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadUInt16FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> readFromInternalStructure: anObject at: offset [
	^ (anObject byteAt: offset + 1)
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt16 >> write: aValue internalStructure: anObject at: offset [
	anObject byteAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject byteAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	^ aValue
]
