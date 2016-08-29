Extension { #name : #FFIBool }

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcode: methodBuilder pushLiteral: literalValue [
	literalValue ifTrue: [
		methodBuilder lowcodePushOne32
	] ifFalse: [ 
		methodBuilder lowcodePushZero32
	]
]

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

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcodeDuplicate: aMethodBuilder [
	aMethodBuilder lowcodeDuplicateInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcodeNot: aMethodBuilder [
	aMethodBuilder
		lowcodePushZero32;
		lowcodeInt32NotEqual
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> emitLowcodePop: aMethodBuilder [
	aMethodBuilder lowcodePopInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> hasLosslessLowcodeConversionForLiteral: literalValue [
	^ literalValue == true or: [ literalValue == false ]
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> isBooleanType [
	^ true
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> isFloatingPointType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> isIntegerType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIBool >> isNumberType [
	^ false
]
