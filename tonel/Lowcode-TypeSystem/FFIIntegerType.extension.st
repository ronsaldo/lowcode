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
