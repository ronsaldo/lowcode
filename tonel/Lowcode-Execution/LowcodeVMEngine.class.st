Class {
	#name : #LowcodeVMEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-Execution'
}

{ #category : #testing }
LowcodeVMEngine class >> isSuitable [
	^ true
]

{ #category : #testing }
LowcodeVMEngine class >> isSupported [
	^ true
]

{ #category : #interpret }
LowcodeVMEngine >> emit: aBlock on: aContext [
	self emit: aBlock onMethod: aContext method.
	^ Lowcode retryContext: aContext
]

{ #category : #interpret }
LowcodeVMEngine >> emit: aBlock onMethod: aCompiledMethod [
	| assembler |
	assembler := LowcodeAssembler new.
	assembler argumentCount: aCompiledMethod numArgs.
	aBlock value: assembler.
	
	assembler 
		addLiteral: #lowcodeAssemblerMethod -> aCompiledMethod;
		addLiteral: aCompiledMethod selector;
		addLiteral: aCompiledMethod methodClass binding.
	self install: assembler inMethod: aCompiledMethod.
]

{ #category : #interpret }
LowcodeVMEngine >> install: assembler inMethod: aCompiledMethod [
	| newMethod class selector |
	newMethod := assembler emitCompiledMethodWith: aCompiledMethod trailer.
	class := newMethod methodClass.
	selector := newMethod selector.
	class methodDict at: selector put: newMethod
]
