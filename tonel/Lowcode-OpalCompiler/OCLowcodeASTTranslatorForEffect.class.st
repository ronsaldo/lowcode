Class {
	#name : #OCLowcodeASTTranslatorForEffect,
	#superclass : #OCLowcodeASTTranslator,
	#category : #'Lowcode-OpalCompiler-Translator'
}

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForEffect >> emitAnd: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForEffect >> emitIfFalse: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForEffect >> emitIfNotNil: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForEffect >> emitIfTrue: aMessageNode [
	| receiverType |
	valueTranslator visitNode: aMessageNode receiver.
	receiverType := aMessageNode receiver propertyAt: #type.
	self emitConversionFrom: receiverType to: LowcodeType object.
	methodBuilder jumpAheadTo: #else if: false.	
		self visitInlinedBlockNode: aMessageNode arguments first.
	methodBuilder jumpAheadTarget: #else.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> emitMessageNode: aMessageNode [
	| resultType |
	super emitMessageNode: aMessageNode.
	resultType := aMessageNode propertyAt: #type.
	resultType emitPop: methodBuilder
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForEffect >> emitOr: aMessageNode [
	self halt.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitArrayNode: anArrayNode [
	self halt.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitAssignmentNode: anAssignmentNode [

	super visitAssignmentNode: anAssignmentNode .
	self popOfType: (anAssignmentNode propertyAt: #type).
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitBlockNode: aBlockNode [ 

	"A block has no side effect, so a block translated for effect just doesn't generate anything" 

]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitLiteralArrayNode: aLiteralNode [
	"when visiting a literal array for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitLiteralNode: aLiteralNode [
	"when visiting a literal for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitParseErrorNode: anErrorNode [
	self halt.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitSequenceNode: aSequenceNode [ 
	aSequenceNode statements do: [:each | self visitNode: each].
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForEffect >> visitVariableNode: aVariableNode [
	"when visiting a variable for effect, we could push it and then pop it, but we do nothing"
	| binding |
	binding := aVariableNode binding.
	(binding isLiteralVariable or: [ binding isUndeclared ])
		ifTrue: [ methodBuilder addLiteral: binding assoc ]
]
