Class {
	#name : #FFICallloutAPI,
	#superclass : #Object,
	#instVars : [
		'callout',
		'context'
	],
	#classVars : [
		'TypeAliases'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #'instance creation' }
FFICallloutAPI class >> inContext: aMethodContext [
	^ self new context: aMethodContext
]

{ #category : #accessing }
FFICallloutAPI >> cdecl [
	callout cdecl
]

{ #category : #accessing }
FFICallloutAPI >> context: aContext [
	context := aContext.
	callout sender: context
]

{ #category : #accessing }
FFICallloutAPI >> convention: callingConvention [
	callout convention: callingConvention
]

{ #category : #accessing }
FFICallloutAPI >> function: functionSpec module: aModuleNameOrHandle [
	^ callout callFunction: functionSpec module: aModuleNameOrHandle andRetry: context
]

{ #category : #initialization }
FFICallloutAPI >> initialize [
	callout := FFICalllout new
]

{ #category : #accessing }
FFICallloutAPI >> stdcall [
	callout stdcall
]
