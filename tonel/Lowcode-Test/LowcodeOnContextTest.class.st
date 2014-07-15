Class {
	#name : #LowcodeOnContextTest,
	#superclass : #TestCase,
	#category : #'Lowcode-Test'
}

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> returnFalse [
	^ Lowcode here: [ :gen |
		gen returnFalse
	]
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> returnOne [
	^ Lowcode here: [ :gen |
		gen pushOne;
			returnTop
	]
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> returnSelf [
	^ Lowcode here: [ :gen |
		gen returnReceiver
	]
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> testReturnFalse [
	self assert: self returnFalse = false
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> testReturnOne [
	self assert: self returnOne = 1
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> testReturnSelf [
	self assert: self returnSelf == self
]
