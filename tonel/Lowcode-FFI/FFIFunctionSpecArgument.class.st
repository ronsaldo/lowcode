Class {
	#name : #FFIFunctionSpecArgument,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #testing }
FFIFunctionSpecArgument >> isInstanceVariableArgument [
	^ false
]

{ #category : #testing }
FFIFunctionSpecArgument >> isMethodArgument [
	^ false
]

{ #category : #testing }
FFIFunctionSpecArgument >> isReceiver [
	^ self isReceiverArgument
]

{ #category : #testing }
FFIFunctionSpecArgument >> isReceiverArgument [
	^ false
]

{ #category : #'lowcode generation' }
FFIFunctionSpecArgument >> lowcode: gen callArgument: calloutSpec [
	"This is to emit the lowcode call argument family of instructions"
	type lowcode: gen callArgument: calloutSpec
]

{ #category : #'lowcode generation' }
FFIFunctionSpecArgument >> lowcode: gen coerceArgument: calloutSpec [
	"This is used to emit the conversion from Oop to primitive types."
	self subclassResponsibility.
]

{ #category : #accessing }
FFIFunctionSpecArgument >> type [
	^ type
]

{ #category : #accessing }
FFIFunctionSpecArgument >> type: aFFIExternalTypeInstance [
	type := aFFIExternalTypeInstance.
	type loader: self
]
