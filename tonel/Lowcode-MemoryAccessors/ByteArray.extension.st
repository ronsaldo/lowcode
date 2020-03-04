Extension { #name : #ByteArray }

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
