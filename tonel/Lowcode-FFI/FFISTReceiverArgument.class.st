Class {
	#name : #FFISTReceiverArgument,
	#superclass : #FFIFunctionSpecArgument,
	#category : #'Lowcode-FFI-API'
}

{ #category : #testing }
FFISTReceiverArgument >> isReceiverArgument [
	^ true
]

{ #category : #testing }
FFISTReceiverArgument >> lowcode: gen coerceArgument: calloutSpec [
	gen pushReceiver.
	type lowcode: gen coerceArgument: calloutSpec
]
