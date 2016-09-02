Extension { #name : #FFIExternalValueHolderType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalValueHolderType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		pushDup;
		
		"Check for a subclass of external value holder."
		send: #class;
		send: #superclass;
		pushLiteralVariable: FFIExternalValueHolder binding;
		send: #==;
		jumpAheadTo: #invalidArgument if: false;
		
		"Check the type"
		pushDup;
		send: #type;
		send: #class; "HACK: Just compare the class of the type for now."
		pushLiteral: self representationType class;
		send: #==;
		jumpAheadTo: #invalidArgument if: false;
		jumpAheadTo: #validArgument;
		
		"Error message"
		jumpAheadTarget: #invalidArgument;
		jumpAheadTarget: #invalidArgument;
		pushReceiver;
		pushLiteral: 'Expected a value holder of type ' , self representationType printString;
		send: #error:;
		returnTop;
		jumpAheadTarget: #validArgument;

		"Access the handle"		
		lowcodeLoadObjectField: (self objectClass instVarIndexFor: self instanceVariableName 
			ifAbsent: [ self error: 'No ', self instanceVariableName, ' instVar' ]) - 1.

	self needsArityPacking 
		ifTrue: [ self emitPointerArityRoll: aBuilder context: aContext ].

	aBuilder		
		storeTemp: tempName;
		popTop.

]
