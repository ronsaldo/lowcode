Extension { #name : #FFIInt16 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalInt16: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt16FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt16FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> hasLosslessLowcodeConversionForLiteral: literalValue [
	^ literalValue between: -32768 and: 32767
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> readFromInternalStructure: anObject at: offset [
	| result |
	result := (anObject byteAt: offset + 1) 
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8).
	^ (result bitAnd: 16r7FFF) - (result bitAnd: 16r8000)
]
