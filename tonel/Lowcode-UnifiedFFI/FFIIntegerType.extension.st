Extension { #name : #FFIIntegerType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallInt32: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcodeArgumentTempVar: aBuilder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: aBuilder context: aContext ].
	^ nil
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		lowcodeIsIntegerObject;
		lowcodeBoolean32ToOop;
		jumpAheadTo: #validInteger if: true;
		pushReceiver;
		pushLiteral: 'expected an integer argument';
		send: #error:;
		returnTop;
		jumpAheadTarget: #validInteger.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeSmallInt32ToOop;
		returnTop
]
