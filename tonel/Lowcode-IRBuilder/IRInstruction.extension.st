Extension { #name : #IRInstruction }

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction >> isJustPushing [
	^ false
]

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction >> isLowcodeInstruction [
	^ false
]

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction class >> lowcodeInstruction: opcode [
	^ IRLowcodeInstruction new
		opcode: opcode;
		yourself
]

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction class >> lowcodeInstruction: opcode extendA: extendA [
	^ IRLowcodeInstruction new
		opcode: opcode;
		extendA: extendA;
		yourself
]

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction class >> lowcodeInstruction: opcode extendA: extendA extendB: extendB [
	^ IRLowcodeInstruction new
		opcode: opcode;
		extendA: extendA;
		extendB: extendB;
		yourself
]

{ #category : #'*Lowcode-IRBuilder' }
IRInstruction class >> lowcodeInstruction: opcode literal: literal [
	^ IRLowcodeInstruction new
		opcode: opcode;
		extendA: literal;
		hasLiteral: true;
		yourself
]
