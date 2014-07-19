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
FFIFunctionSpecArgument >> isReceiverArgument [
	^ false
]

{ #category : #'lowcode generation' }
FFIFunctionSpecArgument >> lowcodeCallArgument: gen [
	"This is to emit the lowcode call argument family of instructions"
	type lowcodeCallArgument: gen
]

{ #category : #'lowcode generation' }
FFIFunctionSpecArgument >> lowcodeCoerceArgument: gen [
	"This is used to emit the conversion from Oop to primitive types."
	self subclassResponsibility.
]

{ #category : #accessing }
FFIFunctionSpecArgument >> type [
	^ type
]

{ #category : #accessing }
FFIFunctionSpecArgument >> type: aFFIExternalTypeInstance [
	type := aFFIExternalTypeInstance
]
