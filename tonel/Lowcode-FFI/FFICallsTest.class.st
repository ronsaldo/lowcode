Class {
	#name : #FFICallsTest,
	#superclass : #TestCase,
	#instVars : [
		'requestor',
		'parser'
	],
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFICallsTest >> branchSample: a [
	a ifTrue: [ ^ 1 ] ifFalse: [ ^ 0 ]
]

{ #category : #'callout functions' }
FFICallsTest >> isDigit: ch [
	^ self ffiCall: #(bool isdigit (char ch) ) module: 0
]

{ #category : #'as yet unclassified' }
FFICallsTest >> isDigitAsciiCode: ch [
	^ self ffiCall: #(int isdigit (int32 ch) ) module: 0
]

{ #category : #'as yet unclassified' }
FFICallsTest >> testIsDigit [
	self assert: (self isDigit: $1).
	self deny: (self isDigit: $a).

]

{ #category : #'as yet unclassified' }
FFICallsTest >> testIsDigitAsciiCode [
	self assert: (self isDigitAsciiCode: $1 charCode) ~= 0.
	self assert: (self isDigitAsciiCode: $a charCode) = 0.

]
