Class {
	#name : #LowcodeSpecInstructionSemantic,
	#superclass : #Object,
	#instVars : [
		'code',
		'locals'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeSpecInstructionSemantic >> asXMLElement [
	| node |
	node := XMLElement name: 'semantic'.
	node  contentString: self code.
	self locals ifNotEmpty: [ node attributeAt: 'locals' put: self locals ].
	^ node
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> code [
	
	^ code
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> code: anObject [
	
	code := anObject
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> locals [
	
	^ locals
]

{ #category : #accessing }
LowcodeSpecInstructionSemantic >> locals: anObject [
	
	locals := anObject
]
