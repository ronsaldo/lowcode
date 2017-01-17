"
I am a marshaller of a float32 argument that is passed in a CPU register.
"
Class {
	#name : #LowcodeFFIRegisterMarshallerFloat32,
	#superclass : #LowcodeFFIRegisterMarshaller,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshallerFloat32 >> passRegister: aRegister with: builder [
	builder lowcodeMoveFloat32ToPhysical: aRegister
]

{ #category : #accessing }
LowcodeFFIRegisterMarshallerFloat32 >> registerKind [
	^ #float
]
