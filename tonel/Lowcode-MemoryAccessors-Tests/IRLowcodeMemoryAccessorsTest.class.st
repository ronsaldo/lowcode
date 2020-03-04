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
IRLowcodeMemoryAccessorsTest >> testByteArrayPointer [
	| pointers wordSize byteArray |
	pointers := {
		ExternalAddress fromAddress: 16rDEADC0DE.
		ExternalAddress fromAddress: 16rBEEFDEAD.
	}.
	wordSize := Smalltalk wordSize.
	self assert: wordSize <= 8.
	byteArray := ByteArray new: pointers size * wordSize.
	pointers doWithIndex: [ :pointer :index |
		| byteIndex |
		byteIndex := (index - 1) * wordSize + 1.
		byteArray lcPointerAt: byteIndex put: pointer.
		self assert: (byteArray lcPointerAt: byteIndex) equals: pointer
	].
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

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressFloat32 [
	| numbers externalAddress |
	numbers := #(0.0 1.0 2.5 -1.5 -2.25 -3.0).
	externalAddress := ExternalAddress gcallocate: numbers size * 4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		externalAddress lcFloatAt: byteIndex put: number.
		self assert: (externalAddress lcFloatAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressFloat64 [
	| numbers externalAddress |
	numbers := #(0.0 1.0 2.5 -1.5 -2.25 -3.0).
	externalAddress := ExternalAddress gcallocate: numbers size * 8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		externalAddress lcDoubleAt: byteIndex put: number.
		self assert: (externalAddress lcDoubleAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressInt16 [
	| numbers externalAddress |
	numbers := #(0 1 2 12345 -1 -2 -3 -12345).
	externalAddress := ExternalAddress gcallocate: numbers size * 2.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*2 + 1.
		externalAddress lcSignedShortAt: byteIndex put: number.
		self assert: (externalAddress lcSignedShortAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressInt32 [
	| numbers externalAddress |
	numbers := #(0 1 2 12345 123456789 -1 -2 -3 -12345 -123456789).
	externalAddress := ExternalAddress gcallocate: numbers size * 4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		externalAddress lcSignedLongAt: byteIndex put: number.
		self assert: (externalAddress lcSignedLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressInt64 [
	| numbers externalAddress |
	numbers := #(0 1 2 12345 123456789 4611686018427387904 -1 -2 -3 -12345 -123456789 -4611686018427387904).
	externalAddress := ExternalAddress gcallocate: numbers size * 8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		externalAddress lcSignedLongLongAt: byteIndex put: number.
		self assert: (externalAddress lcSignedLongLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressInt8 [
	| numbers externalAddress byteArray |
	numbers := #(0 1 2 -1 -2 -3).
	externalAddress := ExternalAddress gcallocate: numbers size.
	numbers doWithIndex: [ :number :index |
		externalAddress lcSignedByteAt: index put: number.
		self assert: (externalAddress lcSignedByteAt: index) equals: number
	].
	byteArray := ByteArray new: numbers size.
	LibC memCopy: externalAddress to: byteArray size: byteArray size.
	self assert: byteArray equals: #[0 1 2 255 254 253].
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressPointer [
	| pointers wordSize byteArray |
	pointers := {
		ExternalAddress fromAddress: 16rDEADC0DE.
		ExternalAddress fromAddress: 16rBEEFDEAD.
	}.
	wordSize := Smalltalk wordSize.
	self assert: wordSize <= 8.
	byteArray := ExternalAddress gcallocate: pointers size * wordSize.
	pointers doWithIndex: [ :pointer :index |
		| byteIndex |
		byteIndex := (index - 1) * wordSize + 1.
		byteArray lcPointerAt: byteIndex put: pointer.
		self assert: (byteArray lcPointerAt: byteIndex) equals: pointer
	].
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressUInt16 [
	| numbers externalAddress |
	numbers := #(0 1 2 255 65124 65535 254 253).
	externalAddress := ExternalAddress gcallocate: numbers size*2.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*2 + 1.
		externalAddress lcUnsignedShortAt: byteIndex put: number.
		self assert: (externalAddress lcUnsignedShortAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressUInt32 [
	| numbers externalAddress |
	numbers := #(0 1 2 255 65124 65535 4294967295 254 253).
	externalAddress := ExternalAddress gcallocate: numbers size*4.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*4 + 1.
		externalAddress lcUnsignedLongAt: byteIndex put: number.
		self assert: (externalAddress lcUnsignedLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressUInt64 [
	| numbers externalAddress |
	numbers := #(0 1 2 255 65124 65535 4294967295 18446744073709551615 254 253).
	externalAddress := ExternalAddress gcallocate: numbers size*8.
	numbers doWithIndex: [ :number :index |
		| byteIndex |
		byteIndex := (index-1)*8 + 1.
		externalAddress lcUnsignedLongLongAt: byteIndex put: number.
		self assert: (externalAddress lcUnsignedLongLongAt: byteIndex) equals: number
	]
]

{ #category : #tests }
IRLowcodeMemoryAccessorsTest >> testExternalAddressUInt8 [
	| numbers externalAddress byteArray |
	numbers := #(0 1 2 255 254 253).
	externalAddress := ExternalAddress gcallocate: numbers size.
	numbers doWithIndex: [ :number :index |
		externalAddress lcUnsignedByteAt: index put: number.
		self assert: (externalAddress lcUnsignedByteAt: index) equals: number
	].
	byteArray := ByteArray new: numbers size.
	LibC memCopy: externalAddress to: byteArray size: byteArray size.
	self assert: byteArray equals: #[0 1 2 255 254 253].
]
