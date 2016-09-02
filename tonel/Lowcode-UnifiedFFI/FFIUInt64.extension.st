Extension { #name : #FFIUInt64 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt64 >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallInt64: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt64 >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt64
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt64 >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	^ aBuilder
		pushTemp: tempName;
		lowcodeOopToUInt64
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt64 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeUint64ToOop;
		returnTop
]
