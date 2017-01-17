Extension { #name : #FFIExternalString }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallPointer: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeArgumentTempVar: builder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: builder context: aContext ].
	^ { 
		"ByteString" builder generateOopTemp .
		"Sizeof" builder generateNativeTemp: 4 .
		"C String pointer" builder generateNativeTemp: self pointerSize
	}
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		pushDup;
		"Check is string"
		send: #isString;
		jumpAheadTo: #isString if: true;
		pushReceiver;
		pushLiteral: 'expected a string argument.';
		send: #error:;
		returnTop;
		jumpAheadTarget: #isString;

		"Convert to byte string."
		send: #asByteString;
		storeTemp: tempName first;
		popTop.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeCallArgument: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: builder ].
	^ builder lowcodeCallArgumentPointer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeCleanAndReturnArgument: builder temp: tempVar context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeCleanAndReturnArgument: builder temp: tempVar context: aContext
 ].

	builder
		lowcodeLoadLocalPointer: tempVar third;
		lowcodeFree
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	| byteString sizeof cstring |
	self assert: self isPointer not.
	byteString := tempName first.
	sizeof := tempName second.
	cstring := tempName third.
	aBuilder
		"Get the size of"
		pushTemp: byteString;
		lowcodeByteSizeOf;
		lowcodeDuplicateInt32;
		lowcodeStoreLocalInt32: sizeof;
		
		"Malloc with one extra null character"
		lowcodePushOne32;
		lowcodeAdd32;
		lowcodeMalloc32;
		
		"Store the malloced pointer"
		lowcodeDuplicatePointer;
		lowcodeStoreLocalPointer: cstring;	
	
		"Copy the string data"
		pushTemp: byteString;
		lowcodeFirstFieldPointer;
		lowcodeLoadLocalInt32: sizeof;
		lowcodeMemcpy32;
		
		"Add the null character"
		lowcodePushZero32;
		lowcodeLoadLocalPointer: cstring;
		lowcodeLoadLocalInt32: sizeof;
		lowcodePointerAddOffset32;
		lowcodeStoreInt8ToMemory;
		
		"Use the string pointer"
		lowcodeLoadLocalPointer: cstring
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> emitLowcodeReturn: builder [
	| temp |
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	temp := builder generateOopTemp.
	^ builder
		lowcodePointerToOop: ExternalAddress;
		storeTemp: temp;
		popTop;
		pushLiteral: ExternalData;
		pushTemp: temp;
		pushLiteral: ExternalType char asPointerType;
		send: #fromHandle:type:;
		send: #fromCString;
		returnTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> lowcodeValueParameterClass [
	^ #integer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalString >> lowcodeValueRegisterMarshaller [
	^ LowcodeFFIRegisterMarshallerPointer new
]
