"
I am the base class of an internal structure. This is like a C structure that can be optimized by the compiler.

"
Class {
	#name : #InternalStructure,
	#superclass : #Object,
	#category : #'Lowcode-TypeSystem-InternalStructure'
}

{ #category : #accessing }
InternalStructure class >> asLowcodeTypeAtEnvironment: anEnvironment [
	^ LowcodeInternalStructureType new structureClass: self
]

{ #category : #'instance creation' }
InternalStructure class >> basicNew [
	^ super basicNew: layout structureSize
]

{ #category : #'instance creation' }
InternalStructure class >> newFrom: aByteArrayOrExternalAddress [
	^ self basicNew readBytesFrom: aByteArrayOrExternalAddress
]

{ #category : #'instance creation' }
InternalStructure class >> newFrom: aByteArrayOrExternalAddress position: position [
	^ self basicNew readBytesFrom: aByteArrayOrExternalAddress position: position
]

{ #category : #accessing }
InternalStructure class >> structureAlignment [
	^ layout structureAlignment
]

{ #category : #accessing }
InternalStructure class >> structureSize [
	^ layout structureSize
]

{ #category : #converting }
InternalStructure >> asByteArray [
	| result |
	result := ByteArray new: self class structureSize.
	self storeBytesIn: result position: 1.
	^ result
]

{ #category : #accessing }
InternalStructure >> byteAt: position [
	^ self basicAt: position
]

{ #category : #accessing }
InternalStructure >> byteAt: position put: value [
	^ self basicAt: position put: value
]

{ #category : #'memory access' }
InternalStructure >> readBytesFrom: aByteArray [
	self readBytesFrom: aByteArray position: 1
]

{ #category : #'memory access' }
InternalStructure >> readBytesFrom: aByteArray position: byteArrayPosition [
	| layoutSize |
	layoutSize := self class structureSize.
	1 to: layoutSize do: [ :i |
		self basicAt: i put: (aByteArray byteAt: byteArrayPosition + i - 1)
	]
]

{ #category : #'memory access' }
InternalStructure >> readBytesFrom: aByteArray size: readSize position: byteArrayPosition [
	1 to: readSize do: [ :i |
		self basicAt: i put: (aByteArray byteAt: byteArrayPosition + i - 1)
	]
]

{ #category : #'as yet unclassified' }
InternalStructure >> replaceFrom: start to: stop with: replacement startingAt: repStart [ 
	"This destructively replaces elements from start to stop in the receiver 
	starting at index, repStart, in the sequenceable collection, 
	replacementCollection. Answer the receiver. No range checks are 
	performed."

	| index repOff |
	repOff := repStart - start.
	index := start - 1.
	[(index := index + 1) <= stop]
		whileTrue: [self byteAt: index put: (replacement at: repOff + index)]
]

{ #category : #'memory access' }
InternalStructure >> storeBytesIn: aByteArray [
	self storeBytesIn: aByteArray position: 1
]

{ #category : #'memory access' }
InternalStructure >> storeBytesIn: aByteArray position: byteArrayPosition [
	| layoutSize |
	layoutSize := self class structureSize.
	1 to: layoutSize do: [ :i |
		aByteArray byteAt: byteArrayPosition + i - 1 put: (self basicAt: i)
	]
]
