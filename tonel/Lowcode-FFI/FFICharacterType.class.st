"
This class is used to represent a Character type.

The Lowcode marshalling accepts Character and SmallInteger instances as arguments. In addition, the Lowcode marshalling version performs conversion from C char value into Character instances.
"
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
	| done notCharacter notInteger|
	done := gen makeLabel: 'done'.
	notInteger := gen makeLabel: 'notInteger'.
	notCharacter := gen makeLabel: 'notCharacter'.
	
		"Try with integer"
	gen duplicateStackTop;
		isIntegerObject;
		branchFalse32: notInteger;
		oopSmallIntegerToInt32;
		jump: done;
		
		"Check Character class"
		putLabel: notInteger;
		duplicateStackTop;
		sendSpecialMessageClass;
		pushLiteral: (gen addLiteral: Character);
		oopEqual;
		
		"Extract character value"
		branchFalse32: notCharacter;
		loadObjectField: 0;
		oopSmallIntegerToInt32;
		jump: done;
		
		"Failure"
		putLabel: notCharacter;
		failAndExit;
		putLabel: done
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen prepareReturn: calloutSpec [
	self pointerArity == 0 ifTrue: [ gen pushLiteral: (gen addLiteral: Character characterTable) ]
]

{ #category : #'lowcode marshalling' }
FFICharacterType >> lowcode: gen returnValue: calloutSpec [
	gen loadObjectAt;
		returnTop
]

{ #category : #accessing }
FFICharacterType >> valueSize [
	^ 1
]
