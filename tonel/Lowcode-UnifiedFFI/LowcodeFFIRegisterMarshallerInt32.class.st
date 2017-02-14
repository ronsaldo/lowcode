"
I am a marshaller of an int32 argument that is passed in a CPU register.
"
Class {
	#name : #LowcodeFFIRegisterMarshallerInt32,
	#superclass : #LowcodeFFIRegisterMarshaller,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerInt32 >> dereferencePointerWith: builder [
	builder
		lowcodePointerAddConstantOffset: structureMember offset;
		lowcodeLoadInt32FromMemory.
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerInt32 >> passRegister: aRegister with: builder [
	builder lowcodeMoveInt32ToPhysical: aRegister
]

{ #category : #accessing }
LowcodeFFIRegisterMarshallerInt32 >> registerKind [
	^ #integer
]
