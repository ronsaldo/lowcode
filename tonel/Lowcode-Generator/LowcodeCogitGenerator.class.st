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
LowcodeCogitGenerator >> addSemanticLocals: semanticName of: instruction to: varNames [
	| semanticData |
	
	semanticData := instruction semanticDataFor: semanticName ifAbsent: [ nil ].
	semanticData ifNotNil: [
		semanticData locals ifNotEmpty: [
			(semanticData locals findTokens: ' ' ) do: [ :loc |
				varNames add: loc.
			]
		]
	].

]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateArgumentRegisters: instruction [
	self allocateArgumentRegisters: instruction pairAllocation: false
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateArgumentRegisters: instruction pairAllocation: pairAllocation [
	instruction stackArguments reverseDo: [ :arg |
		self allocateRegisterTo: arg pairAllocation: pairAllocation.
	]
]

{ #category : #'register allocation' }
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

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateInteger64RegisterTo: name pairAllocation: pairAllocation [
	pairAllocation ifTrue: [
		self allocateIntegerRegisterTo: name , 'Low'.
		self allocateIntegerRegisterTo: name , 'High'.
	] ifFalse: [
		self allocateIntegerRegisterTo: name
	]
]

{ #category : #'register allocation' }
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

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateRegisterTo: argument pairAllocation: pairAllocation [
	| type |
	type := argument type.
	((type = 'int32' or: [ type = 'oop' ]) or: [ type = 'pointer' ]) ifTrue: [ ^ self allocateIntegerRegisterTo: argument name].
	(type = 'float32' or: [ type = 'float64' ]) ifTrue: [ ^self allocateFloatRegisterTo: argument name].
	(type = 'int64') ifTrue: [ ^self allocateInteger64RegisterTo: argument name pairAllocation: pairAllocation].
	self error: 'unsupported argument type for register allocation'
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateResultRegisters: instruction [
	self allocateResultRegisters: instruction pairAllocation: false
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateResultRegisters: instruction pairAllocation: pairAllocation [
	instruction stackResults reverseDo: [ :arg |
		arg aliased ifFalse: [
			self allocateRegisterTo: arg pairAllocation: pairAllocation
		]
	]
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateResultRegistersForNullary: instruction [
	self allocateResultRegistersForNullary: instruction pairAllocation: false
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocateResultRegistersForNullary: instruction pairAllocation: pairAllocation [
	instruction stackResults reverseDo: [ :arg |
		arg allocate ifTrue: [
			self allocateRegisterTo: arg pairAllocation: pairAllocation
		]
	]
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocatedRegisterMask [
	| res |
	res := 'self liveRegisters'.
	allocatedRegisterVarNames do: [ :name |
		res := '(' , res , ' bitOr: (self registerMaskFor: ' , name , '))'.
	].
	^ res

]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocatedRegisterName: name [
	allocatedRegisterVarNames add: name
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginCaseOf [
	out tab; nextPutAll:'prim'; cr;
		tab; tab; nextPutAll: 'caseOf: {'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginInstructionMethod: selector [
	self resetAllocatedRegisterNames.
	
	out nextPutAll: '!StackToRegisterMappingCogit methodsFor: ''inline primitive generators generated code'' !'; cr; cr.
	out nextPutAll: selector; cr.
	out nextPutAll:
'	"Lowcode instruction generator"
'.

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
	out tab; nextPutAll: code , ' ifTrue:'; cr;
		tab; tab; nextPutAll: '[ optStatus isReceiverResultRegLive: false ].'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArgument: arg [
	| type |
	type := arg type.
	(type = 'extend-a' or: [ type = 'literal' ]) ifTrue: [ ^ out tab; nextPutAll: 'extA := 0.'; cr. ].
	(type = 'extend-b' or: [ type = 'label' ]) ifTrue: [ ^ out tab; nextPutAll: 'extB := 0.'; cr. ].
	self error: 'Unknown extended argument.'
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArguments: instruction [
	instruction arguments do: [ :arg | self cleanExtendedArgument: arg]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> declareInstructionVariables: instruction [
	| varNames  |
	varNames := Set new.
	
	"Always allocate arguments and stack arguments."
	instruction arguments do: [ :arg |
		varNames add: arg name
	].

	instruction stackArguments do: [ :arg |
		varNames add: arg name.
		arg type = 'int64' ifTrue: [
			varNames add: arg name , 'Low'.
			varNames add: arg name , 'High'.
		]
	].

	"Not always allocate stack results"
	instruction stackResults do: [ :arg | 
		arg aliased ~~ true ifTrue: [
			varNames add: arg name.
			arg type = 'int64' ifTrue: [
				varNames add: arg name , 'Low'.
				varNames add: arg name , 'High'.
			]
		]
	].

	(instruction hasSemanticFor: 'Smalltalk/Cog') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog' of: instruction to: varNames].
	(instruction hasSemanticFor: 'Smalltalk/Cog/32') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog/32' of: instruction to: varNames].
	(instruction hasSemanticFor: 'Smalltalk/Cog/64') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog/64' of: instruction to: varNames].

	self declareVariables: varNames.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> declareInstructionVariablesIfAllocated: instruction [
	| varNames  |
	varNames := OrderedCollection new.
	
	"Always allocate extended arguments."
	instruction arguments do: [ :arg | 
		varNames add: arg name
	].

	instruction stackResults do: [ :arg | 
		arg allocate == true ifTrue: [
			varNames add: arg name.
			arg type = 'int64' ifTrue: [
				varNames add: arg name , 'Low'.
				varNames add: arg name , 'High'.
			]
		]
	].
	
	(instruction hasSemanticFor: 'Smalltalk/Cog') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog' of: instruction to: varNames].
	(instruction hasSemanticFor: 'Smalltalk/Cog/32') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog/32' of: instruction to: varNames].
	(instruction hasSemanticFor: 'Smalltalk/Cog/64') ifTrue: [ self addSemanticLocals: 'Smalltalk/Cog/64' of: instruction to: varNames].

	varNames ifNotEmpty: [
		self declareVariables: varNames.
	]
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
LowcodeCogitGenerator >> endCaseOf: fallbackSelector [
	out tab; tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ self ', fallbackSelector , ' prim ].'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endInstructionMethod [
	out tab; nextPutAll: '^ 0'; cr.
	
	out cr; nextPutAll: '! !'; cr; cr.
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
		out tab; nextPutAll: argument name , ' := self getLiteral: extA.'; cr.
		^ self.
	].

	type = 'label' ifTrue: [ 
		out tab; nextPutAll: argument name , ' := extB + 3 + bytecodePC.'; cr.
		^ self.
	].

	type = 'extend-a' ifTrue: [ var := 'extA' ].
	type = 'extend-b' ifTrue: [ var := 'extB' ].
	out tab; nextPutAll: argument name , ' := ' , var , '.'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchExtendedArguments: instruction [
	instruction arguments do: [ :arg | self fetchExtendedArgument: arg ]
]

{ #category : #generation }
LowcodeCogitGenerator >> generate [
	out := destName asFileReference delete; writeStream.
	[
		self generateHeader;
			generateInstructionMethods;
			generateInstructionDispatchMethods.
	] ensure: [ out close ]

]

{ #category : #generation }
LowcodeCogitGenerator >> generateGenericInstructionMethod: instruction [
	self beginInstructionMethod: (self instructionMethodSelector: instruction).
	(instruction hasSemanticFor: 'Smalltalk/Cog/Raw') ifTrue: [
			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/Raw' ifAbsent: [ 'self halt.' ]); cr.
		]
	ifFalse: [
		self declareInstructionVariables: instruction.
		self fetchExtendedArguments: instruction.

		((instruction hasSemanticFor: 'Smalltalk/Cog/32') and: [ instruction hasSemanticFor: 'Smalltalk/Cog/64' ]) ifTrue: [ 
			out tab; nextPutAll: 'BytesPerWord = 4 ifTrue: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateArgumentRegisters: instruction pairAllocation: true.
			self allocateResultRegisters: instruction pairAllocation: true.
			self checkReceiverRegisterLive.
			self popArguments: instruction pairAllocation: true.

			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/32' ifAbsent: [ 'self halt.' ]); cr.

			out tab; nextPutAll: '] ifFalse: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateArgumentRegisters: instruction pairAllocation: false.
			self allocateResultRegisters: instruction pairAllocation: false.
			self checkReceiverRegisterLive.
			self popArguments: instruction pairAllocation: false.

			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/64' ifAbsent: [ 'self halt.' ]); cr.

			out tab; nextPutAll: '].'; cr.
		] ifFalse: [
			self allocateArgumentRegisters: instruction.
			self allocateResultRegisters: instruction.
			self checkReceiverRegisterLive.
			self popArguments: instruction.

			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt.' ]); cr.
		].		
		self cleanExtendedArguments: instruction.
	].

	self endInstructionMethod
]

{ #category : #generation }
LowcodeCogitGenerator >> generateHeader [
	out nextPutAll: '''From LowcodeCogitGenerator''!'; cr; cr
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionDispatchMethods [
	self generateInstructionsDispatch: #genNullaryInlinePrimitive args: 0 fallback: #genOptimizedNullaryInlinePrimitive: offset: 0;
		generateInstructionsDispatch: #genUnaryInlinePrimitive args: 1 fallback: #genOptimizedUnaryInlinePrimitive: offset: -1000;
		generateInstructionsDispatch: #genBinaryInlinePrimitive args: 2 fallback: #genOptimizedBinaryInlinePrimitive: offset: -2000;
		generateInstructionsDispatch: #genTrinaryInlinePrimitive args: 3 fallback: #genOptimizedTrinaryInlinePrimitive: offset: -3000;
		generateInstructionsDispatch: #genCuaternaryInlinePrimitive args: 4 fallback: #genOptimizedCuaternaryInlinePrimitive: offset: -4000
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionMethod: instruction [
	instruction stackArguments size ==  0 ifTrue: [ ^ self generateNullaryInstructionMethod: instruction ].
	self generateGenericInstructionMethod: instruction
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionMethods [
	spec instructions do: [ :ins | self generateInstructionMethod: ins]
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionsDispatch: dispatchSelector args: argCount fallback: fallbackSelector instructions: instructions offset: offset [
	out nextPutAll: '!StackToRegisterMappingCogit methodsFor: ''inline primitive generators dispatch generated code'' !'; cr; cr.
	out nextPutAll: dispatchSelector, ' prim'; cr.
	out nextPutAll:
'	"Lowcode instruction generator dispatch"
	prim
		caseOf: {
'.

	instructions do: [ :ins |
		ins stackArguments size == argCount ifTrue: [
			out tab; tab; tab; nextPutAll: '[' , (ins opcode + offset) printString, ']'; tab; nextPutAll: '-> [ ^ self ' , (self instructionMethodSelector: ins), ' ].'; cr
		]
	].

	out tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ self ' , fallbackSelector , ' prim ].'; cr. 
	out tab; nextPutAll: '^ 0'; cr.
	out cr; nextPutAll: '! !'; cr; cr.
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionsDispatch: dispatchSelector args: argCount fallback: fallbackSelector offset: offset [
	|splitCount instructions selectorCount lastSelector nextSelector|
	splitCount := 60.
	selectorCount := 1.
	lastSelector := (dispatchSelector , ':') asSymbol.
	instructions := OrderedCollection new.
	
	spec instructions do: [ :ins |
		ins stackArguments size == argCount ifTrue: [
			instructions add: ins.
			instructions size == splitCount ifTrue: [
				selectorCount := selectorCount + 1.
				nextSelector := (dispatchSelector , selectorCount printString , ':') asSymbol.
				self generateInstructionsDispatch: lastSelector args: argCount fallback: nextSelector instructions: instructions offset: offset.
				
				instructions removeAll.
				lastSelector := nextSelector.
			].
		]
	].

	self generateInstructionsDispatch: lastSelector args: argCount fallback: fallbackSelector instructions: instructions offset: offset.
]

{ #category : #generation }
LowcodeCogitGenerator >> generateNullaryInstructionMethod: instruction [
	self beginInstructionMethod: (self instructionMethodSelector: instruction).
	
	(instruction hasSemanticFor: 'Smalltalk/Cog/Raw') ifTrue: [
			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/Raw' ifAbsent: [ 'self halt.' ]); cr.
		]
	ifFalse: [
		self declareInstructionVariablesIfAllocated: instruction.
		self fetchExtendedArguments: instruction.

		((instruction hasSemanticFor: 'Smalltalk/Cog/32') and: [ instruction hasSemanticFor: 'Smalltalk/Cog/64' ]) ifTrue: [ 
			out tab; nextPutAll: 'BytesPerWord = 4 ifTrue: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateResultRegistersForNullary: instruction pairAllocation: true.
			self checkReceiverRegisterLive.
			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/32' ifAbsent: [ 'self halt.' ]); cr.

			out tab; nextPutAll: '] ifFalse: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateResultRegistersForNullary: instruction pairAllocation: false.
			self checkReceiverRegisterLive.
			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog/64' ifAbsent: [ 'self halt.' ]); cr.

			out tab; nextPutAll: '].'; cr.
		] ifFalse: [
			self allocateResultRegistersForNullary: instruction.
			self checkReceiverRegisterLive.
	
			out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt.' ]); cr.
		].
	
		self cleanExtendedArguments: instruction.
	].

	self endInstructionMethod
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> instructionMethodSelector: instruction [
	| mnemonic |
	mnemonic := instruction mnemonic.
	^ ('genLowcode' , mnemonic first asString asUppercase , mnemonic allButFirst) asSymbol
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popArguments: instruction [
	self popArguments: instruction pairAllocation: false
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popArguments: instruction pairAllocation: pairAllocation [
	instruction stackArguments reverseDo: [ :arg |
		(pairAllocation and: [arg type = 'int64']) ifTrue: [
			out tab; nextPutAll: 'self ssTop popToReg: ' , arg name, 'Low secondReg: ', arg name ,'High.'; cr.
			out tab; nextPutAll: 'self ssPop: 1.'; cr.
		] ifFalse: [ 
			out tab; nextPutAll: 'self ssTop popToReg: ' , arg name, '.'; cr.
			out tab; nextPutAll: 'self ssPop: 1.'; cr.
		]
	]
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> resetAllocatedRegisterNames [
	allocatedIntRegisters := 0.
	allocatedFloatRegisters := 0.
	allocatedRegisterVarNames := OrderedCollection new.
]
