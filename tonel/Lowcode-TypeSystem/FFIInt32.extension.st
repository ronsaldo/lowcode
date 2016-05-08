Extension { #name : #FFIInt32 }

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeConvertFromObject: aMethodBuilder [
	aMethodBuilder
		lowcodeOopToInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIInt32 >> emitLowcodeConvertToObject: aMethodBuilder [
	aMethodBuilder
		lowcodeInt32ToOop
]
