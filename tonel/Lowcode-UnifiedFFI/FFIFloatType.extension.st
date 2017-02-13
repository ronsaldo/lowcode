Extension { #name : #FFIFloatType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> emitLowcodeArgumentTempVar: builder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: builder context: aContext ].
	^ builder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		send: #lowcodeFFICoerceFloat;
		storeTemp: tempName;
		popTop
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIFloatType >> lowcodeValueParameterClass [
	^ #float
]
