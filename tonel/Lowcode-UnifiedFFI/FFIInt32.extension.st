Extension { #name : #FFIInt32 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIInt32 >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self emitArgument: aBuilder context: aContext.
	^ aBuilder lowcodeOopToInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIInt32 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeInt32ToOop;
		returnTop
]
