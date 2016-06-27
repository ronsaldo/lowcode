Extension { #name : #FFIUInt8 }

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopSmallIntegerToInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeUint32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeLocalStore: aMethodBuilder name: localName [
	aMethodBuilder
		lowcodeDuplicateInt32;
		lowcodeStoreLocalInt32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalUInt8: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeMemoryStoreAndPop: aMethodBuilder [
	aMethodBuilder
		lowcodeStoreInt8ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadUInt8FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateInt32;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreInt8ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadUInt8FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> readFromInternalStructure: anObject at: offset [
	^ anObject byteAt: offset + 1
]

{ #category : #'*Lowcode-TypeSystem' }
FFIUInt8 >> write: aValue internalStructure: anObject at: offset [
	anObject byteAt: offset + 1 put: (aValue bitAnd: 16rff).
	^ aValue
]
