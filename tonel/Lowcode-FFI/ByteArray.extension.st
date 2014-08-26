Extension { #name : #ByteArray }

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat32AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
			loadFloat32FromMemory;
			float32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadFloat64FromMemory;
			float64ToOop;
			returnTop

	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiFloat64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadInt16FromMemory;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt16AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadInt32FromMemory;
			int32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadInt64FromMemory;
			int64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadInt8FromMemory;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiInt8AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt8ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiLongAt: oneBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerAddOffset32;
			
			loadInt32FromMemory;
			int32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiLongAt: oneBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pushOne32;
			sub32;
			pointerAddOffset32;
			
			pushTemp: 1;
			oopToInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt16AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
			loadUInt16FromMemory;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt16AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt16ToMemory;
			returnReceiver
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt32AtOffset: zeroBasedOffset [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
			loadUInt32FromMemory;
			uint32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt32AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadUInt64FromMemory;
			uint64ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt64AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadUInt8FromMemory;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'*Lowcode-FFI' }
ByteArray >> ffiUInt8AtOffset: zeroBasedOffset put: value [
	^ Lowcode here: [ :gen |
		gen pushReceiver;
			firstIndexableFieldPointer;
			
			pushTemp: 0;
			oopToInt32;
			pointerAddOffset32;
			
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
			pointerAddOffset32;
			
			loadUInt32FromMemory;
			uint32ToOop;
			returnTop
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
			pointerAddOffset32;
			
			pushTemp: 1;
			oopToUInt32;
			storeInt32ToMemory;
			returnReceiver
	]
]
