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

{ #category : #interpret }
Lowcode class >> interpret: code [
	^ LowcodeEngine current interpret: code
]

{ #category : #interpret }
Lowcode class >> interpret: code with: arg1 [
	^ LowcodeEngine current interpret: code with: arg1
]

{ #category : #interpret }
Lowcode class >> interpret: code with: arg1 with: arg2 [
	^ LowcodeEngine current interpret: code with: arg1 with: arg2
]

{ #category : #interpret }
Lowcode class >> interpret: code with: arg1 with: arg2 with: arg3 [
	^ LowcodeEngine current interpret: code with: arg1 with: arg2 with: arg3
]
