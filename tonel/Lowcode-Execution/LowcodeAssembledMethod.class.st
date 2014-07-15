Class {
	#name : #LowcodeAssembledMethod,
	#superclass : #Object,
	#instVars : [
		'literals',
		'instructions',
		'originalMethod'
	],
	#category : #'Lowcode-Execution'
}

{ #category : #compatibility }
LowcodeAssembledMethod >> doesNotUnderstand: aMessage [
	originalMethod ifNotNil: [ ^ aMessage sendTo: originalMethod ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #running }
LowcodeAssembledMethod >> failureWith: errorCode [
	self error: 'Primitive Failed'
]

{ #category : #compatibility }
LowcodeAssembledMethod >> flushCache [
]

{ #category : #installing }
LowcodeAssembledMethod >> installReplacing: aCompiledMethod [
	| class selector |
	class := aCompiledMethod methodClass.
	selector := aCompiledMethod selector.
	originalMethod := aCompiledMethod.
	class methodDict at: selector put: self
]

{ #category : #accessing }
LowcodeAssembledMethod >> instructions [
	
	^ instructions
]

{ #category : #accessing }
LowcodeAssembledMethod >> instructions: anObject [
	
	instructions := anObject
]

{ #category : #accessing }
LowcodeAssembledMethod >> literals [
	
	^ literals
]

{ #category : #accessing }
LowcodeAssembledMethod >> literals: anObject [
	
	literals := anObject
]

{ #category : #compatibility }
LowcodeAssembledMethod >> methodClass [
	 ^ originalMethod ifNil: [ ^ self class ] ifNotNil: [ ^ originalMethod methodClass ]
]

{ #category : #running }
LowcodeAssembledMethod >> methodClass: methodClass [
]

{ #category : #compatibility }
LowcodeAssembledMethod >> origin [
	^ originalMethod ifNil: [ self class ] ifNotNil: [ originalMethod origin ]
]

{ #category : #compatibility }
LowcodeAssembledMethod >> originalMethod [
	originalMethod
]

{ #category : #running }
LowcodeAssembledMethod >> originalMethod: aCompiledMethod [
	originalMethod := aCompiledMethod
]

{ #category : #running }
LowcodeAssembledMethod >> pragmas [
	^ #()
]

{ #category : #running }
LowcodeAssembledMethod >> run: oldSelector with: arguments in: aReceiver [
	^ self runIn: aReceiver with: arguments
]

{ #category : #running }
LowcodeAssembledMethod >> runIn: receiver with: arguments [
	<primitive: #primitiveInterpretLowcodeMethod module: #LowcodeInterpreterPlugin error: errorCode>
	self failureWith: errorCode
]

{ #category : #compatibility }
LowcodeAssembledMethod >> selector [
	 ^ originalMethod ifNil: [ ^ #unknown ] ifNotNil: [ ^ originalMethod selector ]
]

{ #category : #running }
LowcodeAssembledMethod >> selector: aSymbol [
]

{ #category : #installing }
LowcodeAssembledMethod >> uninstall [
	self methodClass methodDict at: self selector put: originalMethod
]
