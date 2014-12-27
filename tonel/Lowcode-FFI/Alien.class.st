"
This class is used to take advantage of the current Alien callback infrastructure provided by the VM.
"
Class {
	#name : #Alien,
	#superclass : #Object,
	#category : #'Lowcode-FFI-Callback'
}

{ #category : #'as yet unclassified' }
Alien class >> invokeCallback: vmCallbackContextPointerValue [
	| vmCallbackContext thunkPointer callbackData returnType |
	
	"Unmarshall the callback context structure pointer"
	vmCallbackContext := VMCallbackContext fromPointer:  (FFIExternalAddress new: vmCallbackContextPointerValue).
	thunkPointer := vmCallbackContext thunkp.
	callbackData := FFICallbackThunkTable current callbackAtThunk: thunkPointer.
	callbackData ifNil: [ 
		FileStream stderr nextPutAll: 'Receiving unexpected callback. Program memory corruption is for sure.'; lf.
		self error: 'Receiving unexpected callback. Program memory corruption is for sure.'
	].

	"Perform the callback"
	returnType := callbackData performCallback: vmCallbackContext.
	
	"Return"
	vmCallbackContext returnAs: returnType fromContext: thisContext.
	self error: 'Should not get here'
]

{ #category : #'as yet unclassified' }
Alien class >> invokeCallback: callbackThunk stack: stackPointer registers: registersPointers jmpbuf: jmpBuffer [
	self error: 'This method for callbacks is obsolete.'
]
