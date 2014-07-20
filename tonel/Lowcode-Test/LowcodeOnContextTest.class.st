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
			returnInt32AsOop
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
			returnInt32AsOop.
	]

]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnAdd32 [
	^ Lowcode here: [ :gen |
		gen pushOne32;
			pushOne32;
			add32;
			returnInt32AsOop
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
			returnInt32AsOop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnSelf [
	^ Lowcode here: [ :gen |
		gen returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnZero32 [
	^ Lowcode here: [ :gen |
		gen pushZero32;
			returnInt32AsOop
	]
]

{ #category : #running }
LowcodeOnContextTest >> setUp [
	isdigitFunction := NativeBoost loadSymbol: 'isdigit' fromModule: 0
]

{ #category : #tests }
LowcodeOnContextTest >> testAdd [
	self assert: (self add: 1 with: 3) equals: 4
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

{ #category : #tests }
LowcodeOnContextTest >> testReturnZero32 [
	self assert: self returnZero32 = 0
]
