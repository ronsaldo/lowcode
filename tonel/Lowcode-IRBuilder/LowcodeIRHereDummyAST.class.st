"
I am a dummy AST node that I am used for replacing the generated code with Lowcode instructions. I am used as a HACK because there is no existing way to register a compiler plugin in the code generation level. When that support is added to the compiler, I should be removed. 
"
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
	ir := codeGenerationMethod valueWithReceiver: nil arguments: (originalAST arguments collect: [ :each | each name ] as: Array).
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
