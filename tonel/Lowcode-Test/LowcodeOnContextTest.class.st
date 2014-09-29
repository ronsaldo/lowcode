Class {
	#name : #LowcodeOnContextTest,
	#superclass : #TestCase,
	#instVars : [
		'isdigitFunction'
	],
	#category : #'Lowcode-Test'
}

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> add: a with: b [
	^ Lowcode here: [ :gen |
		gen pushTemp: 0;
			oopToInt32;
			pushTemp: 1;
			oopToInt32;
			add32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> ifTest:aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 2 ]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> inlinePrimitiveFail [
	^ Lowcode here: [ :gen |
		gen fail;
			returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> isDigit: character [
	^ Lowcode here: [ :gen |
		gen pushMyInstanceVariable: #isdigitFunction;
			oopToPointer;
			pushTemp: 0;
			oopToInt32;
			beginCall: 16;
			callArgumentInt32;
			performCallIndirectInt32;
			endCall;
			int32ToOop;
			returnTop
	]

]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnAdd32 [
	^ Lowcode here: [ :gen |
		gen pushOne32;
			pushOne32;
			add32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnBranchTrue32: bool [
	| cont trueLabel |
	^ Lowcode here: [ :gen |
		cont := gen makeLabel: 'cont'.
		trueLabel := gen makeLabel: 'true'.
		gen pushTemp: 0;
			oopSmallIntegerToInt32;
			branchTrue32: trueLabel;
			pushZero;
			jump: cont;
			putLabel: trueLabel;
			pushOne;
			putLabel: cont;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnFalse [
	^ Lowcode here: [ :gen |
		gen returnFalse
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnOne [
	^ Lowcode here: [ :gen |
		gen pushOne;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnOne32 [
	^ Lowcode here: [ :gen |
		gen pushOne32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnSelf [
	^ Lowcode here: [ :gen |
		gen returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnUseLocalPointer: aPointer [
	| pointerTemp |
	^ Lowcode here: [ :gen |
		pointerTemp := gen allocateLocalPointer.
		gen pushTemp: 0;
			oopToPointer;
			storeLocalPointer: pointerTemp;
			loadLocalPointer: pointerTemp;
			pointerToInt32;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnZero32 [
	^ Lowcode here: [ :gen |
		gen pushZero32;
			int32ToOop;
			returnTop
	]
]

{ #category : #running }
LowcodeOnContextTest >> setUp [
	isdigitFunction := FFI loadSymbol: 'isdigit' fromModule: 0
]

{ #category : #tests }
LowcodeOnContextTest >> testAdd [
	self assert: (self add: 1 with: 3) equals: 4
]

{ #category : #tests }
LowcodeOnContextTest >> testBranchTrue32 [
	self assert: (self returnBranchTrue32: 0) equals: 0.
	self assert: (self returnBranchTrue32: 1) equals: 1.
	self assert: (self returnBranchTrue32: 2) equals: 1.
]

{ #category : #tests }
LowcodeOnContextTest >> testIsDigit [
	self assert: (self isDigit: $3 charCode) ~= 0
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnAdd32 [
	self assert: self returnAdd32 = 2
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnFalse [
	self assert: self returnFalse = false
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnOne [
	self assert: self returnOne = 1
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnOne32 [
	self assert: self returnOne32 = 1
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnSelf [
	self assert: self returnSelf == self
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> testReturnUseLocalPointer [
	self assert: (self returnUseLocalPointer: FFIExternalAddress null) value equals: 0.
	self assert: (self returnUseLocalPointer: (FFIExternalAddress value: 16)) value equals: 16.
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnZero32 [
	self assert: self returnZero32 = 0
]
