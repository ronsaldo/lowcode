Extension { #name : #FFIUInt32 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt32 >> emitLowcodeMarshallPrimitiveArgument: builder context: sender [
	^ builder lowcodeOopToUInt32
]
