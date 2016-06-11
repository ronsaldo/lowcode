Extension { #name : #FFIInt8 }

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
