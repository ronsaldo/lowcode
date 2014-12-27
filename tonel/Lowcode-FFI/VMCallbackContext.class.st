Class {
	#name : #VMCallbackContext,
	#superclass : #FFIExternalStructure,
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #'fields description' }
VMCallbackContext class >> fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
		void * thunkp;
		long *stackp;
		long *intregargsp;
		double *floatregargsp;
		void *savedCStackPointer;
		void *savedCFramePointer;
		VMCallbackContextReturnValues returnValues;
	)
]

{ #category : #primitive }
VMCallbackContext >> returnAs: returnType fromContext: returnContext [
	<primitive: #primReturnAsFromContextThrough module: #LowcodeOSPlugin>
	self error: 'Failed to return'
]
