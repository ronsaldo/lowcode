Extension { #name : #ExternalAddress }

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcDoubleAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadFloat64FromMemory;
			lowcodeFloat64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcDoubleAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToFloat64;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreFloat64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcFloatAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadFloat32FromMemory;
			lowcodeFloat32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcFloatAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToFloat32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreFloat32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedByteAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt8FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedByteAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt8ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt32FromMemory;
			lowcodeInt32ToOop;
			returnTop
	] 
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedLongLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt64FromMemory;
			lowcodeInt64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedLongLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt64;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedShortAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadInt16FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcSignedShortAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt16ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedByteAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt8FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedByteAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt8ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt32FromMemory;
			lowcodeUint32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToUInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt32ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedLongLongAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt64FromMemory;
			lowcodeUint64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedLongLongAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToUInt64;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt64ToMemory;
			
			pushTemp: value;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedShortAt: index [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeLoadUInt16FromMemory;
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-MemoryAccessors' }
ExternalAddress >> lcUnsignedShortAt: index put: value [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			pushTemp: value;
			lowcodeOopToInt32;
	
			pushReceiver;
			lowcodeOopToPointer;
			
			pushTemp: index;
			lowcodePointerAddOopIndex;
			
			lowcodeStoreInt16ToMemory;
			
			pushTemp: value;
			returnTop
	]
]
