Extension { #name : #FFIBool }

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToBoolean32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeBoolean32ToOop
]
