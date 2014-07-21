Class {
	#name : #FFIExternalStringType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIExternalStringType >> accept: aVisitor [
	^ aVisitor visitExternalStringType: self
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentPointer
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcode: gen coerceArgumentPointer: calloutSpec [
	self error: 'Strings are already passed as pointer'
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcode: gen coerceArgumentValue: calloutSpec [
	| notNil failedConversion doneConversion sizeTemp sourcePointerTemp stringPointerTemp |
	notNil := gen makeLabel: 'notNil'.
	failedConversion := gen makeLabel: 'failedConversion'.
	doneConversion := gen makeLabel: 'doneConversion'.
	
	sizeTemp := gen allocateLocalInt32.
	sourcePointerTemp := gen allocateLocalPointer.
	stringPointerTemp := gen allocateLocalPointer.
	
	calloutSpec optStringOrNull ifTrue: [
		"Allow passing nil as string, effectively will push null pointer as argument"
		gen duplicateStackTop;
			pushNil;
			oopEqual;
			branchFalse32: notNil;
			popStackTop;
			pushNullPointer;
			jump: doneConversion.
	].
	
		"Check for ByteString"
	gen putLabel: notNil;
		duplicateStackTop;
		isBytes;
		branchFalse32: failedConversion;

		"Get the source pointer"
		duplicateStackTop;
		firstIndexableFieldPointer;
		storeLocalPointer: sourcePointerTemp;
		
		"Get the string size"
		byteSizeOf;
	
		"Store the string size."
		duplicateInt32;
		storeLocalInt32: sizeTemp;
		
		"Allocate the C-string"
		pushOne32;
		add32;
		alloca32;
		duplicatePointer;
		storeLocalPointer: stringPointerTemp;
		
		"Copy the string"
		loadLocalPointer: sourcePointerTemp;
		loadLocalInt32: sizeTemp;
		memcpy32;
		
		"Put the trailing \0"
		loadLocalPointer: stringPointerTemp;
		loadLocalInt32: sizeTemp;
		pointerOffset32;
		pushZero32;
		storeInt8ToMemory;
		
		"Return the pointer"
		loadLocalPointer: stringPointerTemp;
		jump: doneConversion;
		
		putLabel: failedConversion;
		fail;
		putLabel: doneConversion
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallPointer: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcode: gen returnValue: calloutSpec [
	| notNil pointerTemp sizeTemp resultTemp |
	notNil := gen makeLabel: 'notNil'.
	pointerTemp := gen allocateLocalPointer.
	sizeTemp := gen allocateLocalPointer.
	resultTemp := gen allocateTemp.
	
	
		"Check null"
	gen duplicatePointer;
		pushNullPointer;
		pointerEqual;
		branchFalse32: notNil;
		returnNil;
		
		"Store the string pointer and its len."	
		putLabel: notNil;
		duplicatePointer;
		storeLocalPointer: pointerTemp.
	self lowcodeStrLen: gen.
	gen storeLocalInt32: sizeTemp;
		
		"Instantiate the ByteString"
		pushLiteral: (gen addLiteral: ByteString);
		loadLocalInt32: sizeTemp;
		instantiateIndexable32Oop;
		duplicateStackTop;
		popAndStoreTemp: resultTemp;
		
		"Copy the content to the ByteString"
		firstIndexableFieldPointer;
		loadLocalPointer: pointerTemp;
		loadLocalInt32: sizeTemp;
		memcpy32;
		
		"Return"
		pushTemp: resultTemp;
		returnTop
]

{ #category : #'lowcode marshalling' }
FFIExternalStringType >> lowcodeStrLen: gen [
	"Input: Stack top pointer to char*
	 Output: Int32 with the C string length."
	
	| loop end count |
	count := gen allocateLocalInt32.
	loop := gen makeLabel: 'loop'.
	end := gen makeLabel: 'end'.
		
	gen "Initialize the count"
		pushZero32;
		storeLocalInt32: count;
		putLabel: loop;
		
		"Check if the pointed element is the null character"
		duplicatePointer;
		loadUInt8FromMemory;
		pushZero32;
		int32Equal;
		branchTrue32: end;
		
		"Increase the count"
		loadLocalUInt32: count;
		pushOne32;
		add32;
		storeLocalInt32: count;
		
		"Increase the pointer"
		pushOne32;
		pointerOffset32;
		jump: loop;	
		
		"Return the count"	
		putLabel: end;
		popPointer;
		loadLocalInt32: count
		
]
