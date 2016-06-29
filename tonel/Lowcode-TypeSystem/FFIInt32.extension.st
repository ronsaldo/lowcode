Extension { #name : #FFIInt32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalInt32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> readFromInternalStructure: anObject at: offset [
	| result |
	result := (((anObject byteAt: offset + 1) 
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8))
		bitOr: ((anObject byteAt: offset + 3) bitShift: 16))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 24).
	^ (result bitAnd: 16r7FFFFFFF) - (result bitAnd: 16r80000000)
]
