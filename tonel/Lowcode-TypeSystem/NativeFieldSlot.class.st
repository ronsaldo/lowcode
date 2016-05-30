"
I represent a native field slot. I am used as virtual slots by the StructureLayout and its subclases. 

"
Class {
	#name : #NativeFieldSlot,
	#superclass : #Slot,
	#instVars : [
		'offset',
		'type'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #comparing }
NativeFieldSlot >> = other [
	^ super = other and: [offset = other offset and: [type = other type]]
]

{ #category : #accessing }
NativeFieldSlot >> alignment [
	^ type alignment
]

{ #category : #emitting }
NativeFieldSlot >> emitLowcodeReference: aMethodBuilder type: referenceType [
	aMethodBuilder pushReceiver.
	referenceType isBoxedStructureReferenceType ifFalse: [
		aMethodBuilder
			lowcodeFirstFieldPointer;
			lowcodePointerAddConstantOffset: offset.
	].

]

{ #category : #emitting }
NativeFieldSlot >> emitLowcodeStore: aMethodBuilder valueType: valueType [
	type emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType
]

{ #category : #emitting }
NativeFieldSlot >> emitLowcodeValue: aMethodBuilder [
	type emitLowcodeValue: aMethodBuilder selfOffset: offset
]

{ #category : #accessing }
NativeFieldSlot >> fieldSize [
	^ type size
]

{ #category : #comparing }
NativeFieldSlot >> hash [
	^ (super hash bitXor: offset hash) bitXor: type hash
]

{ #category : #accessing }
NativeFieldSlot >> index [
	^ 0
]

{ #category : #accessing }
NativeFieldSlot >> isVirtual [
	^ true
]

{ #category : #accessing }
NativeFieldSlot >> lowcodeReferenceType [
	^ LowcodeBoxedStructureFieldReferenceType referenced: type offset: offset
]

{ #category : #accessing }
NativeFieldSlot >> lowcodeType [
	^ type
]

{ #category : #accessing }
NativeFieldSlot >> offset [
	^ offset
]

{ #category : #accessing }
NativeFieldSlot >> offset: anObject [
	offset := anObject
]

{ #category : #printing }
NativeFieldSlot >> printOn: aStream [
	name printOn: aStream.
	aStream nextPutAll: ' &=> '.
	type printOn: aStream.
]

{ #category : #'meta-object-protocol' }
NativeFieldSlot >> read: anObject [
	^ type fromStructure: anObject offset: offset
]

{ #category : #accessing }
NativeFieldSlot >> type [
	^ type
]

{ #category : #accessing }
NativeFieldSlot >> type: anObject [
	type := anObject
]

{ #category : #'meta-object-protocol' }
NativeFieldSlot >> write: aValue to: anObject [
	^ type write: aValue toStructure: anObject offset: offset 
]
