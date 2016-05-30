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
	^ structureClass layout structureAlignment
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
LowcodeInternalStructureType >> emitFieldPointerFromObject: aMethodBuilder offset: anOffset [
	aMethodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: anOffset
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
	].

	aMethodBuilder lowcodeMemcpyFixed: self size.
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldOffset: fieldName [
	^ (structureClass slotNamed: fieldName) offset
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldType: fieldName [
	^ structureClass slotNamed: fieldName ifFound: [ :slot | slot lowcodeType ] ifNone: [ nil ].
]

{ #category : #'read write' }
LowcodeInternalStructureType >> fromStructure: anObject offset: offset [
	^ structureClass newFrom: anObject position: offset + 1
]

{ #category : #comparing }
LowcodeInternalStructureType >> hash [
	^ self class hash bitXor: structureClass hash
]

{ #category : #testing }
LowcodeInternalStructureType >> isAccessorMessage: aSelector [
	| method |
	method := structureClass methodDict at: aSelector ifAbsent: [ ^ false ].
	^ method hasPragmaNamed: #accessor
]

{ #category : #printing }
LowcodeInternalStructureType >> printOn: aStream [
	aStream print: structureClass name
]

{ #category : #accessing }
LowcodeInternalStructureType >> size [
	^ structureClass layout structureSize
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
