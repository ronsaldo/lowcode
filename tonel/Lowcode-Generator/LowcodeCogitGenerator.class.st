Class {
	#name : #LowcodeCogitGenerator,
	#superclass : #LowcodeGenerator,
	#instVars : [
		'destName',
		'out',
		'allocatedIntRegisters',
		'allocatedRegisterVarNames',
		'allocatedFloatRegisters'
	],
	#classVars : [
		'FloatRegisters',
		'IntegerRegisters'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator class >> generateFromFileNamed: fileName to: destFileName [
	"
	self generateFromFileNamed: './lowcode.xml' to: 'LowcodeCog.st'
	"
	(self fromFileNamed: fileName) destName: destFileName; generate.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	IntegerRegisters := #(Arg1Reg SendNumArgsReg ClassReg ReceiverResultReg).
	FloatRegisters := #(DPFPReg0 DPFPReg1 DPFPReg2 DPFPReg3 DPFPReg4 DPFPReg5 DPFPReg6 DPFPReg7).
	
	
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateArgumentRegisters: instruction [
	instruction stackArguments reverseDo: [ :arg |
		self allocateRegisterTo: arg
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateFloatRegisterTo: name [
	| templ code |
	templ := '
			($var := backEnd availableFloatRegisterOrNilFor: $liveRegisters) ifNil:
				[self ssAllocateRequiredReg: ($var := $reg)].
'.
	code := ((templ copyReplaceAll: '$var' with: name)
					copyReplaceAll: '$liveRegisters' with: self allocatedRegisterMask)
					copyReplaceAll: '$reg' with: (FloatRegisters at: allocatedFloatRegisters + 1).
	out nextPutAll: code.
	allocatedFloatRegisters := allocatedFloatRegisters + 1.
	self allocatedRegisterName: name
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateInteger64RegisterTo: name [
	out tab; tab; tab; nextPutAll: name , ' := #UnimplementedInt64.'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateIntegerRegisterTo: name [
	| templ code |
	allocatedIntRegisters == 0 ifTrue: [ 
		templ := '
			($var := backEnd availableRegisterOrNilFor: self liveRegisters) ifNil:
				[self ssAllocateRequiredReg:
					($var := optStatus isReceiverResultRegLive
						ifTrue: [Arg0Reg]
						ifFalse: [ReceiverResultReg])].
'.
		code := templ copyReplaceAll: '$var' with: name.
	] ifFalse: [
		templ := '
			($var := backEnd availableRegisterOrNilFor: $liveRegisters) ifNil:
				[self ssAllocateRequiredReg: ($var := $reg)].
'.
		code := ((templ copyReplaceAll: '$var' with: name)
					copyReplaceAll: '$liveRegisters' with: self allocatedRegisterMask)
					copyReplaceAll: '$reg' with: (IntegerRegisters at: allocatedIntRegisters).
	].

	out nextPutAll: code.
	allocatedIntRegisters := allocatedIntRegisters + 1.
	self allocatedRegisterName: name.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateRegisterTo: argument [
	| type |
	type := argument type.
	((type = 'int32' or: [ type = 'oop' ]) or: [ type = 'pointer' ]) ifTrue: [ ^ self allocateIntegerRegisterTo: argument name].
	(type = 'float32' or: [ type = 'float64' ]) ifTrue: [ ^self allocateFloatRegisterTo: argument name].
	(type = 'int64') ifTrue: [ ^self allocateInteger64RegisterTo: argument name].
	self error: 'unsupported argument type for register allocation'
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateResultRegisters: instruction [
	instruction stackResults reverseDo: [ :arg |
		arg aliased ifFalse: [
			self allocateRegisterTo: arg
		]
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocateResultRegistersForNullary: instruction [
	instruction stackResults reverseDo: [ :arg |
		arg allocate ifTrue: [
			self allocateRegisterTo: arg
		]
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocatedRegisterMask [
	| res |
	res := 'self liveRegisters'.
	allocatedRegisterVarNames do: [ :name |
		res := '(' , res , ' bitOr: (self registerMaskFor: ' , name , '))'.
	].
	^ res

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> allocatedRegisterName: name [
	allocatedRegisterVarNames add: name
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginCaseOf [
	out tab; nextPutAll:'prim'; cr;
		tab; tab; nextPutAll: 'caseOf: {'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginInstruction: instruction opcodeOffset: opcodeOffset. [
	allocatedIntRegisters := 0.
	allocatedFloatRegisters := 0.
	allocatedRegisterVarNames := OrderedCollection new.
	out tab; tab; nextPutAll: '[' , (instruction opcode + opcodeOffset) printString , '] -> '; tab ;
		nextPutAll: '[ '; cr;
		tab; tab; tab; nextPutAll: '"', instruction opcode printString; tab; nextPutAll: instruction mnemonic , ' - ' , instruction name , '"'; cr.

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginInstructionsMethod: selector numArgs: numArgs [
	| varNames |
	out nextPutAll: '!StackToRegisterMappingCogit methodsFor: ''inline primitive generators generated code'' !'; cr; cr.
	out nextPutAll: selector, ' prim'; cr.
	out nextPutAll:
'	"SistaV1: 248		11111000 	iiiiiiii		mjjjjjjj		Call Primitive #iiiiiiii + (jjjjjjj * 256) m=1 means inlined primitive, no hard return after execution.	 See EncoderForSistaV1''s class comment and StackInterpreter>>#inlinePrimitiveBytecode:"
'.

	varNames := Set new.
	spec instructions do: [ :ins | ins stackArguments size == numArgs ifTrue: [
			ins allArguments do: [ :arg | varNames add: arg name ]
		]
	].
	self declareVariables: varNames.
	self beginCaseOf.

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> checkReceiverRegisterLive [
	| code |
	allocatedRegisterVarNames ifEmpty: [ ^ self ].
	code := nil.
	allocatedRegisterVarNames do: [ :name |
		code ifNil: [ code := name , ' = ReceiverResultReg' ]
			ifNotNil: [
			code := '(' , code , ' or: [' , name , ' = ReceiverResultReg])'
		]
	].
	out tab; tab; tab; nextPutAll: code , ' ifTrue:'; cr;
		tab; tab; tab; tab; nextPutAll: '[ optStatus isReceiverResultRegLive: false ].'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArgument: arg [
	| type |
	type := arg type.
	(type = 'extend-a' or: [ type = 'literal' ]) ifTrue: [ ^ out tab; tab; tab; nextPutAll: 'extA := 0.'; cr. ].
	(type = 'extend-b' or: [ type = 'label' ]) ifTrue: [ ^ out tab; tab; tab; nextPutAll: 'extB := 0.'; cr. ].
	self error: 'Unknown extended argument.'
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArguments: instruction [
	instruction arguments do: [ :arg | self cleanExtendedArgument: arg]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> declareVariables: varNames [
	varNames ifEmpty: [ ^ self ].
	out tab; nextPutAll: '| '.
	varNames do: [ :name | out nextPutAll: name; nextPut: $ . ].
	out nextPut: $|; cr.
]

{ #category : #accessing }
LowcodeCogitGenerator >> destName [
	
	^ destName
]

{ #category : #accessing }
LowcodeCogitGenerator >> destName: anObject [
	
	destName := anObject
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitBinary: instruction [
	self beginInstruction: instruction opcodeOffset: -2000.
	self emitWithArguments: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitCuaternary: instruction [
	self beginInstruction: instruction opcodeOffset: -4000.
	self emitWithArguments: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitNullary: instruction [
	self beginInstruction: instruction opcodeOffset: 0.
	self fetchExtendedArguments: instruction.
	self allocateResultRegistersForNullary: instruction.
	self checkReceiverRegisterLive.
	
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt.' ]); cr.
	self cleanExtendedArguments: instruction.
	self endInstruction: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitTernary: instruction [
	self beginInstruction: instruction opcodeOffset: -3000.
	self emitWithArguments: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitUnary: instruction [
	self beginInstruction: instruction opcodeOffset: -1000.
	self emitWithArguments: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitWithArguments: instruction [
	self fetchExtendedArguments: instruction.
	self allocateArgumentRegisters: instruction.
	self allocateResultRegisters: instruction.
	self checkReceiverRegisterLive.
	self popArguments: instruction.
	
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt.' ]); cr.
	self cleanExtendedArguments: instruction.
	self endInstruction: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endCaseOf: fallbackSelector [
	out tab; tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ self ', fallbackSelector , ' prim ].'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endInstruction: instruction [
	out tab; tab; tab; nextPutAll: '].'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endInstructionsMethod: fallbackSelector [
	self endCaseOf: fallbackSelector.
	out tab; nextPutAll: '^ 0'; cr.
	
	out cr; nextPutAll: '! !'; cr; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchExtendedArgument: argument [
	| type var |
	type := argument type.
	type = 'literal' ifTrue: [ 
		out nextPutAll: argument name , ' := self getLiteral: extA.'; cr.
		^ self.
	].

	type = 'label' ifTrue: [ 
		out nextPutAll: argument name , ' := extB + 3 + bytecodePC.'; cr.
		^ self.
	].

	type = 'extend-a' ifTrue: [ var := 'extA' ].
	type = 'extend-b' ifTrue: [ var := 'extB' ].
	out tab; tab; tab; nextPutAll: argument name , ' := ' , var , '.'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchExtendedArguments: instruction [
	instruction arguments do: [ :arg | self fetchExtendedArgument: arg ]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generate [
	out := destName asFileReference delete; writeStream.
	[
		self generateHeader;
			generateInstructions: 'Nullary' numArgs: 0 split: 20 with: #emitNullary:;
			generateInstructions: 'Unary' numArgs: 1 split: 10 with: #emitUnary:;
			generateInstructions: 'Binary' numArgs: 2 split: 5 with: #emitBinary:;
			generateInstructions: 'Trinary' numArgs: 3 split: 15 with: #emitTernary:;
			generateInstructions: 'Cuaternary' numArgs: 4 split: 15 with: #emitCuaternary:.
	] ensure: [ out close ]

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateHeader [
	out nextPutAll: '''From LowcodeCogitGenerator''!'; cr; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateInstructions: name numArgs: numArgs split: splitCount with: emitSelector [
	| selectedInstructions numberOfSplits selector fallbackSelector nextIndex remaining count |
	selectedInstructions := spec instructions select: [ :ins | ins stackArguments size == numArgs ].
	
	numberOfSplits := selectedInstructions size // splitCount.
	numberOfSplits * splitCount < selectedInstructions size ifTrue: [ numberOfSplits := numberOfSplits + 1 ].
	nextIndex := 1.
	
	1 to: numberOfSplits do: [ :i |
		selector := 'gen' , name , 'InlinePrimitive'.
		i > 1 ifTrue: [ selector := selector , i printString ].
		selector := (selector , ':') asSymbol.
		
		i < numberOfSplits ifTrue: [ fallbackSelector :=  ('gen' , name , 'InlinePrimitive' , (i+1) printString , ':') asSymbol]
			ifFalse: [ fallbackSelector := ('genOptimized' , name , 'InlinePrimitive:') asSymbol ].
			
		self beginInstructionsMethod: selector numArgs: numArgs.
		
		remaining := selectedInstructions size - nextIndex + 1.
		count := remaining min: splitCount.
		1 to: count do: [ :j |
			self perform: emitSelector with: (selectedInstructions at: nextIndex).
			nextIndex := nextIndex + 1.
		].
	
		self endInstructionsMethod: fallbackSelector.
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateNullaryInstructions [
	self beginInstructionsMethod: #genNullaryInlinePrimitive: numArgs: 0.
		
	spec instructions do: [ :ins | ins stackArguments size == 0 ifTrue: [ self emitNullary: ins ] ].
	
	self endInstructionsMethod: #genOptimizedNullaryInlinePrimitive:.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popArguments: instruction [
	instruction stackArguments reverseDo: [ :arg |
		out tab; tab; tab; nextPutAll: 'self ssTop popToReg: ' , arg name, '.'; cr.
		out tab; tab; tab; nextPutAll: 'self ssPop: 1.'; cr.
	]
]
