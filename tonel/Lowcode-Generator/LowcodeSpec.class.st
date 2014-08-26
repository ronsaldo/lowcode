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

{ #category : #scripts }
LowcodeSpec class >> generateClassComments [
	"
	self generateClassComments
	"
	|spec|
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	^ ByteString streamContents: [ :out |
		spec instructions do: [ :ins |
			out nextPutAll: ins opcode printString; tab; nextPutAll: ins name; tab; nextPutAll: ins description; cr
		]
	]
]

{ #category : #scripts }
LowcodeSpec class >> generateOpcodes [
	"
	self generateOpcodes
	"
|spec sortedInstructions currentArity arityCount arity arityStart |
spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
sortedInstructions := spec instructions sort: [ :a :b | 
	a stackArguments size == b stackArguments size ifTrue: [ 
		a mnemonic < b mnemonic
	]
	ifFalse: [
		a stackArguments size < b stackArguments size
	]
].

currentArity := -1.
arityCount := 0.
arityStart := #(7 69 5 0 0).
sortedInstructions do: [:ins |
	arity := ins stackArguments size.
	arity ~= currentArity ifTrue: [
		currentArity := arity.
		arityCount := arityStart at: arity + 1.
	]
	ifFalse: [
		arityCount := arityCount + 1
	].

	ins opcode: currentArity *1000 + arityCount.
].

(FileSystem workingDirectory / 'lowcode-new.xml') writeStreamDo: [ :out |
	spec makeXML prettyPrintOn: out
]

]

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
