"
I am the base class of an internal structure. This is like a C structure that can be optimized by the compiler.

"
Class {
	#name : #InternalStructure,
	#superclass : #Object,
	#category : #'Lowcode-TypeSystem'
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

{ #category : #converting }
InternalStructure >> asByteArray [
	| result |
	result := ByteArray new: self size.
	self storeBytesIn: result position: 1.
	^ result
]

{ #category : #'memory access' }
InternalStructure >> readBytesFrom: aByteArray [
	self readBytesFrom: aByteArray position: 1
]

{ #category : #'memory access' }
InternalStructure >> readBytesFrom: aByteArray position: byteArrayPosition [
	| layoutSize |
	layoutSize := self size.
	1 to: layoutSize do: [ :i |
		self basicAt: i put: (aByteArray at: byteArrayPosition + i - 1)
	]
]

{ #category : #'memory access' }
InternalStructure >> storeBytesIn: aByteArray [
	self storeBytesIn: aByteArray position: 1
]

{ #category : #'memory access' }
InternalStructure >> storeBytesIn: aByteArray position: byteArrayPosition [
	| layoutSize |
	layoutSize := self size.
	1 to: layoutSize do: [ :i |
		aByteArray at: byteArrayPosition + i - 1 put: (self basicAt: i)
	]
]
