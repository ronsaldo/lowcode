Class {
	#name : #LowcodeAssemblerGenerator,
	#superclass : #LowcodeGenerator,
	#classVars : [
		'TypeMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #generate }
LowcodeAssemblerGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: './lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #initialize }
LowcodeAssemblerGenerator class >> initialize [
	"
	self initialize
	"
	TypeMap := Dictionary newFromPairs: #(
		condition conditionCode:
		label label:
		literal extendA:
		'extend-a' extendA:
		'extend-b' extendB:
	)
]

{ #category : #generation }
LowcodeAssemblerGenerator >> compile: code [
	Author useAuthor: 'Lowcode' during: [ 
		(Smalltalk at: #LowcodeAssembler) compile: code classified: self protocolName ].
]

{ #category : #generation }
LowcodeAssemblerGenerator >> compileSista: code [
	Author useAuthor: 'Lowcode' during: [ 
		(Smalltalk at: #LowcodeAssembler) compile: code classified: self sistaProtocolName ].
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generate [
	self removeOldInstructions.
	self removeOldTables.
	self generateTables.
	self generateInstructions.
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateConditionalInstruction: inst [ 
	spec conditions do: [ :cond | self generateInstruction: inst withCondition: cond]

]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateInstruction: inst [
	| code |
	inst isConditional ifTrue: [ ^ self generateConditionalInstruction: inst ].
	
	code := ByteString streamContents: [ :stream |
		"Generate the selector"
		stream nextPutAll: inst mnemonic.
		self generateTo: stream selectorArguments: inst arguments.
		
		"Generate the arguments"
		stream cr; tab; nextPutAll: 'self addInstruction: ', inst opcode printString.
		self generateTo: stream instructionArguments: inst arguments.
	].

	self compile: code
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateInstruction: inst withCondition: condition [
	
	| code |
	code := ByteString streamContents: [ :stream |
		"Generate the selector"
		stream nextPutAll: inst mnemonic; nextPutAll: condition mnemonic.
		self generateTo: stream selectorArguments: inst arguments allButFirst.
		
		"Generate the arguments"
		stream cr; tab; nextPutAll: 'self addInstruction: ', inst opcode printString.
		self generateTo: stream instructionArguments: inst arguments allButFirst withCondition: condition.
	].
	self compile: code
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateInstructions [
	spec instructions do: [ :inst | self generateInstruction: inst ]
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTables [
	| code |
	code := ByteString streamContents: [ :stream |
		stream nextPutAll: 
'initMnemonicTables
	LowcodeMnemonics := IdentityDictionary newFromPairs: #(
'.
		spec instructions do: [ :ins |
			stream nextPutAll: '			' , ins opcode asString , ' ' , ins mnemonic; cr
		].

		stream nextPutAll: ').
	SistaExtendedBytecodeMnemonics := IdentityDictionary newFromPairs: #(
'.

	spec sistaInstructions do: [ :ins |
		ins firstOpcode = ins lastOpcode ifTrue: [ 
			stream nextPutAll: '			' , ins firstOpcode asString , ' ' , ins mnemonic; cr			
		]
		ifFalse: [
				(ins firstOpcode to: ins lastOpcode) do: [ :i |
					stream nextPutAll: '			' , i asString , ' ''' , ins mnemonic , ': ', (i - ins firstOpcode) asString, ''''; cr
			] 
		]
	].

	stream nextPutAll: '
)
'
		 ].

	Author useAuthor: 'Lowcode' during: [ 
		LowcodeStreamElement class compile: code classified: self protocolName ].
	LowcodeStreamElement initMnemonicTables
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTo: stream instructionArgument: arg index: index [
	| map |
	map := TypeMap at: arg type ifAbsent: [ self error: 'expected a type map' ].
	stream nextPutAll: map asString , ' a' , index asString, 'N'   , arg name
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTo: stream instructionArguments: arguments [
	arguments ifEmpty: [ ^ self ].
	stream nextPutAll: '  '.
	
	arguments doWithIndex: [ :arg :i  |
		i > 1 ifTrue: [
			stream nextPutAll: '  '.
		].
	
		self generateTo: stream instructionArgument: arg index: i.
	].

]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTo: stream instructionArguments: arguments withCondition: condition [
	arguments ifEmpty: [ ^ self ].
	stream nextPutAll: ' conditionCode: ',  condition code printString , ' . '.
	
	arguments doWithIndex: [ :arg :i  |
		i > 1 ifTrue: [
			stream nextPutAll: ' . '.
		].
	
		stream nextPutAll: '('.
		self generateTo: stream instructionArgument: arg index: i.
		stream nextPutAll: ')'.
	].

	stream nextPutAll: ' }'.
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTo: stream selectorArguments: arguments [
	arguments doWithIndex: [ :arg :i  |
		i = 1 ifTrue: [
			stream nextPutAll: ': '.
		] ifFalse: [ 
			stream nextPutAll: ' ' , arg name , ': '.
		].
	
		stream nextPutAll: 'a', i printString , 'N',  arg name.
	]
]

{ #category : #generation }
LowcodeAssemblerGenerator >> protocolName [
	^ 'lowcode instructions'
]

{ #category : #cleanup }
LowcodeAssemblerGenerator >> removeOldInstructions [
	| protocol |
	protocol := LowcodeAssembler organization protocolNamed: self protocolName.
	protocol methods do: [ :sel |
		LowcodeAssembler removeSelector: sel.
	]
	
]

{ #category : #cleanup }
LowcodeAssemblerGenerator >> removeOldSistaInstructions [
	| protocol |
	protocol := LowcodeAssembler organization protocolNamed: self sistaProtocolName.
	protocol methods do: [ :sel |
		LowcodeAssembler removeSelector: sel.
	]
	
]

{ #category : #cleanup }
LowcodeAssemblerGenerator >> removeOldTables [
	| protocol |
	protocol := LowcodeStreamElement class organization protocolNamed: self protocolName.
	protocol methods do: [ :sel |
		LowcodeStreamElement class removeSelector: sel.
	]
	
]

{ #category : #generation }
LowcodeAssemblerGenerator >> sistaProtocolName [
	^ 'sista extended bytecode instructions'
]
