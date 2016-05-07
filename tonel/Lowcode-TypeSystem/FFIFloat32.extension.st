Extension { #name : #FFIFloat32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeAdd: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Add
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToFloat32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeFloat32ToOop
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeDivide: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Div
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeDuplicate: aMethodBuilder [
	aMethodBuilder lowcodeDuplicateFloat32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeEquals: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Equal
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeGreaterEqualThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat32GreatEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeGreaterThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Great
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeLessEqualThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat32LessEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeLessThan: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Less
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeLocalStore: aMethodBuilder name: localName [
	aMethodBuilder lowcodeStoreLocalFloat32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalFloat32: localName
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeMultiply: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Mul
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeNotEquals: aMethodBuilder [
	aMethodBuilder lowcodeFloat32NotEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodePop: aMethodBuilder [
	aMethodBuilder lowcodePopFloat32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		lowcodeDuplicateFloat32;
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStoreFloat32ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeSubtract: aMethodBuilder [
	aMethodBuilder lowcodeFloat32Sub
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadFloat32FromMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> readFromInternalStructure: anObject at: offset [
	^ Float fromIEEE32Bit: ((((anObject basicAt: offset + 1)
		bitOr: ((anObject basicAt: offset + 2) bitShift: 8))
		bitOr: ((anObject basicAt: offset + 3) bitShift: 16))
		bitOr: ((anObject basicAt: offset + 4) bitShift: 24))
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat32 >> write: aValue internalStructure: anObject at: offset [
	| encodedValue |
	encodedValue := aValue asIEEE32BitWord.
	anObject basicAt: offset + 1 put: (encodedValue bitAnd: 16rff).
	anObject basicAt: offset + 2 put: ((encodedValue bitShift: -8) bitAnd: 16rff).
	anObject basicAt: offset + 3 put: ((encodedValue bitShift: -16) bitAnd: 16rff).
	anObject basicAt: offset + 4 put: ((encodedValue bitShift: -24) bitAnd: 16rff).
	^ aValue
]
