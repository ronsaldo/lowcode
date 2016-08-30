Extension { #name : #FFIIntegerType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIIntegerType >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentInt32
]
