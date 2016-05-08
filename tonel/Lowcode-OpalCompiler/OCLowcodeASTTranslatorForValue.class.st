Class {
	#name : #OCLowcodeASTTranslatorForValue,
	#superclass : #OCLowcodeASTTranslator,
	#category : #'Lowcode-OpalCompiler-Translator'
}

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForValue >> emitIfFalse: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForValue >> emitIfNotNil: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForValue >> emitIfTrue: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForValue >> emitWhileFalse: aMessageNode [
	self halt.
]

{ #category : #'inline messages' }
OCLowcodeASTTranslatorForValue >> emitWhileTrue: aMessageNode [
	self halt.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslatorForValue >> visitSequenceNode: aSequenceNode [ 
	| statements |
	statements := aSequenceNode statements.
	statements ifEmpty: [
		self halt.
		methodBuilder pushLiteral: nil.
		^self].
	statements allButLastDo: [:each | effectTranslator visitNode: each].
	self visitNode: statements last.
]
