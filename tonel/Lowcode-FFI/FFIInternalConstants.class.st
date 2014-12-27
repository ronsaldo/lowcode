Class {
	#name : #FFIInternalConstants,
	#superclass : #SharedPool,
	#classVars : [
		'CallbackReturnTypeDouble',
		'CallbackReturnTypeStruct',
		'CallbackReturnTypeWord',
		'CallbackReturnTypeWord64'
	],
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #'class initialization' }
FFIInternalConstants class >> initialize [
	"self initialize"
	super initialize.
	CallbackReturnTypeWord := 1.
	CallbackReturnTypeWord64 := 2.
	CallbackReturnTypeDouble := 3.
	CallbackReturnTypeStruct := 4.
]
