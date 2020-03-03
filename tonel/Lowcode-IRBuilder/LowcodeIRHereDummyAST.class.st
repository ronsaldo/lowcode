Class {
	#name : #LowcodeIRHereDummyAST,
	#superclass : #Object,
	#instVars : [
		'originalAST',
		'codeGenerationMethod'
	],
	#category : #'Lowcode-IRBuilder-Opal'
}

{ #category : #accessing }
LowcodeIRHereDummyAST >> codeGenerationMethod [
	^ codeGenerationMethod
]

{ #category : #accessing }
LowcodeIRHereDummyAST >> codeGenerationMethod: anObject [
	codeGenerationMethod := anObject
]

{ #category : #translating }
LowcodeIRHereDummyAST >> generate: compiledMethodTrailer [
	| ir |
	ir := codeGenerationMethod valueWithReceiver: nil arguments: (Array new: codeGenerationMethod numArgs).
	ir sourceNode: originalAST.
	ir compilationContext encoderClass: EncoderForSistaV1.
	^ (ir generate: compiledMethodTrailer)
		setSignFlag;
		setFrameBit: true; 
		yourself
]

{ #category : #accessing }
LowcodeIRHereDummyAST >> originalAST [
	^ originalAST
]

{ #category : #accessing }
LowcodeIRHereDummyAST >> originalAST: anObject [
	originalAST := anObject
]
