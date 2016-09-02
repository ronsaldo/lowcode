Extension { #name : #FFIConstantHandleType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIConstantHandleType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
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
FFIConstantHandleType >> emitLowcodeReturnConvertHandle: aBuilder [
	self typeSize = 4 ifTrue: [ 
		aBuilder
			lowcodeUint32ToOop.
	] ifFalse: [ 
		aBuilder
			lowcodeUint64ToOop.
	].	
]
