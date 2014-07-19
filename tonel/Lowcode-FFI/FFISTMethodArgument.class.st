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

{ #category : #testing }
FFISTMethodArgument >> lowcodeCoerceArgument: gen [
	gen pushTemp: index.
	type lowcodeCoerceArgument: gen
]
