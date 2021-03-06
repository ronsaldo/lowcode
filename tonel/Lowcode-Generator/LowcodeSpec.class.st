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
LowcodeSpec class >> computeRegisterSignatures [
	| spec signatures |
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	signatures := Set new.
	spec instructions do: [ :instruction |
		signatures add: instruction prettyRegisterSignature
	].

	signatures := signatures collect: #yourself as: Array.
	signatures sort.

]

{ #category : #scripts }
LowcodeSpec class >> computeRegisterSignatures64On32 [
	| spec signatures |
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	signatures := Set new.
	spec instructions do: [ :instruction |
		signatures add: instruction prettyRegisterSignature64On32
	].

	signatures := signatures collect: #yourself as: Array.
	signatures sort.

]

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
	<script>
	"
	self generateOpcodes
	"
|spec sortedInstructions currentArity arityCount arity arityStart arityDiffs |
spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
sortedInstructions := spec instructions sort: [ :a :b |
	a oopStackDifference = b oopStackDifference ifTrue: [
		a mnemonic < b mnemonic
	] ifFalse: [
		a oopStackDifference < b oopStackDifference
	]
].

currentArity := -2.
arityCount := 0.
arityStart := #(0 0 0 0).
arityDiffs := OrderedCollection new.
sortedInstructions do: [:ins |
	arity := ins oopStackDifference.
	(arity ~= currentArity) ifTrue: [
		currentArity := arity.
		arityCount := 0.
		arity >= 0 ifTrue: [ arityCount := arityStart at: arity + 1 ].
	]
	ifFalse: [
		arityCount := arityCount + 1
	].

	arity < 0 ifTrue: [ arity := 33 + arity ].
	ins opcode: (arity *1000) + arityCount.
].

	spec makeXML prettyPrintToFileNamed: 'lowcode-new.xml'
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
	<script>
	"
	self todoList
	"
	|spec|
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	((spec instructions select: [ :ins |
		(ins hasSemanticFor: 'Smalltalk/Cog') not and:
		[(ins hasSemanticFor: 'Smalltalk/Cog/32') not and:
		[(ins hasSemanticFor: 'Smalltalk/Cog/Raw') not]]]) sorted: [ :a :b | a mnemonic < b mnemonic ]) inspect 
]

{ #category : #scripts }
LowcodeSpec class >> todoListInterpreter [
	<script>
	"
	self todoListInterpreter
	"
	|spec|
	spec := LowcodeSpecLoader fromFileNamed: 'lowcode.xml'.
	((spec instructions select: [ :ins | (ins hasSemanticFor: 'Smalltalk/StackInterpreter') not and: [(ins hasSemanticFor: 'Smalltalk/StackInterpreter/Raw') not] ]) sorted: [ :a :b | a mnemonic < b mnemonic ]) inspect 
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
