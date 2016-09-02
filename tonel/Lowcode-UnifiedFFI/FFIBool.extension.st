Extension { #name : #FFIBool }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallInt32: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeArgumentTempVar: builder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: builder context: aContext ].
	^ nil
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		pushDup;
		pushLiteral: true;
		send: #==;
		jumpAheadTo: #validBoolean if: true;

		pushDup;
		pushLiteral: false;
		send: #==;
		jumpAheadTo: #validBoolean if: true;
		
		pushReceiver;
		pushLiteral: 'expected a boolean argument';
		send: #error;
		returnTop;
		
		jumpAheadTarget: #validBoolean;
		jumpAheadTarget: #validBoolean.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self emitArgument: aBuilder context: aContext.
	^ aBuilder
		lowcodeOopToBoolean32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeBoolean32ToOop;
		returnTop
]
