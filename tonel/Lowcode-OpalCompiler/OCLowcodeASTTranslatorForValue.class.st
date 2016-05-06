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
	self halt.
]
