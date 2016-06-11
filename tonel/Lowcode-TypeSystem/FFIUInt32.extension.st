Extension { #name : #FFIUInt32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToUInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeUint32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeLocalStore: aMethodBuilder name: localName [
	aMethodBuilder
		lowcodeDuplicateInt32;
		lowcodeStoreLocalInt32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalUInt32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeMemoryStoreAndPop: aMethodBuilder [
	aMethodBuilder
		lowcodeStoreInt32ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadUInt32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateInt32;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreInt32ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadUInt32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> readFromInternalStructure: anObject at: offset [
	^ (((anObject byteAt: offset + 1)
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8))
		bitOr: ((anObject byteAt: offset + 3) bitShift: 16))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 24)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt32 >> write: aValue internalStructure: anObject at: offset [
	anObject byteAt: offset + 1 put: (aValue bitAnd: 16rff).
	anObject byteAt: offset + 2 put: ((aValue bitShift: -8) bitAnd: 16rff).
	anObject byteAt: offset + 3 put: ((aValue bitShift: -16) bitAnd: 16rff).
	anObject byteAt: offset + 4 put: ((aValue bitShift: -24) bitAnd: 16rff).
	^ aValue
]
