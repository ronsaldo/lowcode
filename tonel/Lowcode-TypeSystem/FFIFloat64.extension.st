Extension { #name : #FFIFloat64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeAdd: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Add
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToFloat64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeFloat64ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeDivide: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Div
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeDuplicate: aMethodBuilder [
	aMethodBuilder lowcodeDuplicateFloat64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeEquals: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Equal
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeGreaterEqualThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat64GreatEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeGreaterThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Great
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeLessEqualThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat64LessEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeLessThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Less
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeLocalStore: aMethodBuilder name: localName [
	aMethodBuilder
		lowcodeDuplicateFloat64;
		lowcodeStoreLocalFloat64: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalFloat64: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeMultiply: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Mul
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeNegated: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Neg
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeNotEquals: aMethodBuilder [
	aMethodBuilder lowcodeFloat64NotEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodePop: aMethodBuilder [
	aMethodBuilder lowcodePopFloat64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeSqrt: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Sqrt
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateFloat64;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreFloat64ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeSubtract: aMethodBuilder [
	aMethodBuilder lowcodeFloat64Sub
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadFloat64FromMemory
]
