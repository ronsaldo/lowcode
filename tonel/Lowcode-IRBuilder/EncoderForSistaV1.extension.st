Extension { #name : #EncoderForSistaV1 }

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 >> genCallInlinePrimitive: primitiveIndex [
	"248		11111000	i i i i i i i i	1jjjjjjj		Call Primitive #iiiiiiii + (jjjjjjj * 256)"
	"N.B. We could have made CallPrimitive a 2-byte code taking an extension, but that would
	 complicate the VM's determination of the primitive number and the primitive error code
	 store since the extension, being optional, would make the sequence variable length."
	(primitiveIndex < 1 or: [primitiveIndex > 65535]) ifTrue:
		[self outOfRangeError: 'primitive index' index: primitiveIndex range: 1 to: 65535].
	stream
		nextPut: 248;
		nextPut: (primitiveIndex bitAnd: 255);
		nextPut: ((primitiveIndex bitShift: -8) bitOr: 128)
]

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 >> genLowcodeInstruction: instruction [
	instruction extendA ifNotNil: [ self genUnsignedMultipleExtendA: instruction extendA. ].
	instruction extendB ifNotNil: [ self genLowcodeSignedMultipleExtendB: instruction extendB ].
	
	self genCallInlinePrimitive: instruction opcode + (1*8192).
]

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 >> genLowcodeInstruction: instruction literal: literalIndex [
	self genUnsignedMultipleExtendA: literalIndex.
	instruction extendB ifNotNil: [ self genLowcodeSignedMultipleExtendB: instruction extendB ].
	
	self genCallInlinePrimitive: instruction opcode + (1*8192).
]

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 >> genLowcodeSignedMultipleExtendB: value [
	(value between: -128 and: 127) ifFalse:
		[self genLowcodeSignedMultipleExtendB: (value bitShift: -8)].
	"225		11100001	sbbbbbbb	Extend B (Ext B = Ext B prev * 256 + Ext B)"
	stream
		nextPut: 225;
		nextPut: (value bitAnd: 16rFF)
]

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 class >> getInlinePrimitiveName: primitiveIndex [
	| bytecodeSet actualPrimitiveIndex|
	bytecodeSet := (primitiveIndex >> 13) & 3.
	actualPrimitiveIndex := primitiveIndex & 8191.

	bytecodeSet = 1 ifTrue: [
		^ IRLowcodeInstruction mnemonicForPrimitiveIndex: actualPrimitiveIndex
	].

	^ nil
]

{ #category : #'*Lowcode-IRBuilder' }
EncoderForSistaV1 class >> stackDeltaForPrimitive: primitiveIndex in: method [
	"Answer the stack delta for the callPrimitive: bytecode (see my class comment).
	 There is no delta for non-inlined primitives (its implicitly 0 - method numArgs).
	 Inlined primitives are grouped by the thousand by argument count, 32 args max ;-)."
	^primitiveIndex < 32678
		ifTrue: [0]
		ifFalse: [
			| bytecodeSet actualPrimitiveIndex|
			bytecodeSet := (primitiveIndex >> 13) & 3.
			actualPrimitiveIndex := primitiveIndex & 8191.

			bytecodeSet = 1 ifTrue: [
				| arity |
				arity := actualPrimitiveIndex // 1000.
				(arity >= 16 ifTrue: [ arity - 33 ]
					ifFalse: [ arity - 1]) negated
			] ifFalse: [ 
				actualPrimitiveIndex // 1000
			] 
	]
]
