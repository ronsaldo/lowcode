"
I am used to hold a box to a pointer.
"
Class {
	#name : #NativePointerBox,
	#superclass : #Object,
	#instVars : [
		'type',
		'pointer'
	],
	#category : #'Lowcode-TypeSystem-Collections'
}

{ #category : #'as yet unclassified' }
NativePointerBox class >> type: type pointer: pointer [
	^ self new type: type; pointer: pointer; yourself
]

{ #category : #accessing }
NativePointerBox >> at: index [
	^ self uncheckedAt: index
]

{ #category : #accessing }
NativePointerBox >> at: index put: value [
	^ self uncheckedAt: index put: value
]

{ #category : #private }
NativePointerBox >> computeElementOffset: index [
	^ (index - 1) * self elementSize.
]

{ #category : #freeing }
NativePointerBox >> delete [
	pointer free.
	pointer := nil.
]

{ #category : #accessing }
NativePointerBox >> elementSize [
	^ type size
]

{ #category : #testing }
NativePointerBox >> isNull [
	^ pointer isNil or: [ pointer isNull ]
]

{ #category : #accessing }
NativePointerBox >> pointer [
	^ pointer
]

{ #category : #accessing }
NativePointerBox >> pointer: anObject [
	pointer := anObject
]

{ #category : #printing }
NativePointerBox >> printOn: aStream [
	aStream print: type.
	self isNull
		ifTrue: [ aStream nextPutAll: ' nativeNullPointer'  ]
		ifFalse: [ aStream nextPutAll: ' nativePointer: '; print: pointer value ]
	
]

{ #category : #accessing }
NativePointerBox >> type [
	^ type
]

{ #category : #accessing }
NativePointerBox >> type: anObject [
	type := anObject
]

{ #category : #private }
NativePointerBox >> uncheckedAt: index [
	^ type fromMemory: pointer offset: (self computeElementOffset: index).
]

{ #category : #private }
NativePointerBox >> uncheckedAt: index put: value [
	type write: value toMemory: pointer offset: (self computeElementOffset: index).
	^ value
]

{ #category : #'pointer accessor' }
NativePointerBox >> value [
	^ type fromMemory: pointer offset: 0
]

{ #category : #'pointer accessor' }
NativePointerBox >> value: aNewValue [
	^ type write: aNewValue toMemory: pointer offset: 0
]
