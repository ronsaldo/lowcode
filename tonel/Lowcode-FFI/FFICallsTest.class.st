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

{ #category : #'callout functions' }
FFICallsTest >> cLibraryName [
	^ 0
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
FFICallsTest >> nbStr: largeString str: smallerString [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #(String strstr(String largeString, String smallerString)) module: self cLibraryName
]

{ #category : #'callout functions' }
FFICallsTest >> str: largeString str: smallerString [
	^ self ffiCall: #(String strstr(String largeString, String smallerString)) module: self cLibraryName
]

{ #category : #'callout functions' }
FFICallsTest >> strlen: str [
	^ self ffiCall: #(size_t strlen(String str)) module: 0
]

{ #category : #'callout functions' }
FFICallsTest >> strlenArray: str [
	^ self ffiCall: #(size_t strlen(const char * str)) module: 0
]

{ #category : #'callout functions' }
FFICallsTest >> testAbs [
	self assert: (self abs: 3) equals: 3.
	self assert: (self abs: -3) equals: 3
]

{ #category : #'as yet unclassified' }
FFICallsTest >> testIsDigit [
	self assert: (self isDigit: $1 charCode).
	self deny: (self isDigit: $a charCode).
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
	self assert: (self strlen: '') equals: 0.
	self assert: (self strlen: 'abc') equals: 3.
	self assert: (self strlen: 'abcasas') equals: 7
]

{ #category : #'callout functions' }
FFICallsTest >> testStlenArray [
	| strEmpty strA |
	strEmpty := #[0].
	strA := #[90 45 60 0].
	self assert: (self strlenArray: strEmpty) equals: 0.
	self assert: (self strlenArray: strA) equals: 3
]

{ #category : #'callout functions' }
FFICallsTest >> testStrStr [
	self assert: (self str: 'ababaab' str: 'c' ) equals: nil.
	self assert: (self str: 'ababaab' str: 'baa' ) equals: 'baab'.
]
