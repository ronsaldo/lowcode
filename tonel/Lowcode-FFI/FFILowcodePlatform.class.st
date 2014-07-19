Class {
	#name : #FFILowcodePlatform,
	#superclass : #FFIPlatform,
	#category : #'Lowcode-FFI-API'
}

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcode: gen callout: calloutSpec [
	gen emitSessionCheck.
	calloutSpec convention == #cdecl ifTrue: [ self emitLowcodeCdecl: gen callout: calloutSpec ].
	calloutSpec convention == #stdcall ifTrue: [ self emitLowcodeStdcall: gen callout: calloutSpec ].

]

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcodeCdecl: gen callout: calloutSpec [
	self emitLowcodeConventionCommon: gen callout: calloutSpec.
	gen endCall.
	calloutSpec functionSpec returnType lowcodeReturn: gen
]

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcodeConventionCommon: gen callout: calloutSpec [
	|functionSpec returnType |
	
	functionSpec := calloutSpec functionSpec.
	returnType := functionSpec returnType.
	
	functionSpec arguments do: [ :arg |
		arg lowcodeCoerceArgument: gen.
	].

	gen beginCall: self stackAlignment.
	functionSpec arguments reverseDo: [ :arg |
		arg lowcodeCallArgument: gen.
	].
	
	returnType lowcode: gen performCall: calloutSpec functionHandle value.

]

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcodeStdcall: gen callout: calloutSpec [
	self emitLowcodeConventionCommon: gen callout: calloutSpec.
	gen endCallNoCleanup.
	calloutSpec returnType lowcodeReturn: gen
]

{ #category : #'callout generation' }
FFILowcodePlatform >> generateCallout: calloutSpec [
	^ Lowcode emit: [ :gen |
		self emitLowcode: gen callout: calloutSpec 
	] onMethod: calloutSpec originalMethod 
]
