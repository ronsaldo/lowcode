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
			firstFieldPointer;
			loadPointerFromMemory.
			
		self class instanceSize = 4 ifTrue: [
			gen pointerToInt32;
				returnUInt32AsOop
		] ifFalse: [	
			gen pointerToInt64;
				returnUInt64AsOop
		].
	]
]

{ #category : #'as yet unclassified' }
FFIExternalHandle >> value: address [
	^ Lowcode here: [ :gen |
		gen emitSessionCheck;
			pushReceiver;
			firstFieldPointer;
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
