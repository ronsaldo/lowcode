"
I represent a pointer type.
"
Class {
	#name : #LowcodePointerType,
	#superclass : #LowcodeValueType,
	#instVars : [
		'pointed'
	],
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #accessing }
LowcodePointerType class >> pointed: aType [
	^ self new pointed: aType
]

{ #category : #accessing }
LowcodePointerType >> alignment [
	^ FFIExternalType pointerAlignment
]

{ #category : #emitting }
LowcodePointerType >> emitConversionToObject: methodBuilder [
	methodBuilder
		lowcodePointerToOop: ExternalAddress;
		pushLiteral: pointed;
		send: #asNativePointerBoxWithType:
]

{ #category : #emitting }
LowcodePointerType >> emitDuplicate: aMethodBuilder [ 
	aMethodBuilder lowcodeDuplicatePointer
]

{ #category : #emitting }
LowcodePointerType >> emitLocalStore: methodBuilder valueType: valueType name: localName [
	self assert: (valueType = self or: [ valueType isReferenceType and: [ valueType referenced = pointed ] ]).
	
	valueType isReferenceType ifTrue: [ valueType emitReferenceToPointer: methodBuilder ].
	methodBuilder
		lowcodeDuplicatePointer;
		lowcodeStoreLocalPointer: localName
]

{ #category : #emitting }
LowcodePointerType >> emitLocalStoreAndPop: methodBuilder name: localName [
	methodBuilder lowcodeStoreLocalPointer: localName
]

{ #category : #emitting }
LowcodePointerType >> emitLocalValue: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalPointer: localName
]

{ #category : #emitting }
LowcodePointerType >> emitLowcodeStore: methodBuilder selfOffset: offset valueType: valueType [
	self assert: valueType withoutAliases = self.
	methodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeStorePointerToMemory
]

{ #category : #emitting }
LowcodePointerType >> emitLowcodeValue: methodBuilder selfOffset: offset [
	methodBuilder
		pushReceiver;
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: offset;
		lowcodeLoadPointerFromMemory
]

{ #category : #emitting }
LowcodePointerType >> emitMemoryStoreAndPop: methodBuilder [
	methodBuilder lowcodeStorePointerToMemory
]

{ #category : #emitting }
LowcodePointerType >> emitMemoryValue: methodBuilder [
	methodBuilder lowcodeLoadPointerFromMemory
]

{ #category : #emitting }
LowcodePointerType >> emitPop: aMethodBuilder [ 
	aMethodBuilder lowcodePopPointer
]

{ #category : #accessing }
LowcodePointerType >> extraClassDependencies [
	^ pointed extraClassDependencies
]

{ #category : #testing }
LowcodePointerType >> isPointerType [
	^ true
]

{ #category : #accessing }
LowcodePointerType >> pointed [
	^ pointed
]

{ #category : #accessing }
LowcodePointerType >> pointed: anObject [
	pointed := anObject
]

{ #category : #printing }
LowcodePointerType >> printOn: aStream [
	aStream nextPutAll: '#('; print: pointed; nextPutAll: ' pointer)'
]

{ #category : #accessing }
LowcodePointerType >> size [
	^ FFIExternalType pointerSize
]
