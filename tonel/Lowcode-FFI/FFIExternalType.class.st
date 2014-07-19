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
FFIExternalType >> lowcode: gen performCall: functionAddress [
	pointerArity > 0 ifTrue: [ self lowcode: gen performCallWithPointerResult: functionAddress  ]
		ifFalse: [ self lowcode: gen performCallWithValueResult: functionAddress  ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithPointerResult: functionAddress [
	gen performCallPointer: functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcode: gen performCallWithValueResult: functionAddress [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCallArgument: gen [
	pointerArity > 0 ifTrue: [ self lowcodeCallArgumentPointer: gen ]
		ifFalse: [ self lowcodeCallArgumentValue: gen ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCallArgumentPointer: gen [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCallArgumentValue: gen [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCoerceArgument: gen [
	pointerArity > 0 ifTrue: [ self lowcodeCoerceArgumentPointer: gen ]
		ifFalse: [ self lowcodeCoerceArgumentValue: gen ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCoerceArgumentPointer: gen [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeCoerceArgumentValue: gen [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeReturn: gen [
	self pointerArity  > 0 ifTrue: [ self lowcodeReturnPointer: gen ]
		ifFalse: [ self lowcodeReturnValue: gen ]
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeReturnPointer: gen [
	self subclassResponsibility
]

{ #category : #'lowcode marshalling' }
FFIExternalType >> lowcodeReturnValue: gen [
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
