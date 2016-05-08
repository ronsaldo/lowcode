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
