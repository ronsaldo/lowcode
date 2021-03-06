Extension { #name : #FFIVoid }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIVoid >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder lowcodePerformCallVoid: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIVoid >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		pushReceiver;
		returnTop
]
