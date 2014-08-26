Class {
	#name : #LowcodeVCPUGenerator,
	#superclass : #LowcodeGenerator,
	#classVars : [
		'ExtensionArgumentMap',
		'PopForTypes',
		'PushForTypes',
		'StackArgumentMap',
		'StackResultMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #generate }
LowcodeVCPUGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: './lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #generate }
LowcodeVCPUGenerator class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	ExtensionArgumentMap := Dictionary newFromPairs: #(
		'extend-a' 'instruction extendA'
		'label' 'compiler labelAt: instruction extendA'
		'literal' 'compiler literalAt: instruction extendA'
		'extend-b' 'instruction extendB'
	).
	
	StackArgumentMap := Dictionary newFromPairs: #(
		'int32' 'stack popInt32'
		'int64' 'stack popInt64'
		'float32' 'stack popFloat32'
		'float64' 'stack popFloat64'
		'pointer' 'stack popPointer'
		'oop' 'stack popOop'
	).
	
	StackResultMap := Dictionary newFromPairs: #(
		'int32' 'stack pushInt32:'
		'int64' 'stack pushInt64:'
		'float32' 'stack pushFloat32:'
		'float64' 'stack pushFloat64:'
		'pointer' 'stack pushPointer:'
		'oop' 'stack pushOop:'
	).

]

{ #category : #generation }
LowcodeVCPUGenerator >> compile: code protocol: protocolName [
	Author useAuthor: 'Lowcode' during: [ 
		(Smalltalk at: #LoVCPUCompiledBlock) compile: code classified: protocolName ].
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out extensionArgument: extensionArgument [
	out tab; nextPutAll: extensionArgument name , ' := ' , (ExtensionArgumentMap at: extensionArgument type) , '.'; cr.
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out extensionArguments: instruction [
	instruction arguments do: [ :extArg | self emit: out extensionArgument: extArg ]
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out stackArgument: stackArgument [
	out tab; nextPutAll: stackArgument name , ' := ' , (StackArgumentMap at: stackArgument type) , '.'; cr.
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out stackArguments: instruction [
	instruction stackArguments reverseDo: [ :stackArg | self emit: out stackArgument: stackArg ]
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out stackResult: stackResult [
	out tab; nextPutAll: (StackResultMap at: stackResult type) , ' ', stackResult name , '.'; cr.
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out stackResults: instruction [
	instruction stackResults do: [ :res | self emit: out stackResult: res ]
]

{ #category : #generation }
LowcodeVCPUGenerator >> emit: out variables: allArguments [
	allArguments do: [ :arg |
		out nextPutAll: arg name, ' '.
	].
	out nextPutAll: ' |'; cr
]

{ #category : #generation }
LowcodeVCPUGenerator >> generate. [
	self removeOldCode;
		generateSistaInstructions;
		generateLowcodeInstructions
]

{ #category : #generation }
LowcodeVCPUGenerator >> generateInstruction: instruction protocol: protocolName [
	| code |
	code := ByteString streamContents: [ :out |
		out nextPutAll: instruction mnemonic , 'Compilation: instruction withStack: stack
	|'.
		self emit: out variables: instruction allArguments.
		self emit: out extensionArguments: instruction.
		self emit: out stackArguments: instruction.
		
		out nextPutAll: (instruction semanticFor: 'Pharo/VirtualCPU' ifAbsent: [ 'self shouldBeImplemented.' ]); cr.
		
		self emit: out stackResults: instruction.
	].

	self compile: code protocol: protocolName


]

{ #category : #generation }
LowcodeVCPUGenerator >> generateInstructions: instructions protocol: protocolName [
	instructions do: [ :ins | self generateInstruction: ins protocol: protocolName ]
]

{ #category : #generation }
LowcodeVCPUGenerator >> generateLowcodeInstructions [
	self generateInstructions: spec instructions protocol: self lowcodeProtocolName
]

{ #category : #generation }
LowcodeVCPUGenerator >> generateSistaInstructions [
	self generateInstructions: spec sistaInstructions protocol: self sistaProtocolName
]

{ #category : #generation }
LowcodeVCPUGenerator >> lowcodeProtocolName [
	^ 'lowcode instructions'
]

{ #category : #generation }
LowcodeVCPUGenerator >> removeOldCode [
	self removeOldCode: (Smalltalk at: #LoVCPUCompiledBlock) protocolName: self lowcodeProtocolName.
	self removeOldCode: (Smalltalk at: #LoVCPUCompiledBlock) protocolName: self sistaProtocolName.
]

{ #category : #generation }
LowcodeVCPUGenerator >> removeOldCode: class protocolName: protocolName [
	| protocol |
	protocol := class organization protocolNamed: protocolName.
	protocol ifNil: [ ^ self ].
	protocol methods do: [ :sel |
		class removeSelector: sel.
	]
	
]

{ #category : #generation }
LowcodeVCPUGenerator >> sistaProtocolName [
	^ 'sista extended bytecode instructions'
]
