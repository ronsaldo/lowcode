Class {
	#name : #FFICallback,
	#superclass : #Object,
	#instVars : [
		'thunkPointer',
		'receiver',
		'selector',
		'currentMethod'
	],
	#classVars : [
		'ThunkTable',
		'ThunkTableSession'
	],
	#pools : [
		'FFIInternalConstants'
	],
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #adding }
FFICallback >> address [
	^ thunkPointer
]

{ #category : #accessing }
FFICallback >> currentMethod [
	^ currentMethod
]

{ #category : #'as yet unclassified' }
FFICallback >> performCallback: callbackContext [
	self halt.
]

{ #category : #'as yet unclassified' }
FFICallback >> prepareFor: aCompiledMethod [
	self halt.
]

{ #category : #accessing }
FFICallback >> receiver [
	^ receiver
]

{ #category : #accessing }
FFICallback >> receiver: aReceiver [
	receiver := aReceiver
]

{ #category : #accessing }
FFICallback >> selector [
	^ selector
]

{ #category : #accessing }
FFICallback >> selector: aSelector [
	selector := aSelector
]

{ #category : #accessing }
FFICallback >> thunkPointer [
	^ thunkPointer
]

{ #category : #accessing }
FFICallback >> thunkPointer: aThunkPointer [
	thunkPointer := aThunkPointer
]
