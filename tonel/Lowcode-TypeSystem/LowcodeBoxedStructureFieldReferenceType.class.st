"
I am used to represent a reference to a value that is boxed in a Smalltalk object.
"
Class {
	#name : #LowcodeBoxedStructureFieldReferenceType,
	#superclass : #LowcodeReferenceType,
	#instVars : [
		'offset'
	],
	#category : #'Lowcode-TypeSystem-Types'
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
	referenced emitConversionToObject: methodBuilder boxedStructureFieldType: self
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitDeReference: methodBuilder [
	methodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset.
	referenced emitMemoryValue: methodBuilder
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitDuplicate: methodBuilder [
	methodBuilder
		pushDup
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitFieldReference: aMethodBuilder type: referenceType offset: fieldOffset [
	referenceType isBoxedStructureReferenceType ifFalse: [
		aMethodBuilder
			lowcodeFirstFieldPointer;
			lowcodePointerAddConstantOffset: fieldOffset
	]
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitFieldStoreAndPop: aMethodBuilder type: fieldType offset: fieldOffset valueType: valueType receiverTemp: tempVar [
	| valueTemp |
	(fieldType isStructureType and: [ fieldType hasDirectStoreFrom: valueType ]) ifTrue: [
		valueTemp := aMethodBuilder generateTempOfType: valueType.
		valueType emitLocalStoreAndPop: aMethodBuilder name: valueTemp.
		
		aMethodBuilder
			pushTemp: tempVar;
			lowcodeFirstFieldPointer;
			lowcodePointerAddConstantOffset: fieldOffset + offset.
			 
		valueType emitLocalValue: aMethodBuilder name: valueTemp.
		fieldType emitMemoryStoreAndPopPointerFirst: aMethodBuilder valueType: valueType.
		
	] ifFalse: [
		aMethodBuilder
			pushTemp: tempVar;
			lowcodeFirstFieldPointer;
			lowcodePointerAddConstantOffset: fieldOffset + offset.
		fieldType emitMemoryStoreAndPop: aMethodBuilder
	].

]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitLocalStore: aMethodBuilder valueType: valueType name: localName [
	self assert: self = valueType.
	aMethodBuilder
		storeTemp: localName
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitLocalStoreAndPop: aMethodBuilder name: localName [
	aMethodBuilder
		storeTemp: localName;
		popTop
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitLocalValue: aMethodBuilder name: localName [
	aMethodBuilder pushTemp: localName
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitPop: aMethodBuilder [ 
	aMethodBuilder popTop
]

{ #category : #emitting }
LowcodeBoxedStructureFieldReferenceType >> emitReferenceToPointer: methodBuilder [
	methodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset
]

{ #category : #accessing }
LowcodeBoxedStructureFieldReferenceType >> fieldReferenceType: fieldName [
	| fieldType |
	fieldType := self fieldType: fieldName.
	^ fieldType ifNotNil: [ LowcodeBoxedStructureFieldReferenceType referenced: fieldType offset: (self fieldOffset: fieldName) + offset]
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

{ #category : #accessing }
LowcodeBoxedStructureFieldReferenceType >> size [
	self shouldNotImplement
]
