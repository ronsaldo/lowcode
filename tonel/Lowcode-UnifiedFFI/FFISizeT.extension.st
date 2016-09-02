Extension { #name : #FFISizeT }

{ #category : #'*Lowcode-UnifiedFFI' }
FFISizeT >> emitLowcode: aBuilder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: aBuilder performCall: functionAddress ].
	^ self pointerSize = 4
		ifTrue: [ aBuilder lowcodePerformCallInt32: functionAddress ]
		ifFalse: [ aBuilder lowcodePerformCallInt64: functionAddress ]
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFISizeT >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ self pointerSize = 4 ifTrue: [ aBuilder lowcodeCallArgumentInt32 ] ifFalse: [ aBuilder lowcodeCallArgumentInt64 ]
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFISizeT >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	aBuilder
		pushTemp: tempName.
	^ self pointerSize = 4 ifTrue: [ aBuilder lowcodeOopToUInt32 ] ifFalse: [ aBuilder lowcodeOopToUInt64 ]
]
