Extension { #name : #ByteArray }

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiBooleanAt: byteOffset [
	"Returns the boolean the byte at index byteOffset of this ByteArray represents in the C convention ( A byte representing the 0 integer corresponds to false, while all other integers corresponds to true)."
	
	"(#[1 2 0 4] booleanAt: 2) >>> true."
	"(#[1 2 0 4] booleanAt: 3) >>> false."
	
	^(self integerAt: byteOffset size: 1 signed: false) ~= 0
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiBooleanAt: byteOffset put: value [
	"Booleans are just integers in C word"
	^self integerAt: byteOffset put: (value ifTrue:[1] ifFalse:[0]) size: 1 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiDoubleAt: byteOffset [
	<primitive:'primitiveFFIDoubleAt' module:'SqueakFFIPrims'>
	^self primitiveFailed
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiDoubleAt: byteOffset put: value [
	<primitive:'primitiveFFIDoubleAtPut' module:'SqueakFFIPrims'>
	self isReadOnlyObject 
		ifTrue: [ ^ self modificationForbiddenFor: #doubleAt:put: index: byteOffset value: value ].
	^self primitiveFailed
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiFloatAt: byteOffset [
	<primitive:'primitiveFFIFloatAt' module:'SqueakFFIPrims'>
	^self primitiveFailed
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiFloatAt: byteOffset put: value [
	<primitive:'primitiveFFIFloatAtPut' module:'SqueakFFIPrims'>
	self isReadOnlyObject 
		ifTrue: [ ^ self modificationForbiddenFor: #floatAt:put: index: byteOffset value: value ].
	^self primitiveFailed
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiPointerAt: byteOffset [
	"Answer a pointer object stored at the given byte address"
	| addr |
	addr := ExternalAddress new.
	1 to: ExternalAddress wordSize do:
		[:i|
		addr basicAt: i put: (self unsignedByteAt: byteOffset+i-1)].
	^addr
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiPointerAt: byteOffset put: value [
	"Store a pointer object at the given byte address"
	value isExternalAddress ifFalse:
		[^self error:'Only external addresses can be stored'].
	1 to: ExternalAddress wordSize do:
		[:i|
		self unsignedByteAt: byteOffset+i-1 put: (value basicAt: i)].
	^value
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiShortPointerAt: byteOffset [
	"Answer a 4-byte pointer object stored at the given byte address"
	| addr |
	addr := ExternalAddress basicNew: 4.
	1 to: 4 do:
		[:i|
		addr basicAt: i put: (self unsignedByteAt: byteOffset+i-1)].
	^addr
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiShortPointerAt: byteOffset put: value [
	"Store a 4-byte pointer object at the given byte address"
	value isExternalAddress ifFalse:
		[^self error:'Only external addresses can be stored'].
	1 to: 4 do:
		[:i|
		self unsignedByteAt: byteOffset+i-1 put: (value basicAt: i)].
	^value
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiSignedLongAt: byteOffset [
	"Return a 32bit signed integer starting at the given byte offset"
	^self integerAt: byteOffset size: 4 signed: true
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiSignedLongAt: byteOffset put: value [
	"Store a 32bit signed integer starting at the given byte offset"
	^self integerAt: byteOffset put: value size: 4 signed: true
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiSignedShortAt: byteOffset [
	"Return a 16bit signed integer starting at the given byte offset"
	^self integerAt: byteOffset size: 2 signed: true
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiSignedShortAt: byteOffset put: value [
	"Store a 16bit signed integer starting at the given byte offset"
	^self integerAt: byteOffset put: value size: 2 signed: true
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedByteAt: byteOffset [
	"Return a 8bit unsigned integer starting at the given byte offset"
	^self integerAt: byteOffset size: 1 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedByteAt: byteOffset put: value [
	"Store a 8bit unsigned integer starting at the given byte offset"
	^self integerAt: byteOffset put: value size: 1 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedLongAt: byteOffset [
	"Return a 32bit unsigned integer starting at the given byte offset"
	^self integerAt: byteOffset size: 4 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedLongAt: byteOffset put: value [
	"Store a 32bit signed integer starting at the given byte offset"
	^self integerAt: byteOffset put: value size: 4 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedLongLongAt: byteOffset [
	"Answer a 64-bit integer in Smalltalk order (little-endian)."
	^self integerAt: byteOffset size: 8 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedLongLongAt: byteOffset put: value [
	"I store 64-bit integers in Smalltalk (little-endian) order."
	^self integerAt: byteOffset put: value size: 8 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedShortAt: byteOffset [
	"Return a 16bit unsigned integer starting at the given byte offset"
	^self integerAt: byteOffset size: 2 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> ffiUnsignedShortAt: byteOffset put: value [
	"Store a 16bit unsigned integer starting at the given byte offset"
	^self integerAt: byteOffset put: value size: 2 signed: false
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcDoubleAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadFloat64FromMemory;
			lowcodeFloat64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcDoubleAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToFloat64;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreFloat64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcFloatAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadFloat32FromMemory;
			lowcodeFloat32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcFloatAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToFloat32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreFloat32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcPointerAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadPointerFromMemory;
			lowcodePointerToOop: ExternalAddress;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcPointerAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToPointer;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStorePointerToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedByteAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt8FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedByteAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt8ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt32FromMemory;
			lowcodeInt32ToOop;
			returnTop
	] 
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedLongLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt64FromMemory;
			lowcodeInt64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedLongLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt64;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedShortAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt16FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcSignedShortAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt16ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedByteAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt8FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedByteAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt8ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt32FromMemory;
			lowcodeUint32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToUInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedLongLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt64FromMemory;
			lowcodeUint64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedLongLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToUInt64;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedShortAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt16FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ByteArray >> lcUnsignedShortAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeFirstFieldPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt16ToMemory;
			
			pushTemp: value;
			returnTop
	]
]
