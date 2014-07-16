Class {
	#name : #LowcodeInterpreterEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-Execution'
}

{ #category : #testing }
LowcodeInterpreterEngine class >> isSupported [
	<primitive: #primitiveIsSupported module: #LowcodeInterpreterPlugin error:errorCode>
	^ false
]

{ #category : #interpret }
LowcodeInterpreterEngine >> emit: aBlock on: aContext [
	| assembler |
	assembler := LowcodeAssembler new.
	assembler argumentCount: aContext method numArgs.
	aBlock value: assembler.
	
	self install: assembler emit inContext: aContext.
	self retryContext: aContext
]

{ #category : #interpret }
LowcodeInterpreterEngine >> install: code inContext: aContext [
	code installReplacing: aContext method.

]

{ #category : #interpret }
LowcodeInterpreterEngine >> retryContext: aContext [
	"Taken from NativeBoost retrySend:"

	| method args |
	method := aContext method.
	
	args := Array new: method numArgs.
	1 to: args size do: [ :i |  args at: i put: (aContext tempAt: i) ].

	thisContext terminateTo: aContext sender. 
	^ aContext receiver perform: method selector withArguments: args.

]
