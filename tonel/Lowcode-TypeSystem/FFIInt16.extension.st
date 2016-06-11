Extension { #name : #FFIInt16 }

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
