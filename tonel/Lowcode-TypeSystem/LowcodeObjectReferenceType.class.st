Class {
	#name : #LowcodeObjectReferenceType,
	#superclass : #LowcodeObjectType,
	#instVars : [
		'referenced'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeObjectReferenceType class >> referenced: aLowcodeType [
	^ self new referenced: aLowcodeType
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	referenced emitArgumentTypeCheck: aMethodBuilder name: argumentName

]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldStoreAndPop: aMethodBuilder type: fieldType offset: fieldOffset [
	self assert: referenced isStructureType.
	referenced emitFieldPointerFromObject: aMethodBuilder offset: fieldOffset.
	fieldType emitMemoryStoreAndPop: aMethodBuilder
	
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldValue: aMethodBuilder type: fieldType offset: fieldOffset [
	self assert: referenced isStructureType.
	referenced emitFieldPointerFromObject: aMethodBuilder offset: fieldOffset.
	fieldType emitMemoryValue: aMethodBuilder
	
]

{ #category : #accessing }
LowcodeObjectReferenceType >> fieldOffset: fieldName [
	^ referenced fieldOffset: fieldName
]

{ #category : #accessing }
LowcodeObjectReferenceType >> fieldType: aFieldName [
	^ referenced fieldType: aFieldName
]

{ #category : #testing }
LowcodeObjectReferenceType >> isAccessorMessage: aSelector [
	^ referenced isAccessorMessage: aSelector
]

{ #category : #testing }
LowcodeObjectReferenceType >> isObjectReference [
	^ true
]

{ #category : #printing }
LowcodeObjectReferenceType >> printOn: aStream [
	aStream nextPutAll: '#('; print: referenced; nextPutAll: ' object)'
]

{ #category : #accessing }
LowcodeObjectReferenceType >> referenced [
	^ referenced
]

{ #category : #accessing }
LowcodeObjectReferenceType >> referenced: anObject [
	referenced := anObject
]
