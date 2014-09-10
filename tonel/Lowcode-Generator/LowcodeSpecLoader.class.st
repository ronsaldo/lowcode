"
This class loads the whole XML specification of Lowcode.
"
Class {
	#name : #LowcodeSpecLoader,
	#superclass : #Object,
	#instVars : [
		'dom',
		'spec'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #loading }
LowcodeSpecLoader class >> fromFileNamed: fileName [
	"
	self fromFileNamed: './lowcode.xml'
	"
	^ self new fromFileNamed: fileName
]

{ #category : #parsing }
LowcodeSpecLoader >> assertElement: element name: name [
	element name ~= name ifTrue: [ self error:  'unexpected element' ]
]

{ #category : #parsing }
LowcodeSpecLoader >> assertElement: element names: names [
	names do: [:n |
		n = element name ifTrue: [ ^ self ]
	].

	self error:  'unexpected element'
]

{ #category : #parsing }
LowcodeSpecLoader >> decodeXMLText: textContent [
	|decoded|
	decoded := textContent copyReplaceAll: '&lt;' with: '<'.
	decoded := decoded copyReplaceAll: '&gt;' with: '>'.
	decoded := decoded copyReplaceAll: '&amp;' with: '&'.
	decoded := decoded copyReplaceAll: '&apos;' with: ''''.
	decoded := decoded copyReplaceAll: '&quot;' with: '"'.
	^ decoded
]

{ #category : #initialize }
LowcodeSpecLoader >> fromFileNamed: fileName [
	| stream |

	" Load the XML DOM"
	stream := FileSystem disk openFileStream: fileName writable: false.
	[
		dom := (XMLDOMParser parse: stream)
	] ensure: [ stream close ].

	"Parse the DOM"
	^ self parseSpec
]

{ #category : #parsing }
LowcodeSpecLoader >> parseArgument: element [
	| arg |
	arg := LowcodeSpecArgument new.
	arg type: element name asSymbol;
		name: (element attributeAt: 'name');
		description: (element attributeAt: 'description' ifAbsent: ['']);
		aliased: (self parseBoolean: (element attributeAt: 'aliased' ifAbsent: [false]));
		allocate: (self parseBoolean: (element attributeAt: 'allocate' ifAbsent: [false])).
	^ arg.
]

{ #category : #parsing }
LowcodeSpecLoader >> parseBoolean: aString [
	(aString == false or: [aString == true ]) ifTrue: [ ^ aString ].
	aString = 'true' ifTrue: [ ^ true ].
	aString = 'false' ifTrue: [ ^ false ].
	self error: 'Failed to parse boolean value.'
]

{ #category : #parsing }
LowcodeSpecLoader >> parseConditionCode: element [
	| condition |
	self assertElement: element name: 'condition-code'.
	
	condition := LowcodeSpecConditionCode new.
	condition code: (element attributeAt: 'code') asInteger;
			mnemonic: (element attributeAt: 'mnemonic');
			name: (element attributeAt: 'name');
			description: element innerXML.
	spec addConditionCode: condition
]

{ #category : #parsing }
LowcodeSpecLoader >> parseConditions: element [
	self assertElement: element name: 'conditions'.
	
	element elementsDo: [ :el |
		el name = 'condition-code' ifTrue: [ self parseConditionCode: el ]
	]
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: element [
	| instruction |
	self assertElement: element name: 'instruction'.
	
	instruction := LowcodeSpecInstruction new.
	instruction opcode: (element attributeAt: 'opcode') asInteger;
				mnemonic: (element attributeAt: 'mnemonic');
				kind: (element attributeAt: 'kind' ifAbsent: [ #operation ]) asSymbol.
	spec addInstruction: instruction.

	element elementsDo: [ :child |
		child name = 'name' ifTrue: [ instruction name: child innerXML ].
		child name = 'description' ifTrue: [ instruction description: child innerXML ].
		child name = 'warning' ifTrue: [ instruction warning: child innerXML ].
		child name = 'arguments' ifTrue: [ self parseInstruction: instruction arguments: child ].
		child name = 'stack-arguments' ifTrue: [ self parseInstruction: instruction stackArguments: child ].
		child name = 'stack-results' ifTrue: [ self parseInstruction: instruction stackResults: child ].
		child name = 'semantic' ifTrue: [ self parseInstruction: instruction semantic: child ]
	]
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: instruction argumentList: element [
	^ Array streamContents: [ :stream |
		element elementsDo: [ :child |
			stream nextPut: (self parseArgument: child)
		]
	]
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: instruction arguments: element [
	self assertElement: element name: 'arguments'.
	instruction arguments: (self parseInstruction: instruction argumentList: element)
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: instruction semantic: element [
	| code semantic |
	self assertElement: element name: 'semantic'.
	code := self decodeXMLText: element innerXML.
	semantic := LowcodeSpecInstructionSemantic new code: code.
	semantic locals: (element attributeAt: 'locals').
	instruction semantic: semantic for: (element attributeAt: 'language')
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: instruction stackArguments: element [
	self assertElement: element name: 'stack-arguments'.
	instruction stackArguments: (self parseInstruction: instruction argumentList: element)
]

{ #category : #parsing }
LowcodeSpecLoader >> parseInstruction: instruction stackResults: element [
	self assertElement: element name: 'stack-results'.
	instruction stackResults: (self parseInstruction: instruction argumentList: element)
]

{ #category : #parsing }
LowcodeSpecLoader >> parseSistaInstruction: element [
	| instruction opcode |
	self assertElement: element name: 'sista-instruction'.
	
	instruction := LowcodeSpecSistaInstruction new.
	instruction mnemonic: (element attributeAt: 'mnemonic').
	instruction kind: (element attributeAt: 'kind' ifAbsent: [ #operation ]) asSymbol.
	
	opcode := element attributeAt: 'opcode' ifAbsent: [ nil ].
	opcode ifNil: [ instruction firstOpcode: (element attributeAt: 'firstOpcode') asInteger .
				instruction lastOpcode: (element attributeAt: 'lastOpcode') asInteger]
		ifNotNil: [ instruction opcode: opcode asInteger ].
	spec addSistaInstruction: instruction.

	element elementsDo: [ :child |
		child name = 'description' ifTrue: [ instruction description: child innerXML ].
		child name = 'stack-arguments' ifTrue: [ self parseInstruction: instruction stackArguments: child ].
		child name = 'stack-results' ifTrue: [ self parseInstruction: instruction stackResults: child ].
		child name = 'semantic' ifTrue: [ self parseInstruction: instruction semantic: child ]
	]
]

{ #category : #parsing }
LowcodeSpecLoader >> parseSpec [
	| root |
	spec := LowcodeSpec new.
	
	"Get the root element"
	root := dom root.
	self assertElement: root name: 'lowcode'.
	
	"Parse the elements"
	root elementsDo: [ :el |
		el name = 'description' ifTrue: [spec description: el innerXML].
		el name = 'instruction' ifTrue: [self parseInstruction: el].
		el name = 'sista-instruction' ifTrue: [self parseSistaInstruction: el].
	].
	
	^ spec
]
