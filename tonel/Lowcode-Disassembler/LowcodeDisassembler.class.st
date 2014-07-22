Class {
	#name : #LowcodeDisassembler,
	#superclass : #Object,
	#instVars : [
		'rawStream',
		'allInstructions',
		'pcMap',
		'extendA',
		'extendB',
		'literals',
		'currentPosition',
		'currentInstructionPosition',
		'blockEntries',
		'disassembledMethod'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #'as yet unclassified' }
LowcodeDisassembler class >> forAssembledMethod: assembledMethod [
	^ self new assembledMethod: assembledMethod
]

{ #category : #'basic block detection' }
LowcodeDisassembler >> addBlockEntry: pc [
	| block |
	blockEntries at: pc ifPresent: [:b | ^ b ].

	block := LoDisBasicBlock new.
	disassembledMethod addBasicBlock: block.
	(self instructionAtPC: pc) ownerBlock: block.
	blockEntries at: pc put: block.
	^ block
	
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> addInstruction: instruction [
	instruction extendA: extendA;
		extendB: extendB;
		pc: currentInstructionPosition.

	"Add the instruction"
	allInstructions ifNotEmpty: [ allInstructions last nextPC: instruction pc ].
	allInstructions add: instruction.
	pcMap at: instruction pc put: instruction.
	
	"Reset the ExtA and ExtB. Store the next instruction position."
	extendA := 0.
	extendB := 0.
	currentInstructionPosition := currentPosition.
]

{ #category : #accessing }
LowcodeDisassembler >> assembledMethod: assembledMethod [
	self rawInstructions: assembledMethod instructions.
	self literals: assembledMethod literals.
]

{ #category : #'basic block detection' }
LowcodeDisassembler >> decodeBlocks [
	disassembledMethod := LowcodeDisassembledMethod new.
	disassembledMethod literals: literals.
	
	self detectBlockEntries;
		putInstructionsInBlocks.
	
	^ disassembledMethod
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeInlinePrimitive: opcode [
	| firstByte secondByte primitiveIndex |
	firstByte := self fetchByte.
	secondByte := self fetchByte.
	primitiveIndex := firstByte + ((secondByte & (16r80 bitInvert32) )*256).
	
	(secondByte & 16r80) ~~ 0 ifTrue: [
		^ self addInstruction: (LoDisLowcodeInstruction new: primitiveIndex)
	] ifFalse: [ 
		^ self addInstruction: (LoDisSistaInstruction new: opcode with: firstByte with: secondByte)
	]

]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeInstruction [
	| opcode |
	opcode := self fetchByte.
	opcode < 224 ifTrue: [ ^ self decodeSistaOneByteInstruction: opcode ].
	opcode < 248 ifTrue: [ ^ self decodeSistaTwoBytesInstruction: opcode ].
	^ self decodeSistaThreeBytesInstruction: opcode
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeInstructions [
	[ rawStream atEnd ] whileFalse: [ self decodeInstruction ]
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeSistaOneByteInstruction: opcode [
	self addInstruction: (LoDisSistaInstruction new: opcode)
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeSistaThreeBytesInstruction: opcode [
	opcode == 248 ifTrue: [ ^ self decodeInlinePrimitive: opcode ].
	self addInstruction: (LoDisSistaInstruction new: opcode with: self fetchByte with: self fetchByte)
]

{ #category : #'instruction decoding' }
LowcodeDisassembler >> decodeSistaTwoBytesInstruction: opcode [
	opcode == 224 ifTrue: [ extendA := (extendA*256) + self fetchByte. ^ self].
	opcode == 225 ifTrue: [ extendB := (extendB*256) + self fetchByte. ^ self ].
	self addInstruction: (LoDisSistaInstruction new: opcode with: (rawStream next))
]

{ #category : #'basic block detection' }
LowcodeDisassembler >> detectBlockEntries. [
	self addBlockEntry: allInstructions first pc.
	allInstructions do: [ :ins |
		ins isJump ifTrue: [
			ins jumpBlock: (self addBlockEntry: (ins jumpAddress: literals))
		].
		ins isBranch ifTrue: [
			ins nextBlock: (self addBlockEntry: ins nextAddress).
			ins branchBlock: (self addBlockEntry: (ins branchAddress: literals)).
		].
	]
]

{ #category : #public }
LowcodeDisassembler >> disassemble [
	self decodeInstructions.
	^ self decodeBlocks
]

{ #category : #initialization }
LowcodeDisassembler >> fetchByte [
	currentPosition := currentPosition + 1.
	^ rawStream next
]

{ #category : #initialization }
LowcodeDisassembler >> initialize [
	allInstructions := OrderedCollection new.
	pcMap := IdentityDictionary new.
	blockEntries := IdentityDictionary new.
	extendA := 0.
	extendB := 0.
	currentPosition := 0.
	currentInstructionPosition := 0.
]

{ #category : #'basic block detection' }
LowcodeDisassembler >> instructionAtPC: pc [
	^ pcMap at: pc ifAbsent: [ self error: 'Invalid jump address specified' ]	
]

{ #category : #accessing }
LowcodeDisassembler >> literals: arrayWithLiterals [
	literals := arrayWithLiterals copy
	
]

{ #category : #'basic block detection' }
LowcodeDisassembler >> putInstructionsInBlocks [
	| currentBlock ownerBlock |
	currentBlock := nil.
	allInstructions do: [ :ins |
		ownerBlock := ins ownerBlock.
		ownerBlock ~~ nil ifTrue: [ 
			(currentBlock notNil and: [ currentBlock instructions last isBranchOrTerminator not ]) ifTrue: [ 
				currentBlock addInstruction: (LoDisNextBlock new: ownerBlock)
			].
		
			currentBlock := ownerBlock.
		].
		currentBlock addInstruction: ins
	]
]

{ #category : #accessing }
LowcodeDisassembler >> rawInstructions: rawInstructions [
	rawStream := rawInstructions readStream
]
