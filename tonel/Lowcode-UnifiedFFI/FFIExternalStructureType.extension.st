Extension { #name : #FFIExternalStructureType }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> emitLowcode: builder performCall: functionAddress [
	self isPointer ifTrue: [ ^ super emitLowcode: builder performCall: functionAddress ].
	^ builder
		lowcodePerformCallStructure: functionAddress structureSize: (self typeSize alignedTo: self pointerSize)
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> emitLowcodeArgumentTempVar: builder context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTempVar: builder context: aContext ].
	^ builder generateOopTemp
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext [
	self isPointer ifTrue: [ ^ super emitLowcodeArgumentTypeCheck: aBuilder temp: tempName context: aContext ].
	self loader emitArgument: aBuilder context: aContext.
	aBuilder
		pushDup;
		pushLiteral: self objectClass;
		send: #isKindOf:;
		jumpAheadTo: #validStructure if: true;
		
		pushReceiver;
		pushLiteral: 'expected a structure of type ', self objectClass name;
		send: #error;
		returnTop;

		jumpAheadTarget: #validStructure;
		
		lowcodeLoadObjectField: (self objectClass instVarIndexFor: #handle 
			ifAbsent: [ self error: 'No handle instVar' ]) - 1;
			
		storeTemp: tempName;
		popTop.
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> emitLowcodeCallArgument: aBuilder [
	self isPointer ifTrue: [ ^ super emitLowcodeCallArgument: aBuilder ].
	^ aBuilder lowcodeCallArgumentStructure: (self typeSize alignedTo: self pointerSize)
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> emitLowcodeMarshallPrimitiveArgument: aBuilder temp: tempName context: aContext [
	self assert: self isPointer not.
	aBuilder
		pushTemp: tempName.
	self emitLowcodeMarshallPointerValue: aBuilder context: aContext
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIExternalStructureType >> lowcodeValueParameterClass [
	^ #structure
]
