Extension { #name : #ByteArray }

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat32AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadFloat32FromMemory;
			returnFloat32
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToFloat32;
			storeFloat32ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat64AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadFloat64FromMemory;
			returnFloat64
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToFloat64;
			storeFloat64ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt16AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadInt16FromMemory;
			returnSmallInteger
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt16AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt16ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt32AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadInt32FromMemory;
			returnInt32
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt64AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadInt64FromMemory;
			returnInt64
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToInt64;
			storeInt64ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt8AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadInt8FromMemory;
			returnSmallInteger
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt8AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt8ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiLongAt: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerOffset32;
			
			loadInt32FromMemory;
			returnInt32
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiLongAt: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt16AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen  pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadUInt16FromMemory;
			returnSmallInteger
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt16AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt16ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt32AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen  pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadUInt32FromMemory;
			returnUInt32
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt64AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadUInt64FromMemory;
			returnUInt64
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToUInt64;
			storeInt64ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt8AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			loadUInt8FromMemory;
			returnSmallInteger
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt8AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt8ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiULongAt: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerOffset32;
			
			loadUInt32FromMemory;
			returnUInt32
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiULongAt: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]
