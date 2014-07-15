Class {
	#name : #Lowcode,
	#superclass : #Object,
	#category : #'Lowcode-Execution'
}

{ #category : #'running in context' }
Lowcode class >> emit: aBlock on: aContext [
	^ LowcodeEngine current emit: aBlock on: aContext
]

{ #category : #'running in context' }
Lowcode class >> here: aBlock [
	^ LowcodeEngine current emit: aBlock on: thisContext sender
]
