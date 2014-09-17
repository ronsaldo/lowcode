Class {
	#name : #LowcodeAssembledMethod,
	#superclass : #Object,
	#instVars : [
		'literals',
		'instructions',
		'stackFrameSize',
		'numberOfTemporals',
		'numberOfArguments',
		'originalMethod'
	],
	#category : #'Lowcode-Execution'
}

{ #category : #uninstall }
LowcodeAssembledMethod class >> uninstallOfAll [
	Object withAllSubclassesDo: [ :sc | self uninstallOfClass: sc ]
]

{ #category : #uninstall }
LowcodeAssembledMethod class >> uninstallOfClass: aClass [
	aClass methodDict valuesDo: [ :val |
		val isLowcodeMethod ifTrue: [ val uninstall ]
	]
]

{ #category : #compatibility }
LowcodeAssembledMethod >> doesNotUnderstand: aMessage [
	originalMethod ifNotNil: [ ^ aMessage sendTo: originalMethod ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #running }
LowcodeAssembledMethod >> failure: errorCode in: receiver with: temporals [

	errorCode = LowcodeConstants errorSessionChanged ifTrue: [ 
		^ self retryCompiling: receiver with: temporals.
	].

	self error: 'Primitive Failed errorCode: ' , errorCode printString
]

{ #category : #compatibility }
LowcodeAssembledMethod >> flushCache [
]

{ #category : #initialization }
LowcodeAssembledMethod >> initialize [
	super initialize.
	stackFrameSize := 0.
	numberOfTemporals := 0
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

{ #category : #testing }
LowcodeAssembledMethod >> isLowcodeMethod [
	^ true
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

{ #category : #accessing }
LowcodeAssembledMethod >> numberOfArguments [
	^ numberOfArguments
]

{ #category : #accessing }
LowcodeAssembledMethod >> numberOfArguments: anInteger [
	"The number of arguments"
	numberOfArguments := anInteger
]

{ #category : #accessing }
LowcodeAssembledMethod >> numberOfTemporals [
	^ numberOfTemporals
]

{ #category : #accessing }
LowcodeAssembledMethod >> numberOfTemporals: anInteger [
	"The number of temporaries"
	numberOfTemporals := anInteger
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
LowcodeAssembledMethod >> retryCompiling: receiver with: temporals [
	| oldSelector args |
	oldSelector := self selector.
	args := temporals first: originalMethod numArgs.
	self uninstall.
	^ receiver perform: oldSelector withArguments: args.

]

{ #category : #running }
LowcodeAssembledMethod >> run: oldSelector with: arguments in: aReceiver [
	| temporals |
	temporals := Array new: numberOfTemporals.
	arguments doWithIndex: [ :a :i | temporals at: i put: a ].
	^ self runIn: aReceiver with: temporals
]

{ #category : #running }
LowcodeAssembledMethod >> runIn: receiver with: temporals [
	<primitive: #primitiveInterpretLowcodeMethod module: #LowcodeInterpreterPlugin error: errorCode>
	^ self failure: errorCode in: receiver with: temporals
]

{ #category : #compatibility }
LowcodeAssembledMethod >> selector [
	 ^ originalMethod ifNil: [ ^ #unknown ] ifNotNil: [ ^ originalMethod selector ]
]

{ #category : #running }
LowcodeAssembledMethod >> selector: aSymbol [
]

{ #category : #accessing }
LowcodeAssembledMethod >> stackFrameSize [
	^ stackFrameSize
]

{ #category : #accessing }
LowcodeAssembledMethod >> stackFrameSize: stackFrameSizeInBytes [
	"The size of the stack frame in bytes."
	stackFrameSize := stackFrameSizeInBytes
]

{ #category : #installing }
LowcodeAssembledMethod >> uninstall [
	self methodClass methodDict at: self selector put: originalMethod
]
