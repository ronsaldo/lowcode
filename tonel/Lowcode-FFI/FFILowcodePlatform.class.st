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
FFILowcodePlatform >> emitLowcode: gen callout: calloutSpec body: aBlock [
	|functionSpec returnType |
	
	gen emitSessionCheck.
	functionSpec := calloutSpec functionSpec.
	returnType := functionSpec returnType.

	returnType lowcode: gen prepareReturn: calloutSpec.
	"Coerce argument."	
	functionSpec arguments do: [ :arg |
		arg lowcode: gen coerceArgument: calloutSpec
	].

	"Generate the body"
	aBlock value: gen value: calloutSpec.

	"Return"
	calloutSpec functionSpec returnType lowcode: gen return: calloutSpec
]

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcodeCdecl: gen callout: calloutSpec [
	self emitLowcodeConventionCommon: gen callout: calloutSpec.
	gen endCall.
	calloutSpec functionSpec returnType lowcode: gen return: calloutSpec
]

{ #category : #'callout generation' }
FFILowcodePlatform >> emitLowcodeConventionCommon: gen callout: calloutSpec [
	|functionSpec returnType |
	
	functionSpec := calloutSpec functionSpec.
	returnType := functionSpec returnType.
	returnType lowcode: gen prepareReturn: calloutSpec.
	
	functionSpec arguments do: [ :arg |
		arg lowcode: gen coerceArgument: calloutSpec
	].

	gen beginCall: self stackAlignment.
	functionSpec arguments reverseDo: [ :arg |
		arg lowcode:gen callArgument: calloutSpec.
	].
	
	returnType lowcode: gen performCall: calloutSpec.

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

{ #category : #'callout generation' }
FFILowcodePlatform >> generateCallout: calloutSpec emit: aBlock [
	^ Lowcode emit: [ :gen |
		self emitLowcode: gen callout: calloutSpec body: aBlock
	] onMethod: calloutSpec originalMethod 
]
