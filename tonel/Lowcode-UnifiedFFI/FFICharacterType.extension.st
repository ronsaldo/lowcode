Extension { #name : #FFICharacterType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallInt32: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodeArgumentTempVar: aBuilder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: aBuilder context: aContext ].
	^ aBuilder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		send: #lowcodeFFICoerceCharacter;
		storeTemp: tempName;
		popTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	aBuilder 
		pushTemp: tempName;
		lowcodeOopSmallIntegerToInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodePointerReturnPostprocess: builder [
	pointerArity = 1 ifTrue: [ builder send: #readString ].
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeSmallInt32ToOop;
		send: #asCharacter;
		returnTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFICharacterType >> lowcodeValueRegisterMarshaller [
	^ LowcodeFFIRegisterMarshallerInt32 new
]
