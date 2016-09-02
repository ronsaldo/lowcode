Extension { #name : #FFIExternalEnumerationType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalEnumerationType >> emitLowcode: aBuilder performCall: functionAddress [
	self typeSize = 4 ifTrue: [ 
		aBuilder lowcodePerformCallInt32: functionAddress.
	] ifFalse: [ 
		aBuilder lowcodePerformCallInt64: functionAddress.
	].
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalEnumerationType >> emitLowcodeCallArgument: aBuilder [
	self typeSize = 4 ifTrue: [ 
		aBuilder lowcodeCallArgumentInt32.
	] ifFalse: [ 
		aBuilder lowcodeCallArgumentInt64.
	].	
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalEnumerationType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self assert: self isPointer not.
	aBuilder
		pushTemp: tempName.
	self typeSize = 4 ifTrue: [ 
		aBuilder lowcodeOopToUInt32.
	] ifFalse: [
		aBuilder lowcodeOopToUInt64.
	].		

]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalEnumerationType >> emitLowcodeReturnConvertHandle: aBuilder [
	self typeSize = 4 ifTrue: [ 
		aBuilder
			lowcodeUint32ToOop.
	] ifFalse: [ 
		aBuilder
			lowcodeUint64ToOop.
	].	
]
