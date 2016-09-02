Extension { #name : #FFIFloat64 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat64 >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallFloat64: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat64 >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentFloat64
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloat64 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeFloat64ToOop;
		returnTop
]
