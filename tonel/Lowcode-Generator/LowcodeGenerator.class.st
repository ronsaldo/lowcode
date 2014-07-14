Class {
	#name : #LowcodeGenerator,
	#superclass : #Object,
	#instVars : [
		'spec'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #initialize }
LowcodeGenerator class >> fromFileNamed: fileName [
	"
	self fromFileNamed: '../lowcode.xml'
	"
	^ self new spec: (LowcodeSpecLoader fromFileNamed: fileName)
]

{ #category : #accessing }
LowcodeGenerator >> spec [
	
	^ spec
]

{ #category : #accessing }
LowcodeGenerator >> spec: anObject [
	
	spec := anObject
]
