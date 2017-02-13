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
	^ builder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		send: #lowcodeFFICoerceBoolean;
		storeTemp: tempName;
		popTop
		
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
		pushTemp: tempName;
		lowcodeOopToBoolean32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeBoolean32ToOop;
		returnTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> lowcodeValueParameterClass [
	^ #integer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIBool >> lowcodeValueRegisterMarshaller [
	^ LowcodeFFIRegisterMarshallerInt32 new
]
