Extension { #name : #IRPrinterV2 }

{ #category : #'*Lowcode-OpalCompiler' }
IRPrinterV2 >> visitLowcodeInstruction: instruction [
	stream nextPutAll: instruction lowcodeMnemonic.
	instruction extendA ifNotNil: [
		stream nextPutAll: ': ';
			print: instruction extendA.
	].

	instruction extendB ifNotNil: [
		stream nextPutAll: ' extendB: ';
			print: instruction extendB.
	].

	instruction literal ifNotNil: [
		stream nextPutAll: ': ';
			print: instruction literal.
	].

	instruction label ifNotNil: [ 
		stream nextPutAll: ': '.
		instruction label orderNumber printOn: stream
	].
]
