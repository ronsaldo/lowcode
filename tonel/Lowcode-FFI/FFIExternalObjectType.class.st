"
The FFIExternalObjectType is used to perform marshalling for instances of FFIExternalObject subclasses.
"
Class {
	#name : #FFIExternalObjectType,
	#superclass : #FFIExternalType,
	#instVars : [
		'objectClass',
		'returnOop'
	],
	#category : #'Lowcode-FFI-Types'
}

{ #category : #accessing }
FFIExternalObjectType class >> objectClass: aClass [
	^ self new objectClass: aClass
]

{ #category : #visitor }
FFIExternalObjectType >> accept: aVisitor [
	^ aVisitor visitExternalObjectType: self
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> handleInstVarIndex [
	^ (objectClass instVarIndexFor: #handle ifAbsent: [self error: 'this should not happen...'] ) - 1
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen coerceArgumentPointer: calloutSpec [
	"Class verification can be skipped, if loader loads receiver"
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	gen loadObjectField: (self handleInstVarIndex);
		firstIndexableFieldPointer
		
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Class verification can be skipped, if loader loads receiver"
	(loader isReceiver and: [  calloutSpec requestor  includesBehavior: objectClass ]) ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	gen loadObjectField: (self handleInstVarIndex);
		firstIndexableFieldPointer;
		loadPointerFromMemory
		
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen prepareReturn: calloutSpec [
	| pointerLocal  |
	
	self pointerArity == 0 ifTrue: [ 
		returnOop := gen allocateTemp.
		pointerLocal := gen allocateLocalPointer.
	
			"Instantiate the external structure"
		gen pushLiteral: (gen addLiteral: objectClass);
			instantiateOop;
			duplicateStackTop;
			popAndStoreTemp: returnOop;

			"Instantiate the handle pointer"		
			pushLiteral: (gen addLiteral: FFIExternalAddress);
				instantiateIndexableOop: FFI pointerSize;
			
			"Store the handle pointer"
			duplicateStackTop;
			firstIndexableFieldPointer;
			storeLocalPointer: pointerLocal;
			storeObjectField: self handleInstVarIndex;
			loadLocalPointer: pointerLocal.
	].

]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen returnPointer: calloutSpec [
	self error: 'returning pointer to handle ?'
]

{ #category : #'lowcode marshalling' }
FFIExternalObjectType >> lowcode: gen returnValue: calloutSpec [
	gen storePointerToMemory;
		pushTemp: returnOop;
		returnTop
]

{ #category : #accessing }
FFIExternalObjectType >> objectClass [
	^ objectClass
]

{ #category : #accessing }
FFIExternalObjectType >> objectClass: aClass [
	objectClass := aClass
]

{ #category : #accessing }
FFIExternalObjectType >> valueSize [
	^ self pointerSize
]
