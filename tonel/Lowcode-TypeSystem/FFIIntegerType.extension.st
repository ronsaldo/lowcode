Extension { #name : #FFIIntegerType }

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	aMethodBuilder
		pushDup;
		send: #isInteger;
		jumpAheadTo: #validArgument if: true;
		pushReceiver;
		pushLiteral: 'Argument ' , argumentName printString , ' has to be an integer object.';
		send: #error:;
		pushReceiver;
		returnTop;
		jumpAheadTarget: #validArgument.
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitLowcode: methodBuilder pushLiteral: literalValue [
	literalValue = 0 ifTrue: [ ^ methodBuilder lowcodePushZero32 ].
	literalValue = 1 ifTrue: [ ^ methodBuilder lowcodePushOne32 ].
	methodBuilder
		lowcodePushConstantUInt32: (literalValue asInteger bitAnd: 16rffffffff)
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitLowcodeBitInvert: aMethodBuilder [
	aMethodBuilder lowcodeNot32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitLowcodeDuplicate: aMethodBuilder [
	aMethodBuilder lowcodeDuplicateInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitLowcodeNegated: aMethodBuilder [
	aMethodBuilder lowcodeNeg32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> emitLowcodePop: aMethodBuilder [
	aMethodBuilder lowcodePopInt32
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> hasLosslessLowcodeConversionForLiteral: literalValue [
	^ literalValue isInteger
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isBooleanType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isFloatingPointType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isIntegerType [
	^ true
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isNumberType [
	^ true
]
