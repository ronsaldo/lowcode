Class {
	#name : #FFIInternalStructure,
	#superclass : #FFIStructure,
	#type : #bytes,
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIInternalStructure class >> asFFIExternalType: gen [
	^ FFIInternalStructureType objectClass: self
]

{ #category : #accessing }
FFIInternalStructure >> address [
	"Answer an object which can be used as an address, pointing to first byte of external structure."
	^ self
]

{ #category : #private }
FFIInternalStructure >> fieldAt: fieldName [
	^ (self ffiCalloutIn: thisContext sender)
		function: #(oop (self)) emit: [ :gen :cs |
			self emit: gen read: fieldName spec: cs
		]
]

{ #category : #private }
FFIInternalStructure >> fieldAt: fieldName put: anObject [
	^ (self ffiCalloutIn: thisContext sender)
		function: #(void (self, oop anObject)) emit: [ :gen :cs |
			self emit: gen write: fieldName spec: cs
		]
]
