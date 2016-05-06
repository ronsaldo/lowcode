Extension { #name : #IRPrinterV2 }

{ #category : #'*Lowcode-IRBuilder' }
IRPrinterV2 >> visitLowcodeInstruction: instruction [
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
