Class {
	#name : #Lowcode,
	#superclass : #Object,
	#category : #'Lowcode-Execution'
}

{ #category : #'running in context' }
Lowcode class >> emit: aBlock on: aContext [
	^ LowcodeEngine current emit: aBlock on: aContext
]

{ #category : #'running in context' }
Lowcode class >> emit: aBlock onMethod: aCompiledMethod [
	^ LowcodeEngine current emit: aBlock onMethod: aCompiledMethod
]

{ #category : #'running in context' }
Lowcode class >> here: aBlock [
	^ self onContext: thisContext sender do: aBlock
]

{ #category : #'running in context' }
Lowcode class >> inlinePrimitiveFailed: errorCode in: failureContext [
	errorCode = LowcodeConstants errorSessionChanged ifTrue: [ 
		^ self methodSessionChanged: failureContext
	].

	self error: 'Inline primitive failure ' , errorCode printString
]

{ #category : #'running in context' }
Lowcode class >> methodSessionChanged: methodContext [
	| method originalMethod selector class|
	method := methodContext method.

	"Restore the assembler method."
	originalMethod := method lowcodeAssemblerMethod.
	selector := method selector.
	class := method methodClass.
	class methodDict at: selector put: originalMethod.
	

	"Retry the context"
	^ self retryContext: methodContext
]

{ #category : #'running in context' }
Lowcode class >> onContext: aContext do: aBlock [
	^ LowcodeEngine current emit: aBlock on: aContext
]

{ #category : #interpret }
Lowcode class >> retryContext: aContext [
	"Taken from NativeBoost retrySend:"

	| method args |
	method := aContext method.
	
	args := Array new: method numArgs.
	1 to: args size do: [ :i |  args at: i put: (aContext tempAt: i) ].

	thisContext terminateTo: aContext sender. 
	^ aContext receiver perform: method selector withArguments: args.

]

{ #category : #'running in context' }
Lowcode class >> uniqueSessionIdentifier [
	^ Lowcode here: [ :gen |
		gen pushSessionIdentifier;
			uint32ToOop;
			returnTop
	]
]
