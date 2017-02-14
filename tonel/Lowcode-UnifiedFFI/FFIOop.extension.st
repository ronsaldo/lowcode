Extension { #name : #FFIOop }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcode: builder performCall: functionAddress [
	^ builder
		lowcodePerformCallPointer: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcodeArgumentTempVar: builder context: aContext [
	^ nil
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcodeCallArgument: aBuilder [
	aBuilder lowcodeCallArgumentPointer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self emitArgument: aBuilder context: aContext.
	^ self emitLowcodeMarshallPointerValue: aBuilder context: aContext
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> emitLowcodeReturn: builder [
	^ builder
		lowcodePointerToOop: ExternalAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIOop >> lowcodeValueRegisterMarshaller [
	^ LowcodeFFIRegisterMarshallerPointer new
]
