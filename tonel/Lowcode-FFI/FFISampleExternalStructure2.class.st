Class {
	#name : #FFISampleExternalStructure2,
	#superclass : #FFIExternalStructure,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFISampleExternalStructure2 class >> fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
		int outerInt1;
		FFISampleExternalStructure innerStructure;
		void* somePointer;
	)
]
