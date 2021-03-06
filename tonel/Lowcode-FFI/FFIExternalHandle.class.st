Class {
	#name : #FFIExternalHandle,
	#superclass : #Object,
	#type : #bytes,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #accessing }
FFIExternalHandle class >> instanceSize [
	^ FFI pointerSize
]

{ #category : #'instance creation' }
FFIExternalHandle class >> new [
	^ self basicNew: (FFI pointerSize)
]

{ #category : #'instance creation' }
FFIExternalHandle class >> value: address [
	^ self new value: address
]

{ #category : #'as yet unclassified' }
FFIExternalHandle >> isNull [
	^ self value = 0
]

{ #category : #'as yet unclassified' }
FFIExternalHandle >> printOn: aStream [

	aStream nextPutAll: '@ 16r';
		nextPutAll: (self value printStringBase: 16)


]

{ #category : #'as yet unclassified' }
FFIExternalHandle >> value [
	^ Lowcode here: [ :gen |
		gen emitSessionCheck;
			pushReceiver;
			firstIndexableFieldPointer;
			loadPointerFromMemory.
			
		self class instanceSize = 4 ifTrue: [
			gen pointerToInt32;
				uint32ToOop;
				returnTop
		] ifFalse: [	
			gen pointerToInt64;
				uint64ToOop;
				returnTop
		].
	]
]

{ #category : #'as yet unclassified' }
FFIExternalHandle >> value: address [
	^ Lowcode here: [ :gen |
		gen emitSessionCheck;
			pushReceiver;
			firstIndexableFieldPointer;
			pushTemp: 0.
			self class instanceSize = 4 ifTrue: [
				gen oopToUInt32;
					int32ToPointer
			] ifFalse: [	
				gen oopToUInt64;
					int64ToPointer
			].
			
			gen storePointerToMemory;
				returnReceiver
	]
]
