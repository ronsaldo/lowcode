Class {
	#name : #FFICallsTest,
	#superclass : #TestCase,
	#instVars : [
		'requestor',
		'parser'
	],
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'callout functions' }
FFICallsTest >> abs: x [
	^ self ffiCall: #(int abs(int x)) module: 0
]

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

{ #category : #'callout functions' }
FFICallsTest >> memcpy: dest src: src n: n [
	^ self ffiCall: #(void* memcpy(void* dest, void* src, size_t n)) module: 0
]

{ #category : #'callout functions' }
FFICallsTest >> strlen: str [
	^ self ffiCall: #(size_t strlen(const char * str)) module: 0
]

{ #category : #'callout functions' }
FFICallsTest >> testAbs [
	self assert: (self abs: 3) equals: 3.
	self assert: (self abs: -3) equals: 3
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

{ #category : #'callout functions' }
FFICallsTest >> testMemcpy [
	| dest src result |
	src := #[1 2 3 4 5].
	dest := ByteArray new: 6.
	dest at: 6 put: 9.
	result := self memcpy: dest src: src n: 5.
	self assert: dest equals: #[1 2 3 4 5 9].
	self assert: result class == FFIExternalAddress
]

{ #category : #'callout functions' }
FFICallsTest >> testStlen [
	| strEmpty strA |
	strEmpty := #[0].
	strA := #[90 45 60 0].
	self assert: (self strlen: strEmpty) equals: 0.
	self assert: (self strlen: strA) equals: 3
]
