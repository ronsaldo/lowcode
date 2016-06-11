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
