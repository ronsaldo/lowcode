Extension { #name : #IRInstruction }

{ #category : #'*Lowcode-OpalCompiler' }
IRInstruction >> isLowcodeInstruction [
	^ false
]

{ #category : #'*Lowcode-OpalCompiler' }
IRInstruction class >> lowcodeInstruction: opcode [
	^ IRLowcodeInstruction new
		opcode: opcode;
		yourself
]

{ #category : #'*Lowcode-OpalCompiler' }
IRInstruction class >> lowcodeInstruction: opcode extendA: extendA [
	^ IRLowcodeInstruction new
		opcode: opcode;
		extendA: extendA;
		yourself
]

{ #category : #'*Lowcode-OpalCompiler' }
IRInstruction class >> lowcodeInstruction: opcode extendA: extendA extendB: extendB [
	^ IRLowcodeInstruction new
		opcode: opcode;
		extendA: extendA;
		extendB: extendB;
		yourself
]

{ #category : #'*Lowcode-OpalCompiler' }
IRInstruction class >> lowcodeInstruction: opcode label: label [
	^ IRLowcodeInstruction new
		opcode: opcode;
		label: label;
		yourself
]
