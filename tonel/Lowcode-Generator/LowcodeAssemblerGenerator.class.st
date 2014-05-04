Class {
	#name : #LowcodeAssemblerGenerator,
	#superclass : #Object,
	#instVars : [
		'spec'
	],
	#classVars : [
		'TypeMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #initialize }
LowcodeAssemblerGenerator class >> fromFileNamed: fileName [
	"
	self fromFileNamed: '../lowcode.xml'
	"
	^ self new spec: (LowcodeSpecLoader fromFileNamed: fileName)
]

{ #category : #generate }
LowcodeAssemblerGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: '../lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #initialize }
LowcodeAssemblerGenerator class >> initialize [
	"
	self initialize
	"
	TypeMap := Dictionary newFromPairs: #(
		'int-register' intRegister:
		'float-register' floatRegister:
		'oop-register' oopRegister:
		label labelRef:
		'register-list' registerList:
		u8 immUInt8:
		u16 immUInt16:
		u32 immUInt32:
		u64 immUInt64:
		s8 immInt8:
		s16 immInt16:
		s32 immInt32:
		s64 immInt64:
		f32 immFloat32:
		f64 immFloat64:
		condition conditionCode:
	)
]

{ #category : #generation }
LowcodeAssemblerGenerator >> compile: code [
	Author useAuthor: 'Lowcode' during: [ 
		LowcodeAssembler compileSilently: code classified: self protocolName ].
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generate [
	self removeOldInstructions.
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
LowcodeAssemblerGenerator >> generateTo: stream instructionArgument: arg index: index [
	| map |
	map := TypeMap at: arg type ifAbsent: [ self error: 'expected a type map' ].
	stream nextPutAll: 'self ' , map asString , ' a' , index asString, '_'   , arg name
]

{ #category : #generation }
LowcodeAssemblerGenerator >> generateTo: stream instructionArguments: arguments [
	arguments ifEmpty: [ ^ self ].
	stream nextPutAll: ' args: { '.
	
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
LowcodeAssemblerGenerator >> generateTo: stream instructionArguments: arguments withCondition: condition [
	arguments ifEmpty: [ ^ self ].
	stream nextPutAll: ' args: { self conditionCode: ',  condition code printString , ' . '.
	
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
	
		stream nextPutAll: 'a', i printString , '_',  arg name.
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
		LowcodeAssembler removeSelectorSilently: sel
	]
	
]

{ #category : #accessing }
LowcodeAssemblerGenerator >> spec [
	
	^ spec
]

{ #category : #accessing }
LowcodeAssemblerGenerator >> spec: anObject [
	
	spec := anObject
]
