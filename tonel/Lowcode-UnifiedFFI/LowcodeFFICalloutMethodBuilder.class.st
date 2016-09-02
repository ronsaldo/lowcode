"
I am a FFI method builder that uses Lowcode for doing callouts.
"
Class {
	#name : #LowcodeFFICalloutMethodBuilder,
	#superclass : #FFICalloutMethodBuilder,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> generateFFICallout: builder spec: functionSpec [
	"Builds a method call"
	| externalFunction functionAddress argumentTemps |
	builder
		numArgs: self method argumentNames size;
		addTemps: self method argumentNames.
	self generateLowcodeSpecialTemporaries: builder.
	externalFunction := self createFFICalloutLiteralFromSpec: functionSpec.
	externalFunction isNull ifTrue: [
		functionAddress := (ExternalAddress
				loadSymbol: externalFunction name
				module: externalFunction module) value
	] ifFalse: [
		functionAddress := externalFunction getHandle value.
	].

	argumentTemps := functionSpec arguments collect: [ :each | each emitLowcodeArgumentTempVar: builder context: sender ].
	
	functionSpec arguments doWithIndex: [ :each :index |
		each emitLowcodeArgumentTypeCheck: builder temp: (argumentTemps at: index) context: sender
	].
			
	functionSpec arguments doWithIndex: [ :each :index |
		each emitLowcodeMarshallArgument: builder temp: (argumentTemps at: index) context: sender
	].

	builder lowcodeBeginCall: self stackAlignment.
	functionSpec arguments
		reverseDo: [ :each | each emitLowcodeCallArgument: builder ].
		
	functionSpec returnType emitLowcode: builder performCall: functionAddress.

	calloutAPI callingConvention == #stdcall ifTrue: [
		builder lowcodeEndCallNoCleanup.		
	] ifFalse: [
		builder lowcodeEndCall.
	].

	functionSpec arguments doWithIndex: [ :each :index |
		each emitLowcodeCleanAndReturnArgument: builder temp: (argumentTemps at: index) context: sender
	].
		
	^ functionSpec returnType
		emitLowcodeReturn: builder.

]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> generateLowcodeSpecialTemporaries: builder [
	builder addTemps: #(
		__lowcodeContextMark__
		__lowcodePreviousNativeStackPointer__
		__lowcodeNativeFramePointer__
		__lowcodeNativeStackPointer__
		__lowcodeCalloutState__
	).
]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> generateMethodFromSpec: functionSpec [
	| ir |
	ir := IRLowcodeBuilder buildIR: [ :builder |
		self generateFFICallout: builder spec: functionSpec
	].
	ir compilationContext encoderClass: OpalEncoderForSistaV1.
	"ir inspect. self halt."
	^ (ir generate: self method trailer)
		setSignFlag;
		setFrameBit: true; 
		yourself
]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> stackAlignment [
	^ 16
]
