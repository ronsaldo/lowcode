Class {
	#name : #LowcodeInterpreter,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-Execution'
}

{ #category : #testing }
LowcodeInterpreter class >> isSupported [
	<primitive: #primitiveIsSupported module: #LowcodeInterpreterPlugin error:errorCode>
	^ false
]

{ #category : #interpret }
LowcodeInterpreter >> emit: aBlock on: aContext [
	| assembler |
	assembler := LowcodeAssembler new.
	aBlock value: assembler.
	self install: assembler emit inContext: aContext.
	self retryContext: aContext
]

{ #category : #interpret }
LowcodeInterpreter >> install: code inContext: aContext [
	aContext method inspect
]

{ #category : #interpret }
LowcodeInterpreter >> interpret: instructions [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #interpret }
LowcodeInterpreter >> interpret: instructions with: arg1 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #interpret }
LowcodeInterpreter >> interpret: instructions with: arg1 with: arg2 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #interpret }
LowcodeInterpreter >> interpret: instructions with: arg1 with: arg2 with: arg3 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #interpret }
LowcodeInterpreter >> retryContext: aContext [
]
