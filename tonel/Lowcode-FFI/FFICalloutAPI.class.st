Class {
	#name : #FFICalloutAPI,
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
FFICalloutAPI class >> inContext: aMethodContext [
	^ self new context: aMethodContext
]

{ #category : #accessing }
FFICalloutAPI >> cdecl [
	callout cdecl
]

{ #category : #accessing }
FFICalloutAPI >> context: aContext [
	context := aContext.
	callout sender: context
]

{ #category : #accessing }
FFICalloutAPI >> convention: callingConvention [
	callout convention: callingConvention
]

{ #category : #accessing }
FFICalloutAPI >> function: functionSpec emit: aBlock [
	^ callout genFunction: functionSpec emit: aBlock andCall: context
]

{ #category : #accessing }
FFICalloutAPI >> function: functionSpec module: aModuleNameOrHandle [
	^ callout callFunction: functionSpec module: aModuleNameOrHandle andRetry: context
]

{ #category : #initialization }
FFICalloutAPI >> initialize [
	callout := FFICallout new
]

{ #category : #accessing }
FFICalloutAPI >> stdcall [
	callout stdcall
]
