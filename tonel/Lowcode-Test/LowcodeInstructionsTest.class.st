Class {
	#name : #LowcodeInstructionsTest,
	#superclass : #TestCase,
	#category : #'Lowcode-Test'
}

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg1 with: arg2 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg1 with: arg2 with: arg3 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]
