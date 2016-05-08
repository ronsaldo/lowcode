Extension { #name : #FFIFloatType }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	aMethodBuilder
		pushDup;
		send: #isFloat;
		jumpAheadTo: #validArgument if: true;
		pushReceiver;
		pushLiteral: 'Argument ' , argumentName printString , ' has to be a float object.';
		send: #error:;
		pushReceiver;
		returnTop;
		jumpAheadTarget: #validArgument.
	
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isBooleanType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isFloatingPointType [
	^ true
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isIntegerType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isNumberType [
	^ true
]
