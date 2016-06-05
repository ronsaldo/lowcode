Extension { #name : #FFIInt8 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt8 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt8FromMemory
]
