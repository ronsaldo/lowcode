Extension { #name : #FFIUInt32 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt32 >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self emitArgument: aBuilder context: aContext.
	^ aBuilder lowcodeOopToUInt32
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt32 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeUint32ToOop;
		returnTop
]
