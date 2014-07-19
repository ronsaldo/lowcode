Class {
	#name : #FFICharacterType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'as yet unclassified' }
FFICharacterType >> accept: aVisitor [
	^ aVisitor visitCharacterType: self
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen performCallWithValueResult: functionAddress [
	gen performCallInt32: functionAddress
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcodeCallArgumentValue: gen [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcodeCoerceArgumentValue: gen [
	"Extract the character value"
	gen firstFieldPointer;
		loadPointerFromMemory;
		pointerToInt32;
		pushOne32;
		rightShift32
		
]
