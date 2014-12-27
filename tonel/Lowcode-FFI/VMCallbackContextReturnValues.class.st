Class {
	#name : #VMCallbackContextReturnValues,
	#superclass : #FFIExternalUnion,
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #'as yet unclassified' }
VMCallbackContextReturnValues class >> fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
		int		valueInteger;
		void*	valuePointer;
		int32	valueInteger32;
		int64	valueInteger64;
		double	valueFloat64;
		float	valueFloat32;
	)
]
