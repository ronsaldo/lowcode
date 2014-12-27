Class {
	#name : #FFICallbackThunkTable,
	#superclass : #Object,
	#instVars : [
		'size',
		'callbackPointerRegistry',
		'callbackMethodRegistry'
	],
	#classVars : [
		'ThunkTable',
		'ThunkTableSession'
	],
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #accessing }
FFICallbackThunkTable class >> current [
	(ThunkTable ==nil or: [ ThunkTableSession ~~ Smalltalk session]) ifTrue: [ 
		ThunkTable := self new.
		ThunkTableSession := Smalltalk session.
	].
	^ ThunkTable
]

{ #category : #accessing }
FFICallbackThunkTable class >> reset [
	"WARNING: This could be very dangerous"
	ThunkTable := nil
]

{ #category : #'as yet unclassified' }
FFICallbackThunkTable >> callbackAtThunk: thunkPointer [
	^ callbackPointerRegistry at: thunkPointer value ifAbsent: nil.
]

{ #category : #accessing }
FFICallbackThunkTable >> capacity [
	^ self primitiveThunkTableSize
]

{ #category : #'as yet unclassified' }
FFICallbackThunkTable >> createThunkReceiver: receiver selector: selector [
	| thunk thunkPointer |
	thunkPointer := self thunkEntryAt: size.
	thunkPointer ifNil: [ self error: 'The callback thunk slots has been exhausted' ].
	thunk := FFICallback new
		thunkPointer: thunkPointer;
		receiver: receiver;
		selector: selector.
	callbackPointerRegistry at: thunkPointer value put: thunk.
	^ thunk
	
]

{ #category : #initialization }
FFICallbackThunkTable >> initialize [
	super initialize.
	size := 0.
	callbackPointerRegistry := Dictionary new.
	callbackMethodRegistry := Dictionary new.
]

{ #category : #primitives }
FFICallbackThunkTable >> primitiveThunkTableEntryAs: pointerClass at: zeroBasedIndex [
	<primitive: #primitiveThunkTableEntry module: #LowcodeOSPlugin>
	^ nil
]

{ #category : #primitives }
FFICallbackThunkTable >> primitiveThunkTableSize [
	<primitive: #primitiveThunkTableSize module: #LowcodeOSPlugin>
	^ 0
]

{ #category : #accessing }
FFICallbackThunkTable >> thunkEntryAt: index [
	^ self primitiveThunkTableEntryAs: FFIExternalAddress at: index
]

{ #category : #'as yet unclassified' }
FFICallbackThunkTable >> thunkFor: aCompiledMethod [
	| methodClass receiver selector thunk |
	methodClass := aCompiledMethod methodClass.
	"The method has to be in the class side, otherwise, there is no way to find a receiver."
	self assert: methodClass class == Metaclass.
	
	receiver := methodClass baseClass.
	selector := aCompiledMethod selector.
	thunk := callbackMethodRegistry at: (receiver -> selector) ifAbsentPut: [ self createThunkReceiver: receiver selector: selector 	].
		
	"Ensure the unmarshaller is complete"
	^ thunk prepareFor: aCompiledMethod.
]
