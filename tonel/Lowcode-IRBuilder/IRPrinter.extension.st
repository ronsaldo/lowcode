Extension { #name : #IRPrinter }

{ #category : #'*Lowcode-IRBuilder' }
IRPrinter >> visitLowcodeInstruction: instruction [
	stream nextPutAll: instruction lowcodeMnemonic.
	(instruction hasLiteral or: [ instruction extendA isNotNil ]) ifTrue: [
		stream nextPutAll: ': ';
			print: instruction extendA.
	].

	instruction extendB ifNotNil: [
		stream nextPutAll: ' extendB: ';
			print: instruction extendB.
	].



]
