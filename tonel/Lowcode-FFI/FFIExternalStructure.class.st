Class {
	#name : #FFIExternalStructure,
	#superclass : #FFIStructure,
	#instVars : [
		'data'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #converting }
FFIExternalStructure class >> asFFIExternalType: gen [
	^ FFIExternalStructureType objectClass: self
]

{ #category : #'instance creation' }
FFIExternalStructure class >> externalNew [
	"Allocate enough bytes on external heap to hold my instance data, then answer an instance
	which using external data.
	
	Please note, that if you create my instances on external heap, do not forget to free memory after use, e.g.
	
	struct address free.
	"
	
	^ self fromPointer: (FFI allocate: self instanceSize).

]

{ #category : #'instance creation' }
FFIExternalStructure class >> fromPointer: externalAddress [

	"Create an instance of receiver from given external address. "
	
	^self basicNew initializeWithAddress: externalAddress.
	
]

{ #category : #'instance creation' }
FFIExternalStructure class >> new [
	^self basicNew initializeInternal
]

{ #category : #'initialize-release' }
FFIExternalStructure >> fieldAt: fieldName [
	^ (self ffiCalloutIn: thisContext sender)
		function: #(oop (void* data)) emit: [ :gen :cs |
			self emit: gen read: fieldName spec: cs
		]
]

{ #category : #'initialize-release' }
FFIExternalStructure >> fieldAt: fieldName put: anObject [
	^ (self ffiCalloutIn: thisContext sender)
		function: #(void (void* data, oop anObject)) emit: [ :gen :cs |
			self emit: gen write: fieldName spec: cs
		]
]

{ #category : #'initialize-release' }
FFIExternalStructure >> free [
	"A convenience method, to explicitly free external memory, symmetrical when using
	#externalNew protocol for creating receiver.
	Do nothing if receiver is not pointing to external heap. 
	" 
	self isExternal ifTrue: [
		data free.
	].
]

{ #category : #initialization }
FFIExternalStructure >> initializeInternal [
	"initialize receiver with data held in object memory heap "
	data := ByteArray new: self class instanceSize.

	self initialize.
]

{ #category : #initialization }
FFIExternalStructure >> initializeWithAddress: anExternalAddress [
	"initialize the receiver with data held in external memory"
	data := anExternalAddress.

]

{ #category : #testing }
FFIExternalStructure >> isExternal [
	"answer true if data referenced by receiver located in external heap, or just in object memory "
	^ data class == FFIExternalAddress
]

{ #category : #copying }
FFIExternalStructure >> postCopy [
	"Copy is always internal, e.g, when making copy of structure with external address,
	 a copy will hold same data in its bytearray (in object memory)
	"
	self isExternal 
		ifFalse: [ data := data copy ]
		ifTrue: [ 
			| newData |
			newData := ByteArray new: self class instanceSize.
			FFI memCopy: data to: newData size: self class instanceSize.
			data := newData
	 ]
]
