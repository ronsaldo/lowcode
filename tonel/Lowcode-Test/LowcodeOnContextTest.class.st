Class {
	#name : #LowcodeOnContextTest,
	#superclass : #TestCase,
	#category : #'Lowcode-Test'
}

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> returnSelf [
	^ Lowcode here: [ :gen |
		gen returnReceiver
	] compiled: #LowcodeCompiled
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> testReturnSelf [
	self assert: self returnSelf == self
]
