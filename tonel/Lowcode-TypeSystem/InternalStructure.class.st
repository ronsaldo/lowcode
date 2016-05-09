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
