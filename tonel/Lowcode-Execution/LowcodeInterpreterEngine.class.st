Class {
	#name : #LowcodeInterpreterEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-Execution'
}

{ #category : #testing }
LowcodeInterpreterEngine class >> isSuitable [
	^ false
]

{ #category : #testing }
LowcodeInterpreterEngine class >> isSupported [
	<primitive: #primitiveIsSupported module: #LowcodeInterpreterPlugin error:errorCode>
	^ false
]

{ #category : #interpret }
LowcodeInterpreterEngine >> emit: aBlock on: aContext [
	self emit: aBlock onMethod: aContext method.
	^ Lowcode retryContext: aContext
]

{ #category : #interpret }
LowcodeInterpreterEngine >> emit: aBlock onMethod: aCompiledMethod [
	| assembler |
	assembler := LowcodeAssembler new.
	assembler argumentCount: aCompiledMethod numArgs.
	aBlock value: assembler.
	
	self install: assembler emit inMethod: aCompiledMethod.
]

{ #category : #interpret }
LowcodeInterpreterEngine >> install: code inMethod: aCompiledMethod [
	code installReplacing: aCompiledMethod.

]
