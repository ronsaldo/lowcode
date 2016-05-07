Class {
	#name : #OCLowcodeASTTranslatorForEffect,
	#superclass : #OCLowcodeASTTranslator,
	#category : #'Lowcode-OpalCompiler-Translator'
}

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitAnd: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitIfFalse: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitIfNotNil: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitIfTrue: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitMessageNode: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> emitOr: aMessageNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitArrayNode: anArrayNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitAssignmentNode: anAssignmentNode [

	super visitAssignmentNode: anAssignmentNode .
	self popOfType: (anAssignmentNode propertyAt: #type).
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitBlockNode: aBlockNode [ 

	"A block has no side effect, so a block translated for effect just doesn't generate anything" 

]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitLiteralArrayNode: aLiteralNode [
	"when visiting a literal array for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitLiteralNode: aLiteralNode [
	"when visiting a literal for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitParseErrorNode: anErrorNode [
	self halt.
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitSequenceNode: aSequenceNode [ 
	aSequenceNode statements do: [:each | self visitNode: each].
]

{ #category : #'as yet unclassified' }
OCLowcodeASTTranslatorForEffect >> visitVariableNode: aVariableNode [
	"when visiting a variable for effect, we could push it and then pop it, but we do nothing"
	| binding |
	binding := aVariableNode binding.
	(binding isLiteralVariable or: [ binding isUndeclared ])
		ifTrue: [ methodBuilder addLiteral: binding assoc ]
]
