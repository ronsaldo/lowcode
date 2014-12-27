Class {
	#name : #FFICallbackTest,
	#superclass : #TestCase,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFICallbackTest class >> callbackMethod [
	<callback: #(void () ) >
	self halt.
]
