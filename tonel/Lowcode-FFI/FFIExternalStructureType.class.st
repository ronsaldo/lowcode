Class {
	#name : #FFIExternalStructureType,
	#superclass : #FFIExternalType,
	#instVars : [
		'objectClass',
		'returnOop'
	],
	#category : #'Lowcode-FFI-Types'
}

{ #category : #accessing }
FFIExternalStructureType class >> objectClass: aClass [
	^ self new objectClass: aClass
]

{ #category : #visitor }
FFIExternalStructureType >> accept: aVisitor [
	^ aVisitor visitExternalStructureType: self
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> dataInstVarIndex [
	^ (objectClass instVarIndexFor: #data ifAbsent: [self error: 'this should not happen...'] ) - 1
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentStructure: self valueSize
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen coerceArgumentPointer: calloutSpec [
	self pointerArity > 1 ifTrue: [ ^ super lowcode: gen coerceArgumentPointer: calloutSpec ].

	"Class verification can be skipped, if loader loads receiver"
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	self lowcode: gen fetchDataPointer: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Class verification can be skipped, if loader loads receiver"
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	self lowcode: gen fetchDataPointer: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen convertFromOop: calloutSpec [
	"Class verification can be skipped, if loader loads receiver"
	self isReceiver ifFalse: [ 
		self lowcode: gen verifyClassOfIs: objectClass spec: calloutSpec.
	].

	self lowcode: gen fetchDataPointer: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen convertValueToOop: calloutSpec [
	| resultTemp dataTemp pointerTemp|
	
	"Instantiate the external structure"
	pointerTemp := gen allocateLocalPointer.
	resultTemp := gen allocateTemp.
	dataTemp := gen allocateTemp.
	gen storeLocalPointer: pointerTemp;
		pushLiteral: (gen addLiteral: objectClass);
		instantiateOop;
		duplicateStackTop;
		popAndStoreTemp: resultTemp;
		
		"Instantiate the data"
		pushLiteral: (gen addLiteral: ByteArray);
		instantiateIndexableOop: self valueSize;
		duplicateStackTop;
		popAndStoreTemp: dataTemp;
		storeObjectField: self dataInstVarIndex;
		
		"Copy the data"
		pushTemp: dataTemp;
		firstIndexableFieldPointer;
		loadLocalPointer: pointerTemp;
		memcpyFixed: self valueSize;
		
		"Return"
		pushTemp: resultTemp
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen fetchDataPointer: calloutSpec [
	| failClassCheck fail done notExternalAddress|
	failClassCheck := gen makeLabel: 'failClassCheck'.
	fail := gen makeLabel: 'fail'.
	notExternalAddress := gen makeLabel: 'notExternalAddress'.
	done := gen makeLabel: 'done'.
	
	"Load the data field."
	gen duplicateStackTop;
		sendSpecialMessageClass;
		pushLiteral: (gen addLiteral: objectClass);
		oopEqual;
		branchFalse32: fail;
		loadObjectField: self dataInstVarIndex;
		
		"Data could be FFIExternalAddress"
		duplicateStackTop;
		sendSpecialMessageClass;
		pushLiteral: (gen addLiteral: FFIExternalAddress);
		oopEqual;
		branchFalse32: notExternalAddress;
		oopToPointer;
		jump: done;
		
		"Data could be a Bytes Array"
		putLabel: notExternalAddress;
		duplicateStackTop;
		isWordsOrBytes;
		branchFalse32: fail;
		firstIndexableFieldPointer;
		jump: done;

		putLabel: failClassCheck;
		fail;
		returnNil;		
		putLabel: fail;
		fail;
		returnNil;
		putLabel: done
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen performCallWithValueResult: calloutSpec [
	self returnViaRegisters ifTrue: [ 
		self valueSize <= 4 ifTrue: [ gen performCallInt32: calloutSpec functionAddress ]
			ifFalse: [ gen performCallInt64: calloutSpec functionAddress ]
	] ifFalse: [ 
		gen performCallStructure: calloutSpec functionAddress structureSize: self valueSize
	]
	
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen prepareReturn: calloutSpec [
	| pointerLocal  |
	
	self pointerArity  <= 1 ifTrue: [ 
		returnOop := gen allocateTemp.
		pointerLocal := gen allocateLocalPointer.
	
			"Instantiate the external structure"
		gen pushLiteral: (gen addLiteral: objectClass);
			instantiateOop;
			duplicateStackTop;
			popAndStoreTemp: returnOop.
		
			"Instantiate the data"
		self pointerArity = 0 ifTrue: [
			gen pushLiteral: (gen addLiteral: ByteArray);
				instantiateIndexableOop: self valueSize.
		] ifFalse: [ 
			gen pushLiteral: (gen addLiteral: FFIExternalAddress);
				instantiateIndexableOop: FFI pointerSize.
		].
			
		gen duplicateStackTop;
			firstIndexableFieldPointer;
			storeLocalPointer: pointerLocal;
			storeObjectField: self dataInstVarIndex;
			loadLocalPointer: pointerLocal.
	].

]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen readValueFromMemory: calloutSpec [
	"Do nothing"
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen returnPointer: calloutSpec [
	self pointerArity > 1 ifTrue: [ ^ super lowcode: gen returnPointer: calloutSpec].

	gen storePointerToMemory;
		pushTemp: returnOop;
		returnTop
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen returnValue: calloutSpec [
	self returnViaRegisters ifTrue: [
		self valueSize = 1 ifTrue: [ gen storeInt8ToMemory ]
			ifFalse: [ self valueSize = 2 ifTrue: [ gen storeInt16ToMemory ]
			ifFalse: [ self valueSize = 4 ifTrue: [ gen storeInt32ToMemory ]
			ifFalse: [ self valueSize = 8 ifTrue: [ gen storeInt64ToMemory ]
			ifFalse: [ self error: 'This should not happen' ] ] ] ]
	].

	gen pushTemp: returnOop;
		returnTop
]

{ #category : #'lowcode marshalling' }
FFIExternalStructureType >> lowcode: gen writeValueToMemory: calloutSpec [
	gen memcpyFixed: self valueSize
]

{ #category : #accessing }
FFIExternalStructureType >> objectClass [
	^ objectClass
]

{ #category : #accessing }
FFIExternalStructureType >> objectClass: aClass [
	objectClass := aClass
]

{ #category : #testing }
FFIExternalStructureType >> returnViaRegisters [
"
answer true if return-by-value for given struct are returned in registers.
1byte, 2 bytes, and 4 bytes structures are returned in EAX.
8 byte structures are returned in EDX:EAX
otherwise it is assumed that caller passing a hidden argument (a pointer to struct)
which callee using for filling the data
"
"Both Mac OS X x86 and Win32 x86 return structs of a power of two in size
less than or equal to eight bytes in length in registers. Linux never does so. "
	^NativeBoost platformId = NativeBoostConstants linux32PlatformId
		ifTrue:[false]
		ifFalse:[ #(1 2 4 8) includes: self valueSize]
]

{ #category : #accessing }
FFIExternalStructureType >> valueSize [ 
	^ objectClass instanceSize 
]
