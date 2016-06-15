Class {
	#name : #LowcodeInternalStructureType,
	#superclass : #LowcodeStructureType,
	#instVars : [
		'structureClass'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #comparing }
LowcodeInternalStructureType >> = other [
	^ self class = other class and: [ structureClass == other structureClass ]
]

{ #category : #accessing }
LowcodeInternalStructureType >> alignment [
	^ structureClass structureAlignment
]

{ #category : #accessing }
LowcodeInternalStructureType >> dependencyClass [
	^ structureClass
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	aMethodBuilder
		pushDup;
		send: #class;
		pushLiteralVariable: structureClass binding;
		send: #==;
				jumpAheadTo: #validArgument if: true;
		pushReceiver;
		pushLiteral: 'Argument ' , argumentName printString , ' has to be an instance of ' , structureClass name , '.';
		send: #error:;
		pushReceiver;
		returnTop;
		jumpAheadTarget: #validArgument.
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitConversionToObject: methodBuilder boxedStructureFieldType: boxedStructureFieldType [
	| temp pointerType |
	temp := methodBuilder generateTempOfType: LowcodeType object.
	methodBuilder
		storeTemp: temp;
		popTop;
		pushLiteral: structureClass;
		send: #basicNew;
		pushDup;
		lowcodeFirstFieldPointer;
		pushTemp: temp;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: boxedStructureFieldType offset;
		lowcodeMemcpyFixed: self size.
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitFieldPointerFromObject: aMethodBuilder offset: anOffset [
	aMethodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: anOffset
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitLocalReference: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalAddress: localName
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitLocalStoreAndPop: methodBuilder valueType: valueType name: localName [
	| srcLocal |
	srcLocal := methodBuilder generateTempOfType: valueType.
	valueType emitLocalStoreAndPop: methodBuilder name: srcLocal.
	
	methodBuilder lowcodeLoadLocalAddress: localName.
	valueType emitLocalValue: methodBuilder name: srcLocal.
	valueType isObjectReference ifTrue: [ 
		methodBuilder lowcodeFirstFieldPointer.
	] ifFalse: [
		self assert: valueType isReferenceType.
	].

	methodBuilder lowcodeMemcpyFixed: self size.
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitLowcodeMemoryValueAsObject: methodBuilder [
	| temp pointerType |
	pointerType := self pointer.
	temp := methodBuilder generateTempOfType: pointerType.
	methodBuilder
		lowcodeStoreLocalPointer: temp;
		pushLiteral: structureClass;
		send: #basicNew;
		pushDup;
		lowcodeFirstFieldPointer;
		lowcodeLoadLocalPointer: temp;
		lowcodeMemcpyFixed: self size.
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType [
	| temp |
	temp := aMethodBuilder generateTempOfType: valueType.
	valueType emitLocalStore: aMethodBuilder valueType: valueType name: temp.
	
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset.
		
	valueType emitLocalValue: aMethodBuilder name: temp.
	valueType isObjectReference ifTrue: [ 
		aMethodBuilder lowcodeFirstFieldPointer.
	] ifFalse: [
		self assert: valueType isReferenceType.
		valueType emitReferenceToPointer: aMethodBuilder
	].

	aMethodBuilder lowcodeMemcpyFixed: self size.
]

{ #category : #emitting }
LowcodeInternalStructureType >> emitMemoryStoreAndPopPointerFirst: aMethodBuilder valueType: valueType [
	valueType isObjectReference ifTrue: [
		
		aMethodBuilder
			lowcodeFirstFieldPointer;
			lowcodeMemcpyFixed: self size.
		^ self
	].
	(valueType isPointerType or: [ valueType isReferenceType ]) ifTrue: [ 
		aMethodBuilder lowcodeMemcpyFixed: self size.
		^ self
	].

	self error: 'Unsupported value type.'
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldOffset: fieldName [
	^ (structureClass slotNamed: fieldName) offset
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldReferenceType: fieldName [
	| fieldType |
	fieldType := self fieldType: fieldName.
	^ fieldType ifNotNil: [LowcodeReferenceType referenced: fieldType ]
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldType: fieldName [
	^ structureClass slotNamed: fieldName ifFound: [ :slot | slot lowcodeType ] ifNone: [ nil ].
]

{ #category : #'read write' }
LowcodeInternalStructureType >> fromStructure: anObject offset: offset [
	^ structureClass newFrom: anObject position: offset + 1
]

{ #category : #accessing }
LowcodeInternalStructureType >> getCompiledMethodForSelector: aSelector [
	^ structureClass lookupSelector: aSelector
]

{ #category : #'type inference' }
LowcodeInternalStructureType >> getReturnTypeForSelector: aSelector [
	| method|
	method := structureClass lookupSelector: aSelector.
	^ method ifNotNil: [ method lowcodeReturnType ] ifNil: [ ^ LowcodeType object ]

]

{ #category : #comparing }
LowcodeInternalStructureType >> hash [
	^ self class hash bitXor: structureClass identityHash
]

{ #category : #testing }
LowcodeInternalStructureType >> isAccessorMessage: aSelector [
	| method |
	method := structureClass lookupSelector: aSelector.
	^ method isNotNil and:[ method hasPragmaNamed: #accessor ]
]

{ #category : #printing }
LowcodeInternalStructureType >> printOn: aStream [
	aStream print: structureClass name
]

{ #category : #accessing }
LowcodeInternalStructureType >> size [
	^ structureClass structureSize
]

{ #category : #accessing }
LowcodeInternalStructureType >> structureClass [
	^ structureClass
]

{ #category : #accessing }
LowcodeInternalStructureType >> structureClass: anObject [
	structureClass := anObject
]

{ #category : #'read write' }
LowcodeInternalStructureType >> write: aValue toStructure: anObject offset: offset [
	aValue storeBytesIn: anObject position: offset + 1
]
