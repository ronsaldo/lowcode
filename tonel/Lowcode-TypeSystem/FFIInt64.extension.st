Extension { #name : #FFIInt64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt64ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalInt64: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadInt64FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt64 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadInt64FromMemory
]
