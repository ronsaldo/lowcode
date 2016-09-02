Extension { #name : #FFIExternalReferenceType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcode: builder performCall: functionAddress [
	^ builder
		lowcodePerformCallPointer: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeArgumentTempVar: builder context: aContext [
	^ builder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		pushDup;
		send: #class;
		pushLiteralVariable: self objectClass binding;
		send: #==;
		jumpAheadTo: #ifValidArgument if: true;
		pushReceiver;
		pushLiteral: 'Expected an argument of class ' , self objectClass name;
		send: #error:;
		returnTop;
		jumpAheadTarget: #ifValidArgument;
		
		lowcodeLoadObjectField: (self objectClass instVarIndexFor: self instanceVariableName 
			ifAbsent: [ self error: 'No ', self instanceVariableName, ' instVar' ]) - 1.
		
	self needsArityPacking 
		ifTrue: [ self emitPointerArityRoll: aBuilder context: aContext ].

	aBuilder		
		storeTemp: tempName;
		popTop.

]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeCallArgument: builder [
	^ builder lowcodeCallArgumentPointer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self assert: self isPointer not.
	aBuilder
		pushTemp: tempName.
	self emitLowcodeMarshallPointerValue: aBuilder context: aContext.

]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeReturn: aBuilder [
	 aBuilder
		pushLiteralVariable: self objectClass binding;
		send: #basicNew;
		pushDup.
		
	self emitLowcodeReturnConvertHandle: aBuilder.	
		
	^ aBuilder
			lowcodeStoreObjectField: (self objectClass 
			instVarIndexFor: self instanceVariableName 
			ifAbsent: [ self error: 'No handle instVar' ]) - 1;
		returnTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalReferenceType >> emitLowcodeReturnConvertHandle: aBuilder [
	aBuilder lowcodePointerToOop: ExternalAddress
]
