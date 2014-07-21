Class {
	#name : #FFISTMethodArgument,
	#superclass : #FFIFunctionSpecArgument,
	#instVars : [
		'index'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #accessing }
FFISTMethodArgument >> index [
	^ index
]

{ #category : #accessing }
FFISTMethodArgument >> index: argumentIndex [
	index := argumentIndex
]

{ #category : #testing }
FFISTMethodArgument >> isMethodArgument [
	^ true
]

{ #category : #'lowcode generation' }
FFISTMethodArgument >> lowcode: gen coerceArgument: calloutSpec [
	gen pushTemp: index.
	type lowcode: gen coerceArgument: calloutSpec
]
