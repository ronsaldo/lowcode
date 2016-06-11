"
I am ordered collection that holds inline data.
"
Class {
	#name : #NativeOrderedCollection,
	#superclass : #SequenceableCollection,
	#instVars : [
		'type',
		'size',
		'data',
		'capacity'
	],
	#category : #'Lowcode-TypeSystem-Collections'
}

{ #category : #'instance creation' }
NativeOrderedCollection class >> for: type [
	^ self new type: type asLowcodeType
]

{ #category : #'instance creation' }
NativeOrderedCollection class >> for: type new: initialCapacity [
	^ self new type: type asLowcodeType; capacity: initialCapacity; yourself
]

{ #category : #adding }
NativeOrderedCollection >> add: newElement [
	^self addLast: newElement
]

{ #category : #adding }
NativeOrderedCollection >> addLast: newElement [
	size >= capacity ifTrue: [ self increaseCapacity ].
	self uncheckedAt: size + 1 put: newElement.
	size := size + 1.
	^ newElement
]

{ #category : #converting }
NativeOrderedCollection >> asByteArray [
	| result |
	size = 0 ifTrue: [ ^ ByteArray new ].
	result := ByteArray new: size * self elementSize.
	LibC memCopy: data to: result size: result size.
	^ result
]

{ #category : #accessing }
NativeOrderedCollection >> at: index [
	(index < 1 or: [ index > size ]) ifTrue: [ self errorSubscriptBounds: index ].
	^ self uncheckedAt: index
]

{ #category : #accessing }
NativeOrderedCollection >> at: index put: anElement [
	(index < 1 or: [ index >= size ]) ifTrue: [ self errorSubscriptBounds: index ].
	^ self uncheckedAt: index put: anElement
]

{ #category : #accessing }
NativeOrderedCollection >> capacity [
	^ capacity
]

{ #category : #accessing }
NativeOrderedCollection >> capacity: newCapacity [
	| newData |
	newCapacity = 0 ifTrue: [
		capacity := 0.
		size := 0.
		data := nil.
	].

	newData := ByteArray new: newCapacity * self elementSize.
	(size min: capacity) > 0 ifTrue: [
		LibC memCopy: data to: newData size: (size min: capacity) * self elementSize
	].
	capacity := newCapacity.
	data := newData.
]

{ #category : #enumerating }
NativeOrderedCollection >> collect: aBlock type: newType [
	"Evaluate aBlock with each of my elements as the argument. Collect the 
	resulting values into a collection that is like me. Answer the new 
	collection. Override superclass in order to use addLast:, not at:put:."

	| newCollection |
	newCollection := self class for: newType new: self size.
	1 to: size do:
		[:index |
		newCollection addLast: (aBlock value: (self uncheckedAt: index))].
	^ newCollection
]

{ #category : #enumerating }
NativeOrderedCollection >> collectWithSameType: aBlock [ 
	^ self collect: aBlock type: type
]

{ #category : #private }
NativeOrderedCollection >> computeElementOffset: index [
	^ (index - 1) * self elementSize.
]

{ #category : #private }
NativeOrderedCollection >> computeElementPosition: index [
	^ (index - 1) * self elementSize + 1.
]

{ #category : #accessing }
NativeOrderedCollection >> elementSize [
	^ type size
]

{ #category : #private }
NativeOrderedCollection >> increaseCapacity [
	| newCapacity |
	newCapacity := capacity * 2.
	newCapacity = 0 ifTrue: [ newCapacity := 8 ].
	self capacity: newCapacity.
]

{ #category : #initialization }
NativeOrderedCollection >> initialize [
	size := 0.
	capacity := 0.
]

{ #category : #'type checking' }
NativeOrderedCollection >> lowcodeCheckArrayArgument: expectedElementType elements: expectedNumberOfElements [
	(expectedElementType withoutAliases ~= type withoutAliases or: [ self size < expectedNumberOfElements ]) ifTrue: [
		super lowcodeCheckArrayArgument: expectedElementType elements: expectedNumberOfElements
 ]
]

{ #category : #accessing }
NativeOrderedCollection >> rawData [
	^ data
]

{ #category : #accessing }
NativeOrderedCollection >> rawDataSize [
	^ self elementSize * size
]

{ #category : #removing }
NativeOrderedCollection >> removeAll [
	size := 0.
]

{ #category : #accessing }
NativeOrderedCollection >> size [
	^ size
]

{ #category : #private }
NativeOrderedCollection >> species [
	^ Array
]

{ #category : #accessing }
NativeOrderedCollection >> type [
	^ type
]

{ #category : #accessing }
NativeOrderedCollection >> type: anObject [
	type := anObject
]

{ #category : #private }
NativeOrderedCollection >> uncheckedAt: index [
	^ type fromStructure: data offset: (self computeElementOffset: index).
]

{ #category : #private }
NativeOrderedCollection >> uncheckedAt: index put: anElement [
	type write: anElement toStructure: data offset: (self computeElementOffset: index).
	^ anElement
]

{ #category : #'as yet unclassified' }
NativeOrderedCollection >> useDataFromByteArray: aByteArray [
	data := aByteArray.
	capacity := size := aByteArray size // self elementSize.
]
