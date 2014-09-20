Class {
	#name : #LowcodeVMEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-Execution'
}

{ #category : #'as yet unclassified' }
LowcodeVMEngine class >> isSuitable [
	^ true
]

{ #category : #'as yet unclassified' }
LowcodeVMEngine class >> isSupported [
	^ true
]

{ #category : #'as yet unclassified' }
LowcodeVMEngine >> emit: aBlock on: aContext [
	self emit: aBlock onMethod: aContext method.
	^ Lowcode retryContext: aContext
]

{ #category : #'as yet unclassified' }
LowcodeVMEngine >> emit: aBlock onMethod: aCompiledMethod [
	| assembler |
	assembler := LowcodeAssembler new.
	assembler argumentCount: aCompiledMethod numArgs.
	aBlock value: assembler.
	
	assembler addLiteral: aCompiledMethod selector;
		addLiteral: aCompiledMethod methodClass binding.
	self install: assembler inMethod: aCompiledMethod.
]

{ #category : #'as yet unclassified' }
LowcodeVMEngine >> install: assembler inMethod: aCompiledMethod [
	| newMethod class selector |
	newMethod := assembler emitCompiledMethodWith: aCompiledMethod trailer.
	class := newMethod methodClass.
	selector := newMethod selector.
	self halt.
	class methodDict at: selector put: newMethod
]
