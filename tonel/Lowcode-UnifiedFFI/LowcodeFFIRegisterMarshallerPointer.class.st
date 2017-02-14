"
I am a marshaller of a pointer argument that is passed in a CPU register.
"
Class {
	#name : #LowcodeFFIRegisterMarshallerPointer,
	#superclass : #LowcodeFFIRegisterMarshaller,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerPointer >> dereferencePointerWith: builder [
	builder
		lowcodePointerAddConstantOffset: structureMember offset;
		lowcodeLoadPointerFromMemory.
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerPointer >> passRegister: aRegister with: builder [
	builder lowcodeMovePointerToPhysical: aRegister
]

{ #category : #accessing }
LowcodeFFIRegisterMarshallerPointer >> registerKind [
	^ #integer
]
