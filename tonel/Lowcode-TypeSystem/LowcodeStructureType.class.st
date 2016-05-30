Class {
	#name : #LowcodeStructureType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #testing }
LowcodeStructureType >> canBePushedInTheStack [
	^ false
]

{ #category : #'type decorators' }
LowcodeStructureType >> classType [
	^ LowcodeClassType referenced: self.
]

{ #category : #emitting }
LowcodeStructureType >> emitConversionFromObject: aMethodBuilder [
	self error: 'Structures cannot be pushed into the operand stack.'
]

{ #category : #emitting }
LowcodeStructureType >> emitConversionToObject: aMethodBuilder [
	self error: 'Structures cannot be pushed into the operand stack.'
]

{ #category : #emitting }
LowcodeStructureType >> hasDirectStoreFrom: valueType [
	valueType = self ifTrue: [ ^ true ].
	(valueType isReferenceType and: [ valueType baseType = self ]) ifTrue: [ ^ true ].
	(valueType isObjectReference and: [ valueType referenced = self]) ifTrue: [ ^ true ].
	^ false
]

{ #category : #testing }
LowcodeStructureType >> isStructureType [
	^ true
]

{ #category : #'type decorators' }
LowcodeStructureType >> object [
	^ LowcodeObjectReferenceType referenced: self.
]
