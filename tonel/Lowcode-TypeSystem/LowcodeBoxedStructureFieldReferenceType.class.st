Class {
	#name : #LowcodeBoxedStructureFieldReferenceType,
	#superclass : #LowcodeReferenceType,
	#instVars : [
		'offset'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeBoxedStructureFieldReferenceType class >> referenced: aLowcodeType offset: anOffset [
	^ self new referenced: aLowcodeType; offset: anOffset; yourself
]

{ #category : #comparing }
LowcodeBoxedStructureFieldReferenceType >> = other [
	^ super = other and: [ offset = other offset ]
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitConversionToObject: methodBuilder [
	methodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset.
	referenced emitLowcodeMemoryValueAsObject: methodBuilder
]

{ #category : #comparing }
LowcodeBoxedStructureFieldReferenceType >> hash [
	^ super hash bitXor: offset
]

{ #category : #testing }
LowcodeBoxedStructureFieldReferenceType >> isBoxedStructureReferenceType [
	^ true
]

{ #category : #accessing }
LowcodeBoxedStructureFieldReferenceType >> offset [
	^ offset
]

{ #category : #accessing }
LowcodeBoxedStructureFieldReferenceType >> offset: anObject [
	offset := anObject
]

{ #category : #printing }
LowcodeBoxedStructureFieldReferenceType >> printOn: aStream [
	aStream nextPutAll: '#('; print: referenced; nextPutAll: ' objectRefAt: '; print: offset; nextPutAll: ')'
]
