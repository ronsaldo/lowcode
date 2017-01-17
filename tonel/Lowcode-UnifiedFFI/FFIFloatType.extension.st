Extension { #name : #FFIFloatType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> emitLowcodeArgumentTempVar: builder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: builder context: aContext ].
	^ nil
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		lowcodeIsFloatObject;
		lowcodeBoolean32ToOop;
		jumpAheadTo: #validFloat if: true;
		pushReceiver;
		pushLiteral: 'expected a float argument';
		send: #error:;
		returnTop;
		jumpAheadTarget: #validFloat.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> lowcodeValueParameterClass [
	^ #float
]
