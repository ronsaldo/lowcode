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
			out nextPutAll: ins opcode printString; tab; nextPutAll: ins mnemonic; tab; nextPutAll: ins description; cr
		]
	]
]

{ #category : #scripts }
LowcodeSpec class >> generateOpcodes [
	"
	self generateOpcodes
	"
|spec sortedInstructions currentArity currentResultArity arityCount arity resultArity arityStart |
spec := LowcodeSpecLoader fromFileNamed: 'old-lowcode.xml'.
sortedInstructions := spec instructions sort: [ :a :b | 
	a stackArguments size == b stackArguments size ifTrue: [ 
		a stackResults size == b stackResults size ifTrue: [ 
			a mnemonic < b mnemonic
		] ifFalse: [ 
			a stackResults size < b stackResults size
		]
	]
	ifFalse: [
		a stackArguments size < b stackArguments size
	]
].

currentArity := -1.
currentResultArity := -1.
arityCount := 0.
arityStart := #(#(0 0 0) (0 7 0) (0 69 0) (0 5 0) (0 0 0) (0 0 0)).
sortedInstructions do: [:ins |
	arity := ins stackArguments size.
	resultArity := ins stackResults size.
	(arity ~= currentArity or: [resultArity ~= currentResultArity]) ifTrue: [
		currentArity := arity.
		currentResultArity := resultArity.
		arityCount := ((arityStart at: arity + 1) at: resultArity + 1).
	]
	ifFalse: [
		arityCount := arityCount + 1
	].

	ins opcode: (currentArity *1000) + (resultArity*300)+ arityCount.
].

(FileSystem workingDirectory / 'lowcode-new.xml') writeStreamDo: [ :out |
	spec makeXML prettyPrintOn: out
]

]

{ #category : #scripts }
LowcodeSpec class >> implementedList [
	"
	self implementedList
	"
	|spec|
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	((spec instructions select: [ :ins | (ins hasSemanticFor: 'Smalltalk/Cog') or: [ins hasSemanticFor: 'Smalltalk/Cog/32']]) sorted: [ :a :b | a mnemonic < b mnemonic ]) inspect 
]

{ #category : #scripts }
LowcodeSpec class >> todoList [
	"
	self todoList
	"
	|spec|
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	((spec instructions select: [ :ins | (ins hasSemanticFor: 'Smalltalk/Cog') not and: [(ins hasSemanticFor: 'Smalltalk/Cog/32') not]]) sorted: [ :a :b | a mnemonic < b mnemonic ]) inspect 
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
