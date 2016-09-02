Extension { #name : #FFIInt64 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIInt64 >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	^ aBuilder
		pushTemp: tempName;
		lowcodeOopToInt64
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIInt64 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeInt64ToOop;
		returnTop
]
