"
I am a marshaller of a float64 argument that is passed in a CPU register.
"
Class {
	#name : #LowcodeFFIRegisterMarshallerFloat64,
	#superclass : #LowcodeFFIRegisterMarshaller,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerFloat64 >> dereferencePointerWith: builder [
	builder
		lowcodePointerAddConstantOffset: structureMember offset;
		lowcodeLoadFloat64FromMemory.
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerFloat64 >> passRegister: aRegister with: builder [
	builder lowcodeMoveFloat64ToPhysical: aRegister
]

{ #category : #accessing }
LowcodeFFIRegisterMarshallerFloat64 >> registerKind [
	^ #float
]
