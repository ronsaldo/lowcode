Class {
	#name : #LowcodeStructureType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #'type decorators' }
LowcodeStructureType >> classType [
	^ LowcodeClassType referenced: self.
]

{ #category : #testing }
LowcodeStructureType >> isStructureType [
	^ true
]

{ #category : #'type decorators' }
LowcodeStructureType >> object [
	^ LowcodeObjectReferenceType referenced: self.
]
