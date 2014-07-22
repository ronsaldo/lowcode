Class {
	#name : #LowcodeValidatorGenerator,
	#superclass : #LowcodeGenerator,
	#classVars : [
		'PopForTypes',
		'PushForTypes'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #generate }
LowcodeValidatorGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: '../lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #'class initialization' }
LowcodeValidatorGenerator class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	PopForTypes := Dictionary newFromPairs: #(
		int32 popInt32
		int64 popInt64
		pointer popPointer
		oop popOop
		float32 popFloat32
		float64 popFloat64
	).
	
	PushForTypes := Dictionary newFromPairs: #(
		int32 pushInt32
		int64 pushInt64
		pointer pushPointer
		oop pushOop
		float32 pushFloat32
		float64 pushFloat64
	).
]

{ #category : #generation }
LowcodeValidatorGenerator >> generate [
	self removeOldValidation;
		generateSistaKindMaps;
		generateLowcodeKindMaps;
		generateSistaValidation;
		generateLowcodeValidation
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateLowcodeKindMaps [
	| code |
	code := ByteString streamContents: [ :out |
		out nextPutAll:
'initializeInstructionKindMap
	InstructionKinds := IdentityDictionary newFromPairs: #(
'.
		spec instructions do: [ :ins |
			out nextPutAll: ins opcode printString , ' ' , ins kind asString; cr.
		].
	out nextPutAll: '
	)'
	].

	Author useAuthor: 'Lowcode' during: [
		(Smalltalk at: #LoDisLowcodeInstruction) class compile: code.
		(Smalltalk at: #LoDisLowcodeInstruction) perform: #initializeInstructionKindMap
	]
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateLowcodeValidation [
	self generateValidationForInstructions: spec instructions class: (Smalltalk at: #LoDisLowcodeInstruction)
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateSistaKindMaps [
	| code |
	code := ByteString streamContents: [ :out |
		out nextPutAll:
'initializeInstructionKindMap
	InstructionKinds := IdentityDictionary newFromPairs: #(
'.
		spec sistaInstructions do: [ :ins |
			(ins firstOpcode to: ins lastOpcode) do: [ :opcode |
				out nextPutAll: opcode printString , ' ' , ins kind asString; cr.
			]
		].
	out nextPutAll: '
	)'
	].

	Author useAuthor: 'Lowcode' during: [
		(Smalltalk at: #LoDisSistaInstruction) class compile: code.
		(Smalltalk at: #LoDisSistaInstruction) perform: #initializeInstructionKindMap
	]
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateSistaValidation [
	self generateValidationForInstructions: spec sistaInstructions class: (Smalltalk at: #LoDisSistaInstruction)
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateValidationFor: instruction class: class [
	| code |
	code := ByteString streamContents: [ :out |
		out nextPutAll: 
instruction mnemonic , 'Validate: stack forMethod: method'; cr.
		instruction stackArguments reverseDo: [ :arg | self popArgument: arg type out: out].
		
		instruction stackResults do: [ :result | self pushResult: result type out: out].
		out tab; nextPutAll: '^ true'
	].

	Author useAuthor: 'Lowcode' during:  [
		class compile: code classified: self protocolName.
	]
]

{ #category : #generation }
LowcodeValidatorGenerator >> generateValidationForInstructions: instructions class: class [
	instructions do: [:ins | self generateValidationFor: ins class: class ]
]

{ #category : #generation }
LowcodeValidatorGenerator >> popArgument: type out: out [
	out tab; nextPutAll: 'stack ', (PopForTypes at: type), ' ifFalse: [^ false ].'; cr.
]

{ #category : #generation }
LowcodeValidatorGenerator >> protocolName [
	^ 'validation generated'
]

{ #category : #generation }
LowcodeValidatorGenerator >> pushResult: type out: out [
	out tab; nextPutAll: 'stack ', (PushForTypes at: type), '.'; cr.
]

{ #category : #generation }
LowcodeValidatorGenerator >> removeOldValidation [
	self removeOldValidation: (Smalltalk at: #LoDisSistaInstruction).
	self removeOldValidation: (Smalltalk at: #LoDisLowcodeInstruction).
]

{ #category : #generation }
LowcodeValidatorGenerator >> removeOldValidation: class [
	| protocol |
	protocol := class organization protocolNamed: self protocolName.
	protocol methods do: [ :sel |
		class removeSelector: sel.
	]
	
]
