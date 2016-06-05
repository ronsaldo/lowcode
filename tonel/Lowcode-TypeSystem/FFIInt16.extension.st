Extension { #name : #FFIInt16 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt16 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt16FromMemory
]
