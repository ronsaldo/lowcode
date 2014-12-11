"
This is an abstract class used to perform a mapping between Smalltalk classes and C types.

This class and its subclasses are used by the Lowcode based FFI, by providing methods to perform marshalling between the Smalltalk and the C world using Lowcode.

This class hierarchy is based in a similar mechanism used by NativeBoost for type marshalling, which can be found in NBExternalType. The main difference is in the use of Lowcode and the provision of a visitor pattern to allow more potential backends.
"
Class {
	#name : #FFIExternalType,
	#superclass : #Object,
	#instVars : [
		'pointerArity',
		'loader'
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

{ #category : #testing }
FFIExternalType >> isReceiver [
	^ loader ~~ nil and: [ loader isReceiverArgument ]
]

{ #category : #accessing }
FFIExternalType >> loader [
	^ loader
]

{ #category : #accessing }
FFIExternalType >> loader: aLoader [
	loader := aLoader
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
			jump: done;
			putLabel: cont
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
		failAndExit;
		putLabel: done	

]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen coerceArgumentValue: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertFromOop: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen convertToPointerFromOop: calloutSpec ]
		ifFalse: [ self lowcode: gen convertToValueFromOop: calloutSpec ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertPointerToOop: calloutSpec [
	| failedLabel cont done |
	
	failedLabel := gen makeLabel: 'failed'.
	cont := gen makeLabel: 'cont'.
	done := gen makeLabel: 'done'.
		
	(calloutSpec optReturnNullAsNil or: [calloutSpec optFailOnReturnNull ]) ifTrue: [
		gen duplicatePointer;
			pushNullPointer;
			pointerEqual.
			
		calloutSpec optFailOnReturnNull 
			ifTrue: [ gen branchTrue32: failedLabel. ]
			ifFalse: [ 
				gen branchFalse32: cont;
					pushNil;
					jump: done
			]
	].

	gen putLabel: cont.
	calloutSpec optReturnPtrAsExternalAddress 
		ifTrue: [ 
			(FFIExternalAddress asFFIExternalType: gen) lowcode: gen convertValueToOop: calloutSpec.
			gen jump: done ]
		ifFalse: [
			calloutSpec optReturnPtrAsInt ifFalse: [
				self error: 'Function returns a pointer, but returning raw pointer value is prohibited by options' ].
			FFI pointerSize = 4 ifTrue: [ 
					gen pointerToInt32;
						uint32ToOop;
						jump: done
				]
				ifFalse: [
					gen pointerToInt64;
						uint64ToOop;
						jump: done
				]
		].

	gen putLabel: failedLabel;
		failAndExit;
		putLabel: done
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertToOop: calloutSpec [
	self pointerArity > 0 ifTrue: [ self lowcode: gen convertPointerToOop: calloutSpec ]
		ifFalse: [ self lowcode: gen convertValueToOop: calloutSpec ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertToPointerFromOop: calloutSpec [
	self lowcode: gen coerceArgumentPointer: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertToValueFromOop: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen convertValueToOop: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCall: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen performCallWithPointerResult: calloutSpec ]
		ifFalse: [ self lowcode: gen performCallWithValueResult: calloutSpec ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithPointerResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithValueResult: calloutSpec [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen prepareReturn: calloutSpec [
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen readFromMemory: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen readPointerFromMemory: calloutSpec ]
		ifFalse: [ self lowcode: gen readValueFromMemory: calloutSpec ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen readOopFromMemory: calloutSpec [
	self lowcode: gen readFromMemory: calloutSpec;
		lowcode: gen convertToOop: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen readPointerFromMemory: calloutSpec [
	gen loadPointerFromMemory
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen readValueFromMemory: calloutSpec [
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
		failAndExit
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen returnValue: calloutSpec [
	self lowcode: gen convertValueToOop: calloutSpec.
	gen  returnTop
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen verifyClassOfIs: aClass spec: calloutSpec [
	| classOk |
	classOk := gen makeLabel: 'classOk'.
	gen duplicateStackTop;
		sendSpecialMessageClass;
		pushLiteral: (gen addLiteral: aClass);
		oopEqual;
		branchTrue32: classOk;
		failAndExit;
		putLabel: classOk
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen writeOopToMemory: calloutSpec [
	self lowcode: gen convertFromOop: calloutSpec;
		lowcode: gen writeToMemory: calloutSpec
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen writePointerToMemory: calloutSpec [
	gen storePointerToMemory		
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen writeToMemory: calloutSpec [
	pointerArity > 0 ifTrue: [ self lowcode: gen writePointerToMemory: calloutSpec ]
		ifFalse: [ self lowcode: gen writeValueToMemory: calloutSpec ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen writeValueToMemory: calloutSpec [
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
FFIExternalType >> pointerSize [
	^ FFI pointerSize
]

{ #category : #accessing }
FFIExternalType >> typeSize [
	pointerArity > 0 ifTrue: [  ^ self pointerSize ]
		ifFalse: [ ^ self valueSize]
]

{ #category : #accessing }
FFIExternalType >> valueSize [
	"The number of bytes used by this type."
	self subclassResponsibility
]
