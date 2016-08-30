Extension { #name : #FFIExternalType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcode: builder performCall: functionAddress [
	self assert: self isPointer.
	^ builder
		lowcodePerformCallPointer: functionAddress
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeMarshallArgument: aBuilder context: aContext [
	self emitArgument: aBuilder context: aContext.
	self isPointer ifTrue: [ 
		aBuilder lowcodeOopToPointer.
	] ifFalse: [ 
		self emitLowcodeMarshallPrimitiveArgument: aBuilder context: aContext 
	]
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeMarshallPrimitiveArgument: aBuilder context: aContext [
	self subclassResponsibility
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeNil: builder [
	self assert: self isPointer.
	builder lowcodePushNullPointer
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalType >> emitLowcodeReturn: builder [
	self assert: self isPointer.
	^ builder
		lowcodePointerToOop: ExternalAddress;
		returnTop
]
