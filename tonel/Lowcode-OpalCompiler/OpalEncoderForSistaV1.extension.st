Extension { #name : #OpalEncoderForSistaV1 }

{ #category : #'*Lowcode-OpalCompiler' }
OpalEncoderForSistaV1 >> genLowcodeInstruction: instruction [
	instruction extendA ifNotNil: [ self genUnsignedMultipleExtendA: instruction extendA ].
	instruction extendB ifNotNil: [ self genLowcodeSignedMultipleExtendA: instruction extendB ].
	instruction label ifNotNil: [ self error: 'Todo' ].
	instruction literal ifNotNil: [ self error: 'Todo' ].
	self genCallInlinePrimitive: instruction opcode.
]
