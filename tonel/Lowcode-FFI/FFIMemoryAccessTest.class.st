Class {
	#name : #FFIMemoryAccessTest,
	#superclass : #TestCase,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testFloat32AtOffset [
	| array float |
	float := 2.5.
	
	array := ByteArray new: 6.
	array ffiFloat32AtOffset: 1 put: float.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 6) equals: 0.
	self assert: (array ffiFloat32AtOffset: 1) equals: float
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testFloat64AtOffset [
	| array float |
	float := 2.5.
	
	array := ByteArray new: 10.
	array ffiFloat64AtOffset: 1 put: float.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 10) equals: 0.
	self assert: (array ffiFloat64AtOffset: 1) equals: float
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testInt16AtOffset [
	| array |
	array := ByteArray new: 4.
	array ffiInt16AtOffset: 1 put: -1234.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 4) equals: 0.
	self assert: (array ffiInt16AtOffset: 1) equals: -1234
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testInt32AtOffset [
	| array |
	array := ByteArray new: 6.
	array ffiInt32AtOffset: 1 put: -1234567891.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 6) equals: 0.
	self assert: (array ffiInt32AtOffset: 1) equals: -1234567891
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testInt64AtOffset [
	| array |
	array := ByteArray new: 10.
	array ffiInt64AtOffset: 1 put: -1234567891121241212.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 10) equals: 0.
	self assert: (array ffiInt64AtOffset: 1) equals: -1234567891121241212
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testInt8AtOffset [
	| array |
	array := ByteArray new: 3.
	array ffiInt8AtOffset: 1 put: -50.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 3) equals: 0.
	self assert: (array ffiInt8AtOffset: 1) equals: -50
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testLongAt [
	| array |
	array := ByteArray new: 6.
	array ffiLongAt: 1 put: -1234567891.
	self assert: (array at: 5) equals: 0.
	self assert: (array at: 6) equals: 0.
	self assert: (array ffiLongAt: 1) equals: -1234567891
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testUInt16AtOffset [
	| array |
	array := ByteArray new: 4.
	array ffiUInt16AtOffset: 1 put: 1234.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 4) equals: 0.
	self assert: (array ffiUInt16AtOffset: 1) equals: 1234
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testUInt32AtOffset [
	| array |
	array := ByteArray new: 6.
	array ffiUInt32AtOffset: 1 put: 1234567891.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 6) equals: 0.
	self assert: (array ffiUInt32AtOffset: 1) equals: 1234567891
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testUInt64AtOffset [
	| array |
	array := ByteArray new: 10.
	array ffiUInt64AtOffset: 1 put: 1234567891121241212.
	self assert: (array at: 1) equals: 0.
	self assert: (array at: 10) equals: 0.
	self assert: (array ffiUInt64AtOffset: 1) equals: 1234567891121241212
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testUInt8AtOffset [
	| array |
	array := ByteArray new: 3.
	array ffiUInt8AtOffset: 1 put: 50.
	self assert: array equals: #[0 50 0].
	self assert: (array ffiUInt8AtOffset: 1) equals: 50
]

{ #category : #'as yet unclassified' }
FFIMemoryAccessTest >> testULongAt [
	| array |
	array := ByteArray new: 6.
	array ffiULongAt: 1 put: 1234567891.
	self assert: (array at: 5) equals: 0.
	self assert: (array at: 6) equals: 0.
	self assert: (array ffiULongAt: 1) equals: 1234567891
]
