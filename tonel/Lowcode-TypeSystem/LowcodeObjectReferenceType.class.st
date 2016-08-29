"
I represent objects that are used for boxing native values.
"
Class {
	#name : #LowcodeObjectReferenceType,
	#superclass : #LowcodeObjectType,
	#instVars : [
		'referenced'
	],
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #construction }
LowcodeObjectReferenceType class >> referenced: aLowcodeType [
	^ self new referenced: aLowcodeType
]

{ #category : #'type decorators' }
LowcodeObjectReferenceType >> classType [
	^ referenced classType
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	referenced emitArgumentTypeCheck: aMethodBuilder name: argumentName

]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldReference: aMethodBuilder type: referenceType offset: fieldOffset [
	self assert: referenced isStructureType.
	referenceType isBoxedStructureReferenceType ifFalse: [
		referenced emitFieldPointerFromObject: aMethodBuilder offset: fieldOffset.
	]
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldStoreAndPop: aMethodBuilder type: fieldType offset: fieldOffset [
	self assert: referenced isStructureType.
	referenced emitFieldPointerFromObject: aMethodBuilder offset: fieldOffset.
	fieldType emitMemoryStoreAndPop: aMethodBuilder
	
]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldStoreAndPop: aMethodBuilder type: fieldType offset: fieldOffset valueType: valueType receiverTemp: tempVar [
	| valueTemp |
	self assert: referenced isStructureType.
	(fieldType isStructureType and: [ fieldType hasDirectStoreFrom: valueType ]) ifTrue: [
		valueTemp := aMethodBuilder generateTempOfType: valueType.
		valueType emitLocalStoreAndPop: aMethodBuilder name: valueTemp.
		
		aMethodBuilder
			pushTemp: tempVar;
			lowcodeFirstFieldPointer;
			lowcodePointerAddConstantOffset: fieldOffset.
			 
		valueType emitLocalValue: aMethodBuilder name: valueTemp.
		fieldType emitMemoryStoreAndPopPointerFirst: aMethodBuilder valueType: valueType.
		
	] ifFalse: [
		self
			emitLocalValue: aMethodBuilder name: tempVar;
			emitFieldStoreAndPop: aMethodBuilder type: fieldType offset: fieldOffset
	].

]

{ #category : #emitting }
LowcodeObjectReferenceType >> emitFieldValue: aMethodBuilder type: fieldType offset: fieldOffset [
	self assert: referenced isStructureType.
	referenced emitFieldPointerFromObject: aMethodBuilder offset: fieldOffset.
	fieldType emitMemoryValue: aMethodBuilder
	
]

{ #category : #accessing }
LowcodeObjectReferenceType >> extraClassDependencies [
	^ referenced extraClassDependencies
]

{ #category : #accessing }
LowcodeObjectReferenceType >> fieldOffset: fieldName [
	^ referenced fieldOffset: fieldName
]

{ #category : #accessing }
LowcodeObjectReferenceType >> fieldReferenceType: fieldName [
	| fieldType |
	fieldType := self fieldType: fieldName.
	^ fieldType ifNotNil: [ LowcodeBoxedStructureFieldReferenceType referenced: fieldType offset: (self fieldOffset: fieldName)]
]

{ #category : #accessing }
LowcodeObjectReferenceType >> fieldType: aFieldName [
	^ referenced fieldType: aFieldName
]

{ #category : #accessing }
LowcodeObjectReferenceType >> getCompiledMethodForSelector: aSelector [
	^ referenced getCompiledMethodForSelector: aSelector
]

{ #category : #'type inference' }
LowcodeObjectReferenceType >> getReturnTypeForSelector: selector [
	^ referenced getReturnTypeForSelector: selector
]

{ #category : #testing }
LowcodeObjectReferenceType >> isAccessorMessage: aSelector [
	^ referenced isAccessorMessage: aSelector
]

{ #category : #testing }
LowcodeObjectReferenceType >> isAnyObject [
	^ false
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
