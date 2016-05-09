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
