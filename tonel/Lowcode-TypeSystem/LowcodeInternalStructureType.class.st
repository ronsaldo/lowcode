Class {
	#name : #LowcodeInternalStructureType,
	#superclass : #LowcodeStructureType,
	#instVars : [
		'structureClass'
	],
	#category : #'Lowcode-TypeSystem'
}

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

{ #category : #accessing }
LowcodeInternalStructureType >> fieldOffset: fieldName [
	^ (structureClass slotNamed: fieldName) offset
]

{ #category : #accessing }
LowcodeInternalStructureType >> fieldType: fieldName [
	^ structureClass slotNamed: fieldName ifFound: [ :slot | slot lowcodeType ] ifNone: [ nil ].
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
LowcodeInternalStructureType >> structureClass [
	^ structureClass
]

{ #category : #accessing }
LowcodeInternalStructureType >> structureClass: anObject [
	structureClass := anObject
]
