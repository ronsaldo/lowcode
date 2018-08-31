Extension { #name : #EncoderForSistaV1 }

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
