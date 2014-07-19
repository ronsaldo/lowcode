"
This class is used to hold a function prototype specification. This classs heavily based in the NBFnSpec writter by Igor Stasenko.
"
Class {
	#name : #FFIFunctionSpec,
	#superclass : #Object,
	#instVars : [
		'returnType',
		'functionName',
		'arguments'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #adding }
FFIFunctionSpec >> addArgument: aFFIFunctionSpecArgument [
	arguments add: aFFIFunctionSpecArgument
	
]

{ #category : #accessing }
FFIFunctionSpec >> arguments [
	
	^ arguments
]

{ #category : #accessing }
FFIFunctionSpec >> arguments: anObject [
	
	arguments := anObject
]

{ #category : #accessing }
FFIFunctionSpec >> functionName [
	
	^ functionName
]

{ #category : #accessing }
FFIFunctionSpec >> functionName: anObject [
	
	functionName := anObject
]

{ #category : #initialization }
FFIFunctionSpec >> initialize [
	arguments := OrderedCollection new
]

{ #category : #accessing }
FFIFunctionSpec >> returnType [
	
	^ returnType
]

{ #category : #accessing }
FFIFunctionSpec >> returnType: anObject [
	
	returnType := anObject
]
