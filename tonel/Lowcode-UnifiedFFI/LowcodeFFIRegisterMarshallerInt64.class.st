"
I am a marshaller of an int64 argument that is passed in a CPU register.
"
Class {
	#name : #LowcodeFFIRegisterMarshallerInt64,
	#superclass : #LowcodeFFIRegisterMarshaller,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerInt64 >> dereferencePointerWith: builder [
	builder
		lowcodePointerAddConstantOffset: structureMember offset;
		lowcodeLoadInt64FromMemory.
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerInt64 >> passRegister: aRegister with: builder [
	builder lowcodeMoveInt64ToPhysical: aRegister
]

{ #category : #accessing }
LowcodeFFIRegisterMarshallerInt64 >> registerKind [
	^ #integer
]
