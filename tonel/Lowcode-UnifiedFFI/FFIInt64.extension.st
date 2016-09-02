Extension { #name : #FFIInt64 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIInt64 >> emitLowcodeReturn: builder [
	self isPointer ifTrue: [ ^ super emitLowcodeReturn: builder ].
	^ builder
		lowcodeInt64ToOop;
		returnTop
]
