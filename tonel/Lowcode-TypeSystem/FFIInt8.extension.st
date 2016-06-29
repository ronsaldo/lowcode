Extension { #name : #FFIInt8 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalInt8: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt8FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt8FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> readFromInternalStructure: anObject at: offset [
	| result |
	result := (anObject byteAt: offset + 1).
	^ (result bitAnd: 16r7F) - (result bitAnd: 16r80)
]
