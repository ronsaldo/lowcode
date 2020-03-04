Class {
	#name : #IRLowcodeMemoryAccessorsTest,
	#superclass : #TestCase,
	#category : #'Lowcode-MemoryAccessors-Tests'
}

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayFloat32 [
	| numbers byteArray |
	numbers := #(0.0 1.0 2.5 -1.5 -2.25 -3.0).
	byteArray := ByteArray new: numbers size * 4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		byteArray lcFloatAt: byteIndex put: number.
		self assert: (byteArray lcFloatAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayFloat64 [
	| numbers byteArray |
	numbers := #(0.0 1.0 2.5 -1.5 -2.25 -3.0).
	byteArray := ByteArray new: numbers size * 8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		byteArray lcDoubleAt: byteIndex put: number.
		self assert: (byteArray lcDoubleAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayInt16 [
	| numbers byteArray |
	numbers := #(0 1 2 12345 -1 -2 -3 -12345).
	byteArray := ByteArray new: numbers size * 2.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*2 + 1.
		byteArray lcSignedShortAt: byteIndex put: number.
		self assert: (byteArray lcSignedShortAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayInt32 [
	| numbers byteArray |
	numbers := #(0 1 2 12345 123456789 -1 -2 -3 -12345 -123456789).
	byteArray := ByteArray new: numbers size * 4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		byteArray lcSignedLongAt: byteIndex put: number.
		self assert: (byteArray lcSignedLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayInt64 [
	| numbers byteArray |
	numbers := #(0 1 2 12345 123456789 4611686018427387904 -1 -2 -3 -12345 -123456789 -4611686018427387904).
	byteArray := ByteArray new: numbers size * 8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		byteArray lcSignedLongLongAt: byteIndex put: number.
		self assert: (byteArray lcSignedLongLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayInt8 [
	| numbers byteArray |
	numbers := #(0 1 2 -1 -2 -3).
	byteArray := ByteArray new: numbers size.
	numbers doWithIndex: [ :number :index |
		byteArray lcSignedByteAt: index put: number.
		self assert: (byteArray lcSignedByteAt: index) equals: number
	].
	self assert: byteArray equals: #[0 1 2 255 254 253].
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayUInt16 [
	| numbers byteArray |
	numbers := #(0 1 2 255 65124 65535 254 253).
	byteArray := ByteArray new: numbers size*2.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*2 + 1.
		byteArray lcUnsignedShortAt: byteIndex put: number.
		self assert: (byteArray lcUnsignedShortAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayUInt32 [
	| numbers byteArray |
	numbers := #(0 1 2 255 65124 65535 4294967295 254 253).
	byteArray := ByteArray new: numbers size*4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		byteArray lcUnsignedLongAt: byteIndex put: number.
		self assert: (byteArray lcUnsignedLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayUInt64 [
	| numbers byteArray |
	numbers := #(0 1 2 255 65124 65535 4294967295 18446744073709551615 254 253).
	byteArray := ByteArray new: numbers size*8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		byteArray lcUnsignedLongLongAt: byteIndex put: number.
		self assert: (byteArray lcUnsignedLongLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testByteArrayUInt8 [
	| numbers byteArray |
	numbers := #(0 1 2 255 254 253).
	byteArray := ByteArray new: numbers size.
	numbers doWithIndex: [ :number :index |
		byteArray lcUnsignedByteAt: index put: number.
		self assert: (byteArray lcUnsignedByteAt: index) equals: number
	].
	self assert: byteArray equals: #[0 1 2 255 254 253].
]
