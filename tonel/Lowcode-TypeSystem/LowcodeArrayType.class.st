Class {
	#name : #LowcodeArrayType,
	#superclass : #LowcodeType,
	#instVars : [
		'element',
		'numberOfElements'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeArrayType class >> element: element numberOfElements: numberOfElements [
	^ self new element: element; numberOfElements: numberOfElements; yourself
]

{ #category : #comparing }
LowcodeArrayType >> = other [
	^ self class == other class and: [ element = other element and: [ numberOfElements = other numberOfElements ] ]
]

{ #category : #accessing }
LowcodeArrayType >> alignment [
	^ element alignment
]

{ #category : #testing }
LowcodeArrayType >> canBePushedInTheStack [
	^ false
]

{ #category : #accessing }
LowcodeArrayType >> element [
	^ element
]

{ #category : #accessing }
LowcodeArrayType >> element: anObject [
	element := anObject
]

{ #category : #'as yet unclassified' }
LowcodeArrayType >> emitArgumentTypeCheck: methodBuilder name: argumentName [
	methodBuilder
		pushDup;
		pushLiteral: element;
		pushLiteral: numberOfElements;
		send: #lowcodeCheckArrayArgument:elements:;
		popTop

]

{ #category : #'as yet unclassified' }
LowcodeArrayType >> emitLowcodeMemoryValueAsObject: methodBuilder [
	| temp pointerType |
	pointerType := self pointer.
	temp := methodBuilder generateTempOfType: pointerType.
	methodBuilder
		lowcodeStoreLocalPointer: temp;
		pushLiteral: NativeArray;
		pushLiteral: element;
		pushLiteral: numberOfElements;
		send: #for:new:;
		pushDup;
		lowcodeLoadObjectField: 2;
		lowcodeFirstFieldPointer;
		lowcodeLoadLocalPointer: temp;
		lowcodeMemcpyFixed: self size.
]

{ #category : #'as yet unclassified' }
LowcodeArrayType >> emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType [
	| temp |
	temp := aMethodBuilder generateTempOfType: valueType.
	valueType emitLocalStore: aMethodBuilder valueType: valueType name: temp.
	
	aMethodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset.
		
	valueType emitLocalValue: aMethodBuilder name: temp.
	valueType isObjectReference ifTrue: [ 
		aMethodBuilder
			lowcodeLoadObjectField: 2;
			lowcodeFirstFieldPointer.
	] ifFalse: [
		self assert: valueType isReferenceType.
	].

	aMethodBuilder lowcodeMemcpyFixed: self size.

]

{ #category : #accessing }
LowcodeArrayType >> extraClassDependencies [
	"This should return a list of classes with dependencies."
	^ element extraClassDependencies
]

{ #category : #'read write' }
LowcodeArrayType >> fromStructure: anObject offset: offset [
	| result resultData |
	result := NativeArray for: element new: numberOfElements.
	resultData := result rawData.
	1 to: resultData size do: [ :i | resultData byteAt: i put: (anObject byteAt: offset + i) ].
	^ result
]

{ #category : #'as yet unclassified' }
LowcodeArrayType >> hasDirectStoreFrom: valueType [
	valueType = self ifTrue: [ ^ true ].
	(valueType isReferenceType and: [ valueType referenced = self ]) ifTrue: [ ^ true ].
	(valueType isObjectReference and: [ valueType referenced = self]) ifTrue: [ ^ true ].
	^ false
]

{ #category : #comparing }
LowcodeArrayType >> hash [
	^ (self class hash bitXor: element hash) bitXor: numberOfElements hash
]

{ #category : #accessing }
LowcodeArrayType >> numberOfElements [
	^ numberOfElements
]

{ #category : #accessing }
LowcodeArrayType >> numberOfElements: anObject [
	numberOfElements := anObject
]

{ #category : #'type decorators' }
LowcodeArrayType >> object [
	^ LowcodeObjectReferenceType referenced: self.
]

{ #category : #printing }
LowcodeArrayType >> printOn: aStream [
	numberOfElements = 0 ifTrue: [ ^ aStream print: element; nextPutAll: ' array'].
	aStream nextPutAll: '#('; print: element; nextPutAll: ' array: '; print: numberOfElements; nextPut: $)
]

{ #category : #accessing }
LowcodeArrayType >> size [
	^ element size * numberOfElements
]

{ #category : #'read write' }
LowcodeArrayType >> write: aValue toStructure: anObject offset: offset [
	| data dataSize |
	self assert: aValue size = numberOfElements.
	data := aValue rawData.
	dataSize := self size.
	
	1 to: dataSize do: [ :i | anObject byteAt: offset + i put: (data byteAt:i)].
]
