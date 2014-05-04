"
This class generates the methods of the LowcodeAssembler for adding instructions.


"
Class {
	#name : #LowcodeAssemblerGenerator,
	#superclass : #Object,
	#instVars : [
		'dom'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'code generation' }
LowcodeAssemblerGenerator class >> fromFileNamed: fileName [
	"
	self fromFileNamed: '../lowcode.xml'
	"
	^ self new fromFileNamed: fileName; yourself.
]

{ #category : #'code generation' }
LowcodeAssemblerGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: '../lowcode.xml'
	"
	^ self fromFileNamed: fileName; generate
]

{ #category : #accessing }
LowcodeAssemblerGenerator >> dom [
	
	^ dom
]

{ #category : #accessing }
LowcodeAssemblerGenerator >> dom: anObject [
	
	dom := anObject
]

{ #category : #initialize }
LowcodeAssemblerGenerator >> fromFileNamed: fileName [
	| stream |
	stream := FileSystem disk openFileStream: fileName writable: false.
	[
		self dom: (XMLDOMParser parse: stream)
	] ensure: [ stream close ]
]
