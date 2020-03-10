Extension { #name : #SymbolicBytecodeBuilder }

{ #category : #'*Lowcode-IRBuilder' }
SymbolicBytecodeBuilder >> callPrimitive: primNumber [
	"Print the callPrimitive bytecode."
	| isInlined inlinePrimitiveName|
	isInlined := primNumber >= (1 << 15).
	inlinePrimitiveName := ''.
	isInlined ifTrue: [ 
		(method encoderClass getInlinePrimitiveName: primNumber) ifNotNil: [ :name |
			inlinePrimitiveName := '[' , name , '] '
		].
	].
	
	self addBytecode: 'call', (isInlined ifTrue: [ 'Inlined' ] ifFalse: [ '' ]), 'Primitive: ',
		inlinePrimitiveName, primNumber printString
]
