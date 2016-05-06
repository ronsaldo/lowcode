Class {
	#name : #LowcodeOpalCompilerGenerator,
	#superclass : #LowcodeGenerator,
	#classVars : [
		'TypeMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #generate }
LowcodeOpalCompilerGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: './lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #'class initialization' }
LowcodeOpalCompilerGenerator class >> initialize [
	"
	self initialize
	"
	TypeMap := Dictionary newFromPairs: #(
		literal literal:
		local extendA:
		'instance-var' extendA:
		'extend-a' extendA:
		'extend-b' extendB:
	)
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> compileIRBuilder: code [
	Author useAuthor: 'Lowcode' during: [ 
		IRLowcodeBuilder compile: code classified: 'lowcode instructions' ].
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generate [
	self generateIRBuilder
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generateIRBuilder [
	spec instructions do: [ :inst | self generateIRBuilderInstruction: inst ]
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generateIRBuilderInstruction: instruction [
	| code |
	code := ByteString streamContents: [ :out |
		"Generate the selector"
		out nextPutAll: 'lowcode';
			nextPut: instruction mnemonic first uppercase;
			nextPutAll: instruction mnemonic allButFirst.
		self generateTo: out selectorArguments: instruction arguments.
		
		"Generate the arguments"
		out cr;
			tab; nextPutAll: 'self add: (IRInstruction lowcodeInstruction: ';
			nextPutAll: instruction opcode asString.
		self generateTo: out instructionArguments: instruction arguments.
		out nextPut: $).
	].

	self compileIRBuilder: code
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generateTo: out instructionArgument: argument index: index [
	| map |
	map := TypeMap at: argument type ifAbsent: [ self error: 'expected a type map' ].
	out nextPutAll: map asString;
		nextPutAll: ' '.
	argument type = 'local' ifTrue: [ out nextPutAll: '(self nativeLocalOffsetOf: ' ].
	
	out nextPut: $a;
		nextPutAll: index asString;
		nextPut: $N;
		nextPutAll: argument name.
		
	argument type = 'local' ifTrue: [ out nextPutAll: ')' ].
	
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generateTo: out instructionArguments: arguments. [
	arguments ifEmpty: [ ^ self ].
	
	arguments doWithIndex: [ :arg :i |
		out nextPutAll: ' '.
		self generateTo: out instructionArgument: arg index: i.
	]
]

{ #category : #generation }
LowcodeOpalCompilerGenerator >> generateTo: out selectorArguments: arguments [
	arguments doWithIndex: [ :arg :i  |
		i = 1 ifTrue: [
			out nextPutAll: ': '.
		] ifFalse: [ 
			out nextPutAll: ' ' , arg name , ': '.
		].
	
		out nextPutAll: 'a';
			nextPutAll: i printString;
			nextPut: $N;
			nextPutAll: arg name.
	]
]