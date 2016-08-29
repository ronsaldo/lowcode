Extension { #name : #FFIFloat64 }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcode: methodBuilder pushLiteral: literalValue [
	literalValue = 0.0 ifTrue: [ ^ methodBuilder lowcodePushZeroFloat64 ].
	literalValue = 1.0 ifTrue: [ ^ methodBuilder lowcodePushOneFloat64 ].
	methodBuilder
		pushLiteral: literalValue asFloat;
		lowcodeOopToFloat64
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcode: methodBuilder toFloatSize: floatSize [
	floatSize = 4 ifTrue: [ methodBuilder lowcodeFloat64ToFloat32 ]
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcode: methodBuilder toIntSize: intSize [
	intSize = 8 ifTrue: [
		methodBuilder lowcodeFloat64ToInt64
	] ifFalse: [
		methodBuilder lowcodeFloat64ToInt32.
		intSize = 2 ifTrue: [ methodBuilder lowcodeTruncate32To16 ].
		intSize = 1 ifTrue: [ methodBuilder lowcodeTruncate32To8 ].
	].
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcode: methodBuilder toUIntSize: intSize [
	intSize = 8 ifTrue: [
		methodBuilder lowcodeFloat64ToUInt64
	] ifFalse: [
		methodBuilder lowcodeFloat64ToUInt32.
		intSize = 2 ifTrue: [ methodBuilder lowcodeTruncate32To16 ].
		intSize = 1 ifTrue: [ methodBuilder lowcodeTruncate32To8 ].
	].
]

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
FFIFloat64 >> emitLowcodeMemoryStoreAndPop: aMethodBuilder [
	aMethodBuilder
		lowcodeStoreFloat64ToMemory
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> emitLowcodeMemoryValue: aMethodBuilder [
	aMethodBuilder
		lowcodeLoadFloat64FromMemory
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

{ #category : #'*Lowcode-TypeSystem' }
FFIFloat64 >> readFromInternalStructure: anObject at: offset [
	^ Float fromIEEE64Bit: ((((((((anObject byteAt: offset + 1)
		bitOr: ((anObject byteAt: offset + 2) bitShift: 8))
		bitOr: ((anObject byteAt: offset + 3) bitShift: 16))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 24))
		bitOr: ((anObject byteAt: offset + 5) bitShift: 32))
		bitOr: ((anObject byteAt: offset + 6) bitShift: 40))
		bitOr: ((anObject byteAt: offset + 7) bitShift: 48))
		bitOr: ((anObject byteAt: offset + 4) bitShift: 56))
]
