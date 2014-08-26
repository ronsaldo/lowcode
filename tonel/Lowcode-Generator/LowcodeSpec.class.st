Class {
	#name : #LowcodeSpec,
	#superclass : #Object,
	#instVars : [
		'instructions',
		'sistaInstructions',
		'description'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #adding }
LowcodeSpec >> addInstruction: anInstruction [
	instructions add: anInstruction
]

{ #category : #adding }
LowcodeSpec >> addSistaInstruction: aSistaInstruction [
	sistaInstructions add: aSistaInstruction
]

{ #category : #accessing }
LowcodeSpec >> description [
	^ description
]

{ #category : #accessing }
LowcodeSpec >> description: aString [
	description := aString
]

{ #category : #initialization }
LowcodeSpec >> initialize [
	conditions := OrderedCollection new.
	instructions := OrderedCollection new.
	sistaInstructions := OrderedCollection new.
]

{ #category : #accessing }
LowcodeSpec >> instructions [
	^ instructions
]

{ #category : #'as yet unclassified' }
LowcodeSpec >> makeXML [
	| dom root |
	dom := XMLDocument new encoding: 'utf-8'; version: '1.0'.
	dom addNode: (XMLPI target: 'xml-stylesheet' data: 'href="documentation.xslt" type="text/xsl"').
	root := XMLElement name: 'lowcode'.
	dom addNode: root.
	
	root addNode: (XMLElement new name: 'description'; innerXML: description asString);
		addNode: (XMLComment string: 'Sista extended bytecode instructions').
	sistaInstructions do: [ :ins | root addNode: ins asXMLElement ].

	root addNode: (XMLComment string: 'Lowcode  instructions').
	instructions do: [ :ins | root addNode: ins asXMLElement ].
	
	^dom
]

{ #category : #accessing }
LowcodeSpec >> sistaInstructions [
	^ sistaInstructions
]
