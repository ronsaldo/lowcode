Extension { #name : #IRBytecodeGenerator }

{ #category : #'*Lowcode-IRBuilder' }
IRBytecodeGenerator >> lowcodeInstruction: instruction [
	| stackDiff |
	stackDiff := instruction stackDifference.
	stackDiff > 0 ifTrue: [ 
		1 to: stackDiff do: [ :i | stack push ].
	] ifFalse: [ 
		1 to: stackDiff negated do: [ :i | stack pop ].
	].

	instruction hasLiteral ifTrue: [
		encoder genLowcodeInstruction: instruction literal: (self literalIndexOf: instruction extendA)
	] ifFalse: [
		encoder genLowcodeInstruction: instruction
	].
	
	
]
