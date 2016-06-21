"
I am an array that holds native data.
"
Class {
	#name : #NativeArray,
	#superclass : #ArrayedCollection,
	#instVars : [
		'type',
		'size',
		'data'
	],
	#category : #'Lowcode-TypeSystem-Collections'
}

{ #category : #'instance creation' }
NativeArray class >> for: type new: size [
	^ self basicNew initFor: type size: size
]

{ #category : #'instance creation' }
NativeArray class >> new [
	self error: 'A type is required'
]

{ #category : #'instance creation' }
NativeArray class >> new: aSize [
	self error: 'A type is required'
]

{ #category : #converting }
NativeArray >> asByteArray [
	^ data
]

{ #category : #accessing }
NativeArray >> at: index [
	(index < 1 or: [ index > size ]) ifTrue: [ self errorSubscriptBounds: index ].
	^ self uncheckedAt: index
]

{ #category : #accessing }
NativeArray >> at: index put: anElement [
	(index < 1 or: [ index > size ]) ifTrue: [ self errorSubscriptBounds: index ].
	^ self uncheckedAt: index put: anElement
]

{ #category : #private }
NativeArray >> computeElementOffset: index [
	^ (index - 1) * self elementSize.
]

{ #category : #accessing }
NativeArray >> elementSize [
	^ type size
]

{ #category : #private }
NativeArray >> initFor: newType size: newSize [
	type := newType asLowcodeType.
	size := newSize.
	data := ByteArray new: self rawDataSize.
]

{ #category : #'type checking' }
NativeArray >> lowcodeCheckArrayArgument: expectedElementType elements: expectedNumberOfElements [
	(expectedElementType withoutAliases ~= type withoutAliases or: [ self size < expectedNumberOfElements ]) ifTrue: [
		super lowcodeCheckArrayArgument: expectedElementType elements: expectedNumberOfElements
 ]
]

{ #category : #accessing }
NativeArray >> rawData [
	^ data
]

{ #category : #accessing }
NativeArray >> rawDataSize [
	^ self elementSize * size
]

{ #category : #accessing }
NativeArray >> size [
	^ size
]

{ #category : #private }
NativeArray >> species [
	^ Array
]

{ #category : #private }
NativeArray >> uncheckedAt: index [
	^ type fromStructure: data offset: (self computeElementOffset: index).
]

{ #category : #private }
NativeArray >> uncheckedAt: index put: anElement [
	type write: anElement toStructure: data offset: (self computeElementOffset: index).
	^ anElement
]
