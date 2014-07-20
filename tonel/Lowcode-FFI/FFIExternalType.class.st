Class {
	#name : #FFIExternalType,
	#superclass : #Object,
	#instVars : [
		'pointerArity'
	],
	#category : #'Lowcode-FFI-Types'
}

{ #category : #converting }
FFIExternalType class >> asFFIExternalType: gen [
	^ self new
]

{ #category : #visitor }
FFIExternalType >> accept: visitor [
	self subclassResponsibility 
]

{ #category : #testing }
FFIExternalType >> initialize [
	pointerArity := 0
]

{ #category : #testing }
FFIExternalType >> isPlatformDependent [
	"This method tells if this type is platform dependent."
	^ pointerArity = 0
]

{ #category : #testing }
FFIExternalType >> isPrimitiveType [
	"This method tells if this type represents a primitive type."
	^ false
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen callArgument: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen callArgumentPointer: calloutSpec]
		ifFalse: [ self lowcode: gen callArgumentValue: calloutSpec]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen callArgumentPointer: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen callArgumentValue: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen coerceArgument: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen coerceArgumentPointer: calloutSpec]
		ifFalse: [ self lowcode:gen coerceArgumentValue: calloutSpec]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen coerceArgumentPointer: calloutSpec [
	"By default, push argument as a bytearray ptr"
	
	"It may accept:
		- nil
		- variable bytes oop
		- external address "
	| done failed |

	failed := gen makeLabel: 'failed'.
	done := gen makeLabel: 'done'.

	"handle nils, if we care"
	calloutSpec optCoerceNilToNull ifTrue: [ | cont |
		cont := gen makeLabel: 'cont'.
		
		gen duplicateStackTop;
			pushNil;
			oopNotEqual;
			branchTrue32: cont;
			popStackTop;
			pushNullPointer;
			jump: done;
			putLabel: cont
	].

	"handle ExternalAddress, if we care"
	calloutSpec optAllowExternalAddressPtr ifTrue: [ | cont |
		cont := gen makeLabel: 'cont'.
		gen duplicateStackTop;
			sendSpecialMessageClass;
			pushLiteral: (gen addLiteral: FFIExternalAddress);
			oopNotEqual;
			branchTrue32: cont;
			oopToPointer;
			jump: done
	].

	"The last case is a byte/word array, 
	simply push a pointer to first indexable field of oop"
	calloutSpec optAllowByteArraysPtr ifTrue: [
		gen duplicateStackTop;
			isWordsOrBytes;
			branchFalse32: failed;
			firstIndexableFieldPointer;
			jump: done
	].

	gen putLabel: failed;
		fail;
		putLabel: done	

]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen coerceArgumentValue: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCall: functionAddress [
	pointerArity > 0 ifTrue: [ self lowcode: gen performCallWithPointerResult: functionAddress  ]
		ifFalse: [ self lowcode: gen performCallWithValueResult: functionAddress  ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithPointerResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithValueResult: functionAddress [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen return: calloutSpec [
	self pointerArity  > 0 ifTrue: [ self lowcode: gen returnPointer: calloutSpec]
		ifFalse: [ self lowcode: gen returnValue: calloutSpec]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen returnPointer: calloutSpec [
	| failedLabel cont |
	
	failedLabel := gen makeLabel: 'failed'.
	cont := gen makeLabel: 'cont'.
		
	(calloutSpec optReturnNullAsNil or: [calloutSpec optFailOnReturnNull ]) ifTrue: [
		gen duplicatePointer;
			pushNullPointer;
			pointerEqual.
			
		calloutSpec optFailOnReturnNull 
			ifTrue: [ gen branchTrue32: failedLabel. ]
			ifFalse: [ gen branchFalse32: cont;
						returnNil]
	].

	gen putLabel: cont.
	calloutSpec optReturnPtrAsExternalAddress 
		ifTrue: [ 
			(FFIExternalAddress asFFIExternalType: gen) lowcode: gen returnValue: calloutSpec ]
		ifFalse: [
			calloutSpec optReturnPtrAsInt ifFalse: [
				self error: 'Function returns a pointer, but returning raw pointer value is prohibited by options' ].
			FFI pointerSize = 4 ifTrue: [ 
					gen pointerToInt32;
						returnUInt32AsOop
				]
				ifFalse: [
					gen pointerToInt64;
						returnUInt64AsOop
				]
		].

	gen putLabel: failedLabel;
		fail
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen returnValue: calloutSpec [
	self subclassResponsibility
]

{ #category : #accessing }
FFIExternalType >> pointerArity [
	^ pointerArity
]

{ #category : #accessing }
FFIExternalType >> pointerArity: moreArity [
	pointerArity := pointerArity + moreArity
]

{ #category : #accessing }
FFIExternalType >> valueSize [
	"The number of bytes used by this type."
	self subclassResponsibility
]
