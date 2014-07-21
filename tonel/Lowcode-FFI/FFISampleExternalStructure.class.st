Class {
	#name : #FFISampleExternalStructure,
	#superclass : #FFIExternalStructure,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFISampleExternalStructure class >> fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
		int int1, int2;
		short int3;
		float float1, float2;
		double double1;
	)
]
