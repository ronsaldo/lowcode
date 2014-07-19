Class {
	#name : #LowcodeConstants,
	#superclass : #SharedPool,
	#classVars : [
		'LowcodeErrorBase',
		'LowcodeErrorSessionChanged'
	],
	#category : #'Lowcode-Execution'
}

{ #category : #'error codes' }
LowcodeConstants class >> errorSessionChanged [
	^ LowcodeErrorSessionChanged
]

{ #category : #'error codes' }
LowcodeConstants class >> initErrorCodes [
	"Those are some error codes commonly used by the Lowcode interpreter plugin"
	LowcodeErrorBase := 600.
	
	"Some Lowcode methods must be recompiled per session"
	LowcodeErrorSessionChanged := LowcodeErrorBase + 1.
]

{ #category : #'class initialization' }
LowcodeConstants class >> initialize [
	"
	self initialize
	"
	self initErrorCodes
]
