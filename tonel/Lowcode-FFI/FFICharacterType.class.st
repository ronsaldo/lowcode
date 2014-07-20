Class {
	#name : #FFICharacterType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFICharacterType >> accept: aVisitor [
	^ aVisitor visitCharacterType: self
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Extract the character value"
	gen firstFieldPointer;
		loadPointerFromMemory;
		pointerToInt32;
		pushOne32;
		rightShift32
		
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]
