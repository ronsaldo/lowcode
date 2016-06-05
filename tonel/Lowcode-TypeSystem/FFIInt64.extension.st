Extension { #name : #FFIInt64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt64FromMemory
]
