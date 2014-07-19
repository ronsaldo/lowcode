Class {
	#name : #FFISTInstanceVariableArgument,
	#superclass : #FFIFunctionSpecArgument,
	#instVars : [
		'index'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #accessing }
FFISTInstanceVariableArgument >> index [
	^ index
]

{ #category : #accessing }
FFISTInstanceVariableArgument >> index: anInteger [
	index := anInteger
]

{ #category : #testing }
FFISTInstanceVariableArgument >> isInstanceVariableArgument [
	^ true
]
