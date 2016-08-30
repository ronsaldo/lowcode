Extension { #name : #FFIUInt64 }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIUInt64 >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt32
]
