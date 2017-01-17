Extension { #name : #FFIFloat32 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat32 >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallFloat32: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat32 >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentFloat32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat32 >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self emitArgument: aBuilder context: aContext.
	^ aBuilder
		lowcodeOopToFloat32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat32 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeFloat32ToOop;
		returnTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat32 >> lowcodeValueRegisterMarshaller [
	^ LowcodeFFIRegisterMarshallerFloat32 new
]
