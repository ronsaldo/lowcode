"
I am a FFI method builder that uses Lowcode for doing callouts.
"
Class {
	#name : #LowcodeFFICalloutMethodBuilder,
	#superclass : #FFICalloutMethodBuilder,
	#instVars : [
		'callingConvention'
	],
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #private }
LowcodeFFICalloutMethodBuilder >> generateFFICallout: builder spec: functionSpec [
	"Builds a method call"
	| externalFunction functionAddress argumentTemps actualArguments integerRegisters floatRegisters registerArguments stackArguments usedIntegerRegisters usedFloatRegisters structurePointerTemp |
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

	actualArguments := self processArguments: functionSpec arguments withNativeTemps: argumentTemps.
	integerRegisters := callingConvention integerRegisterParameters.
	floatRegisters := callingConvention floatRegisterParameters.
	
	registerArguments := OrderedCollection new.
	stackArguments := OrderedCollection new.
	usedIntegerRegisters := 0.
	usedFloatRegisters := 0.
	actualArguments do: [ :arg |
		(arg parameterClass == #register and:
		[ usedIntegerRegisters + arg integerRegisterCount <= integerRegisters size and:
		[ usedFloatRegisters + arg floatRegisterCount <= floatRegisters size]]) ifTrue: [
			usedIntegerRegisters := usedIntegerRegisters + arg integerRegisterCount.
			usedFloatRegisters := usedFloatRegisters + arg floatRegisterCount.
			registerArguments add: arg
		] ifFalse: [
			stackArguments add: arg.
		]
	].
	
	registerArguments reverseDo: [ :each |
		each argument emitLowcodeMarshallArgument: builder temp: each temp context: sender.
		each registerMarshallers size > 1 ifTrue: [
			structurePointerTemp := builder generateNativeTemp: Smalltalk wordSize.
			builder lowcodeStoreLocalPointer: structurePointerTemp
		].
		
		"Do some further marshalling"
		each registerMarshallers size to: 1 by: -1 do: [ :i |
			each registerMarshallers size > 1 ifTrue: [
				builder lowcodeLoadLocalPointer: structurePointerTemp
			].
			(each registerMarshallers at: i) marshallRegisterParameterWith: builder
		].
	].

	stackArguments do: [ :each |
		each argument emitLowcodeMarshallArgument: builder temp: each temp context: sender
	].

	builder lowcodeBeginCall: self stackAlignment.
	stackArguments
		reverseDo: [ :each | each argument emitLowcodeCallArgument: builder ].
		
	registerArguments ifNotEmpty: [
		builder lowcodeLockRegisters.
		usedIntegerRegisters := 0.
		usedFloatRegisters := 0.
		
		registerArguments do: [ :argument |
			argument registerMarshallers do: [ :marshaller |
				marshaller registerKind == #integer ifTrue: [
					usedIntegerRegisters := usedIntegerRegisters + 1.
					marshaller passRegister: (integerRegisters at: usedIntegerRegisters) with: builder
				] ifFalse: [
					self assert: marshaller registerKind == #float.
					usedFloatRegisters := usedFloatRegisters + 1.
					marshaller passRegister: (floatRegisters at: usedFloatRegisters) with: builder
				]
			]
		]
	].
	
	functionSpec returnType emitLowcode: builder performCall: functionAddress.

	registerArguments ifNotEmpty: [
		builder lowcodeUnlockRegisters.
	].

	callingConvention isStackCleanedByCaller ifTrue: [
		builder lowcodeEndCall.
	] ifFalse: [
		builder lowcodeEndCallNoCleanup.
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

{ #category : #private }
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

{ #category : #initialization }
LowcodeFFICalloutMethodBuilder >> initialize [
	super initialize.
	callingConvention := LowcodeABI current callingConventionNamed: calloutAPI callingConvention.
]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> processArgument: rawArgument tempName: rawTemp into: result [
	| parameterClass rawSize integerRegisterCount floatRegisterCount registerMarshallers structureRegisterLayout |
	parameterClass := rawArgument stackParameterClass.
	rawSize := rawArgument typeSize.
	integerRegisterCount := 0.
	floatRegisterCount := 0.
	registerMarshallers := #().
	
	(parameterClass = #integer and: [rawSize <= callingConvention maxIntegerRegisterSize]) ifTrue: [
		parameterClass := #register.
		integerRegisterCount := 1.
		registerMarshallers := { rawArgument lowcodeRegisterMarshaller }.
	] ifFalse: [ 
		(parameterClass = #float and: [rawSize <= callingConvention maxFloatRegisterSize]) ifTrue: [
			parameterClass := #register.
			floatRegisterCount := 1.
			registerMarshallers := { rawArgument lowcodeRegisterMarshaller }.
		] ifFalse: [
			(parameterClass == #structure and:
			 [ callingConvention areStructuresSplitInRegisters and:
				[ (structureRegisterLayout := callingConvention computeStructureRegisterPassingLayout: rawArgument objectClass) isNotNil ]]) ifTrue: [ 
				integerRegisterCount := structureRegisterLayout integerRegisterCount.
				floatRegisterCount := structureRegisterLayout floatRegisterCount.
				registerMarshallers := structureRegisterLayout fields collect: [ :structureField |
					callingConvention structureFieldRegisterMarshaller: structureField
				].
				parameterClass := #register
			] ifFalse: [
				parameterClass := #memory
			]
		]
	].

	result add: (LowcodeFFIArgumentDescription new
		argument: rawArgument;
		size: rawSize;
		parameterClass: parameterClass;
		temp: rawTemp;
		integerRegisterCount: integerRegisterCount;
		floatRegisterCount: floatRegisterCount;
		registerMarshallers: registerMarshallers;
		yourself)
]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> processArguments: arguments withNativeTemps: argumentTemps [
	"Some structures have to be split into registers, so lets split them."
	| result rawTemp |
	result := OrderedCollection new.
	arguments doWithIndex: [ :rawArgument :index |
		rawTemp := argumentTemps at: index.
		self processArgument: rawArgument tempName: rawTemp into: result.
	].

	^ result
]

{ #category : #'as yet unclassified' }
LowcodeFFICalloutMethodBuilder >> stackAlignment [
	^ 16
]
