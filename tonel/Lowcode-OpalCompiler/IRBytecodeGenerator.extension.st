Extension { #name : #IRBytecodeGenerator }

{ #category : #'*Lowcode-OpalCompiler' }
IRBytecodeGenerator >> lowcodeInstruction: instruction [
	| stackDiff |
	stackDiff := instruction stackDifference.
	stackDiff > 0 ifTrue: [ 
		1 to: stackDiff do: [ stack push ].
	] ifFalse: [ 
		1 to: stackDiff negated do: [ stack pop ].
	].
	encoder genLowcodeInstruction: instruction
	
]
