Extension { #name : #FFIExternalType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcode: builder performCall: functionAddress [
	self assert: self isPointer.
	^ builder
		lowcodePerformCallPointer: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeArgumentTempVar: builder context: aContext [
	self assert: self isPointer.
	^ builder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self assert: self isPointer.
	self loader emitArgument: aBuilder context: aContext.
	self needsArityPacking 
		ifTrue: [ self  emitPointerArityRoll: aBuilder context: aContext ].
	aBuilder
		pushLiteral: self externalTypeWithArity;
		send: #lowcodeFFICheckPointerOfType:;
		storeTemp: tempName;
		popTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeCallArgument: builder [
	self assert: self isPointer.
	^ builder lowcodeCallArgumentPointer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeCleanAndReturnArgument: builder temp: tempVar context: aContext [
	self flag: 'Does this need some additional changes?.'.
	self emitReturnArgument: builder context: aContext.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeMarshallArgument: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [
		aBuilder
			pushTemp: tempName.
		self emitLowcodeMarshallPointerValue: aBuilder context: aContext
	] ifFalse: [ 
		self emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext 
	]
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeMarshallPointerValue: aBuilder context: aContext [
	aBuilder
		"Test for nil"
		pushDup;
		pushLiteral: nil;
		send: #==;
		jumpAheadTo: #ifNil if: true;
			
		"Test for external address"
		pushDup;
		send: #class;
		pushLiteralVariable: ExternalAddress binding;
		send: #==;
		jumpAheadTo: #ifExternalAddress if: true; 
			
		"Test for bytes or words"
		pushDup;
		lowcodeIsWordsOrBytes;
		lowcodeBoolean32ToOop;
		jumpAheadTo: #ifWordsOrBytes if: true;

		"Failed to convert"
		pushReceiver;
		pushLiteral: 'Failed to marshall pointer.';
		send: #error:;
		returnTop;
			
		"Convert externalAddress"
		jumpAheadTarget: #ifExternalAddress;
		lowcodeOopToPointer;
		jumpAheadTo: #convertedPointer;

		"Convert nil"
		jumpAheadTarget: #ifNil;
		popTop;
		lowcodePushNullPointer;
		jumpAheadTo: #convertedPointer;

		"Convert words or bytes"
		jumpAheadTarget: #ifWordsOrBytes;
		lowcodeFirstIndexableFieldPointer;
		jumpAheadTo: #convertedPointer;

		"Converted pointer"
		jumpAheadTarget: #convertedPointer;
		jumpAheadTarget: #convertedPointer;
		jumpAheadTarget: #convertedPointer.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self subclassResponsibility
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeReturn: builder [
	| temp |
	self assert: self isPointer.
	temp := builder generateOopTemp.
	^ builder
		lowcodePointerToOop: ExternalAddress;
		storeTemp: temp;
		popTop;
		pushLiteral: ExternalData;
		pushTemp: temp;
		pushLiteral: self externalTypeWithArity;
		send: #fromHandle:type:;
		returnTop
]
