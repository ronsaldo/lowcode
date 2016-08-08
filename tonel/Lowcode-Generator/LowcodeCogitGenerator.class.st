Class {
	#name : #LowcodeCogitGenerator,
	#superclass : #LowcodeGenerator,
	#instVars : [
		'destName',
		'out',
		'allocatedIntRegisters',
		'allocatedRegisterVarNames',
		'allocatedFloatRegisters',
		'currentIndentationLevel'
	],
	#classVars : [
		'CTypeForType',
		'FloatRegisters',
		'IntegerRegisters',
		'PopMethodForType',
		'PushMethodForType'
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

	PopMethodForType := Dictionary newFromPairs: #(
		int32 internalPopStackInt32
		int64 internalPopStackInt64
		float32 internalPopStackFloat32
		float64 internalPopStackFloat64
		pointer internalPopStackPointer
		oop internalPopStack
	).
	
	PushMethodForType := Dictionary newFromPairs: #(
		int32 internalPushInt32:
		int64 internalPushInt64:
		float32 internalPushFloat32:
		float64 internalPushFloat64:
		pointer internalPushPointer:
		oop internalPush:
	).
	
	CTypeForType := Dictionary newFromPairs: #(
		int32 sqInt
		int64 sqLong
		float32 float
		float64 double
		pointer 'char*'
		oop sqInt
		label 'char*'
	).
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> addSemanticLocals: semanticName of: instruction to: varNames [
	| semanticData |
	
	semanticData := instruction semanticDataFor: semanticName ifAbsent: [ nil ].
	semanticData ifNotNil: [
		semanticData locals ifNotEmpty: [
			(semanticData locals findTokens: ' ' ) do: [ :loc |
				varNames add: loc -> nil.
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
$tabs($var := backEnd availableFloatRegisterOrNoneFor: $liveRegisters) = NoReg ifTrue:
$tabs	[self ssAllocateRequiredFloatReg: ($var := $reg)].
'.
	code := (((templ copyReplaceAll: '$var' with: name)
					copyReplaceAll: '$liveRegisters' with: self allocatedFloatRegisterMask)
					copyReplaceAll: '$reg' with: (FloatRegisters at: allocatedFloatRegisters + 1))
					copyReplaceAll: '$tabs' with: self indentationTabs.
	out nextPutAll: code.
	allocatedFloatRegisters := allocatedFloatRegisters + 1.
	self allocatedRegisterName: name type: #float
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
$tabs($var := backEnd availableRegisterOrNoneFor: self liveRegisters) = NoReg ifTrue:
$tabs	[self ssAllocateRequiredReg:
$tabs		($var := optStatus isReceiverResultRegLive
$tabs			ifTrue: [Arg0Reg]
$tabs			ifFalse: [ReceiverResultReg])].
'.
		code := (templ copyReplaceAll: '$var' with: name)
					copyReplaceAll: '$tabs' with: self indentationTabs.
	] ifFalse: [
		templ := '
$tabs($var := backEnd availableRegisterOrNoneFor: $liveRegisters) = NoReg ifTrue:
$tabs	[self ssAllocateRequiredReg: ($var := $reg)].
'.
		code := (((templ copyReplaceAll: '$var' with: name)
					copyReplaceAll: '$liveRegisters' with: self allocatedRegisterMask)
					copyReplaceAll: '$reg' with: (IntegerRegisters at: allocatedIntRegisters))
					copyReplaceAll: '$tabs' with: self indentationTabs.
	].

	out nextPutAll: code.
	allocatedIntRegisters := allocatedIntRegisters + 1.
	self allocatedRegisterName: name type: #int.
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
LowcodeCogitGenerator >> allocatedFloatRegisterMask [
	| res name |
	res := 'self liveFloatRegisters'.
	allocatedRegisterVarNames do: [ :nameType |
		nameType value == #float ifTrue: [
			name := nameType key. 
			res := '(' , res , ' bitOr: (self registerMaskFor: ' , name , '))'.
		]
	].
	^ res

]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocatedRegisterMask [
	| res name |
	res := 'self liveRegisters'.
	allocatedRegisterVarNames do: [ :nameType |
		name := nameType key. 
		nameType value == #int ifTrue: [
			name := nameType key. 
			res := '(' , res , ' bitOr: (self registerMaskFor: ' , name , '))'.
		]
	].
	^ res

]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> allocatedRegisterName: name type: type [
	allocatedRegisterVarNames add: name -> type
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
	currentIndentationLevel := 1.

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginInterpreterInstructionMethod: selector [
	self resetAllocatedRegisterNames.
	
	out nextPutAll: '!StackInterpreter methodsFor: ''inline primitive generated code'' !'; cr; cr.
	out nextPutAll: selector; cr.
	out nextPutAll:
'	"Lowcode instruction generator"
'.
	currentIndentationLevel := 1.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cTypeFor: type [
	^ CTypeForType at: type ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> checkReceiverRegisterLive [
	| code name |
	allocatedRegisterVarNames ifEmpty: [ ^ self ].
	code := nil.
	allocatedRegisterVarNames do: [ :nameType |
		name := nameType key.
		nameType value == #int ifTrue: [
			code ifNil: [ code := name , ' = ReceiverResultReg' ]
				ifNotNil: [
				code := '(' , code , ' or: [' , name , ' = ReceiverResultReg])'
			]
		]
	].
	code ifNotNil: [
		self emitIndentations.
		out nextPutAll: code , ' ifTrue:'; cr.
		self emitIndentations.
		out tab; nextPutAll: '[ optStatus isReceiverResultRegLive: false ].'; cr.
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArgument: arg [
	| type |
	type := arg type.
	(((type = 'extend-a' or: [ type = 'literal' ]) or: [ type = 'local' ]) or: [ type = 'instance-var' ]) ifTrue: [ self emitIndentations. ^ out nextPutAll: 'extA := 0.'; cr. ].
	(type = 'extend-b' or: [ type = 'label' ]) ifTrue: [ self emitIndentations. ^ out nextPutAll: 'extB := 0.'; cr. ].
	self error: 'Unknown extended argument.'
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> cleanExtendedArguments: instruction [
	instruction arguments do: [ :arg | self cleanExtendedArgument: arg]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> declareInstructionInterpreterVariables: instruction [
	| varNames cType |
	varNames := Set new.
	
	"Always allocate arguments and stack arguments."
	instruction allArguments do: [ :arg |
		cType := self cTypeFor: arg type.
		varNames add: arg name -> cType
	].
	(instruction hasSemanticFor: 'Smalltalk/StackInterpreter') ifTrue: [ self addSemanticLocals: 'Smalltalk/StackInterpreter' of: instruction to: varNames].

	self declareVariables: varNames.
	varNames do: [ :nt |
		nt value ifNotNil: [
			out tab; nextPutAll: '<var: #' , nt key , ' type: #''' , nt value , ''' >'; cr
		]
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> declareInstructionVariables: instruction [
	| varNames  |
	varNames := Set new.
	
	"Always allocate arguments and stack arguments."
	instruction arguments do: [ :arg |
		varNames add: arg name -> nil
	].

	instruction stackArguments do: [ :arg |
		varNames add: arg name -> nil.
		arg type = 'int64' ifTrue: [
			varNames add: (arg name , 'Low')  -> nil.
			varNames add: (arg name , 'High')  -> nil.
		]
	].

	"Not always allocate stack results"
	instruction stackResults do: [ :arg | 
		arg aliased ~~ true ifTrue: [
			varNames add: arg name -> nil.
			arg type = 'int64' ifTrue: [
				varNames add: (arg name , 'Low') -> nil.
				varNames add: (arg name , 'High') -> nil.
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
		varNames add: arg name -> nil
	].

	instruction stackResults do: [ :arg | 
		arg allocate == true ifTrue: [
			varNames add: (arg name) -> nil.
			arg type = 'int64' ifTrue: [
				varNames add: (arg name , 'Low') -> nil.
				varNames add: (arg name , 'High') -> nil.
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
	varNames do: [ :name | out nextPutAll: name key; nextPut: $ . ].
	out nextPut: $|; cr.
]

{ #category : #generation }
LowcodeCogitGenerator >> defaultImplementationCode [
	^ '	self abort.' "'	self cCode: ''abort()'' inSmalltalk: [nil halt].'"
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
LowcodeCogitGenerator >> emitIndentations [
	1 to: currentIndentationLevel do: [:i | out tab ]
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
LowcodeCogitGenerator >> endInterpreterInstructionMethod [
	out cr; nextPutAll: '! !'; cr; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchExtendedArgument: argument [
	| type var |
	type := argument type.
	type = 'literal' ifTrue: [
		self emitIndentations.
		out nextPutAll: argument name , ' := self getLiteral: extA.'; cr.
		^ self.
	].

	type = 'label' ifTrue: [
		self emitIndentations.
		out nextPutAll: argument name , ' := extB + 3 + bytecodePC.'; cr.
		^ self.
	].

	((type = 'extend-a' or: [type = 'local']) or: [type = 'instance-var']) ifTrue: [ var := 'extA' ].
	type = 'extend-b' ifTrue: [ var := 'extB' ].
	self emitIndentations.
	out nextPutAll: argument name , ' := ' , var , '.'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchExtendedArguments: instruction [
	instruction arguments do: [ :arg | self fetchExtendedArgument: arg ]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchInterpreterExtendedArgument: argument [
	| type var |
	type := argument type.
	type = 'literal' ifTrue: [ 
		out tab; nextPutAll: argument name , ' := self literal: extA.'; cr.
		^ self.
	].

	type = 'label' ifTrue: [ 
		out tab; nextPutAll: argument name , ' := extB + localIP.'; cr.
		^ self.
	].

	((type = 'extend-a' or: [type = 'local']) or: [type = 'instance-var']) ifTrue: [ var := 'extA' ].
	type = 'extend-b' ifTrue: [ var := 'extB' ].
	out tab; nextPutAll: argument name , ' := ' , var , '.'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> fetchInterpreterExtendedArguments: instruction [
	instruction arguments do: [ :arg | self fetchInterpreterExtendedArgument: arg ]
]

{ #category : #generation }
LowcodeCogitGenerator >> generate [
	destName asFileReference writeStreamDo: [:outFile |
		outFile truncate.
		out := outFile.
	
		self generateHeader;
			generateInstructionMethods;
			generateInstructionDispatchMethods;
			generateInstructionInterpreterMethods;
			generateInstructionInterpreterDispatchMethods.
	]
]

{ #category : #generation }
LowcodeCogitGenerator >> generateGenericInstructionMethod: instruction [
	self beginInstructionMethod: (self instructionMethodSelector: instruction).
	(instruction hasSemanticFor: 'Smalltalk/Cog/Raw') ifTrue: [
			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/Raw' ifAbsent: [ self defaultImplementationCode ]).
		]
	ifFalse: [
		self declareInstructionVariables: instruction.
		self fetchExtendedArguments: instruction.

		((instruction hasSemanticFor: 'Smalltalk/Cog/32') and: [ instruction hasSemanticFor: 'Smalltalk/Cog/64' ]) ifTrue: [ 
			out tab; nextPutAll: 'BytesPerWord = 4 ifTrue: ['; cr.
			currentIndentationLevel := 2.
			
			self resetAllocatedRegisterNames.
			self allocateArgumentRegisters: instruction pairAllocation: true.
			self allocateResultRegisters: instruction pairAllocation: true.
			self checkReceiverRegisterLive.
			self popArguments: instruction pairAllocation: true.

			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/32' ifAbsent: [ self defaultImplementationCode ]) indentationLevels: 2.

			out tab; nextPutAll: '] ifFalse: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateArgumentRegisters: instruction pairAllocation: false.
			self allocateResultRegisters: instruction pairAllocation: false.
			self checkReceiverRegisterLive.
			self popArguments: instruction pairAllocation: false.

			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/64' ifAbsent: [ self defaultImplementationCode ]) indentationLevels: 2.

			out tab; nextPutAll: '].'; cr.
		] ifFalse: [
			self allocateArgumentRegisters: instruction.
			self allocateResultRegisters: instruction.
			self checkReceiverRegisterLive.
			self popArguments: instruction.

			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [  self defaultImplementationCode ]).
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
	self generateInstructionsDispatch: #genLowcodeNullaryInlinePrimitive args: 0 fallback: #genLowcodeOptimizedNullaryInlinePrimitive: offset: 0;
		generateInstructionsDispatch: #genLowcodeUnaryInlinePrimitive args: 1 fallback: #genLowcodeOptimizedUnaryInlinePrimitive: offset: -1000;
		generateInstructionsDispatch: #genLowcodeBinaryInlinePrimitive args: 2 fallback: #genLowcodeOptimizedBinaryInlinePrimitive: offset: -2000;
		generateInstructionsDispatch: #genLowcodeTrinaryInlinePrimitive args: 3 fallback: #genLowcodeOptimizedTrinaryInlinePrimitive: offset: -3000
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionInterpreterDispatchMethods [
	self generateInstructionsInterpreterDispatch: #lowcodeNullaryInlinePrimitive args: 0 fallback: #lowcodeOptimizedNullaryInlinePrimitive: offset: 0;
		generateInstructionsInterpreterDispatch: #lowcodeUnaryInlinePrimitive args: 1 fallback: #lowcodeOptimizedUnaryInlinePrimitive: offset: -1000;
		generateInstructionsInterpreterDispatch: #lowcodeBinaryInlinePrimitive args: 2 fallback: #lowcodeOptimizedBinaryInlinePrimitive: offset: -2000;
		generateInstructionsInterpreterDispatch: #lowcodeTrinaryInlinePrimitive args: 3 fallback: #lowcodeOptimizedTrinaryInlinePrimitive: offset: -3000
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionInterpreterMethod: instruction [
	| rawSemantic |
	self beginInterpreterInstructionMethod: (self instructionInterpreterMethodSelector: instruction).

	rawSemantic := instruction semanticFor: 'Smalltalk/StackInterpreter/Raw' ifAbsent: [	
		self declareInstructionInterpreterVariables: instruction.
		
		self fetchInterpreterExtendedArguments: instruction.
		self popInterpreterArguments: instruction.

		self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/StackInterpreter' ifAbsent: [ self defaultImplementationCode ]).
	
		self pushInterpreterResults: instruction.
		self cleanExtendedArguments: instruction.
	
		self endInterpreterInstructionMethod.
		^ self
	].

	self writeOn: out implementationCode: rawSemantic.
	self endInterpreterInstructionMethod.
	
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionInterpreterMethods [
	spec instructions do: [ :ins | self generateInstructionInterpreterMethod: ins]
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
		ins oopStackDifference = argCount ifTrue: [
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
		ins oopStackDifference == argCount ifTrue: [
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

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateInstructionsInterpreterDispatch: dispatchSelector args: argCount fallback: fallbackSelector instructions: instructions offset: offset [
	out nextPutAll: '!StackInterpreter methodsFor: ''inline primitive dispatch generated code'' !'; cr; cr.
	out nextPutAll: dispatchSelector, ' prim'; cr.
	out nextPutAll:
'	"Lowcode instruction interpreter dispatch"
	prim
		caseOf: {
'.

	instructions do: [ :ins |
		ins oopStackDifference == argCount ifTrue: [
			out tab; tab; tab; nextPutAll: '[' , (ins opcode + offset) printString, ']'; tab; nextPutAll: '-> [ ^ self ' , (self instructionInterpreterMethodSelector: ins), ' ].'; cr
		]
	].

	out tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ self ' , fallbackSelector , ' prim ].'; cr. 
	out tab; nextPutAll: ''; cr.
	out cr; nextPutAll: '! !'; cr; cr.
]

{ #category : #generation }
LowcodeCogitGenerator >> generateInstructionsInterpreterDispatch: dispatchSelector args: argCount fallback: fallbackSelector offset: offset [
	|splitCount instructions selectorCount lastSelector nextSelector|
	splitCount := 60.
	selectorCount := 1.
	lastSelector := (dispatchSelector , ':') asSymbol.
	instructions := OrderedCollection new.
	
	spec instructions do: [ :ins |
		ins oopStackDifference == argCount ifTrue: [
			instructions add: ins.
			instructions size == splitCount ifTrue: [
				selectorCount := selectorCount + 1.
				nextSelector := (dispatchSelector , selectorCount printString , ':') asSymbol.
				self generateInstructionsInterpreterDispatch: lastSelector args: argCount fallback: nextSelector instructions: instructions offset: offset.
				
				instructions removeAll.
				lastSelector := nextSelector.
			].
		]
	].

	self generateInstructionsInterpreterDispatch: lastSelector args: argCount fallback: fallbackSelector instructions: instructions offset: offset.
]

{ #category : #generation }
LowcodeCogitGenerator >> generateNullaryInstructionMethod: instruction [
	self beginInstructionMethod: (self instructionMethodSelector: instruction).
	
	(instruction hasSemanticFor: 'Smalltalk/Cog/Raw') ifTrue: [
			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/Raw' ifAbsent: [ self defaultImplementationCode ]).
		]
	ifFalse: [
		self declareInstructionVariablesIfAllocated: instruction.
		self fetchExtendedArguments: instruction.

		((instruction hasSemanticFor: 'Smalltalk/Cog/32') and: [ instruction hasSemanticFor: 'Smalltalk/Cog/64' ]) ifTrue: [ 
			out tab; nextPutAll: 'BytesPerWord = 4 ifTrue: ['; cr.
			currentIndentationLevel := 2.
			
			self resetAllocatedRegisterNames.
			self allocateResultRegistersForNullary: instruction pairAllocation: true.
			self checkReceiverRegisterLive.
			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/32' ifAbsent: [ self defaultImplementationCode ]) indentationLevels: 2.

			out tab; nextPutAll: '] ifFalse: ['; cr.

			self resetAllocatedRegisterNames.
			self allocateResultRegistersForNullary: instruction pairAllocation: false.
			self checkReceiverRegisterLive.
			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog/64' ifAbsent: [ self defaultImplementationCode ]) indentationLevels: 2.

			out tab; nextPutAll: '].'; cr.
		] ifFalse: [
			self allocateResultRegistersForNullary: instruction.
			self checkReceiverRegisterLive.
	
			self writeOn: out implementationCode: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ self defaultImplementationCode ]).
		].
	
		self cleanExtendedArguments: instruction.
	].

	self endInstructionMethod
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> indentationTabs [
	^ ByteString streamContents: [ :otab | 1 to: currentIndentationLevel do: [ :i | otab tab ] ]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> instructionInterpreterMethodSelector: instruction [
	| mnemonic |
	mnemonic := instruction mnemonic.
	^ ('lowcodePrimitive' , mnemonic first asString asUppercase , mnemonic allButFirst) asSymbol
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> instructionMethodSelector: instruction [
	| mnemonic |
	mnemonic := instruction mnemonic.
	^ ('genLowcode' , mnemonic first asString asUppercase , mnemonic allButFirst) asSymbol
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> interpreterPopMethodFor: type [
	^ PopMethodForType at: type
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> interpreterPushMethodFor: type [
	^ PushMethodForType at: type
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popArguments: instruction [
	self popArguments: instruction pairAllocation: false
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popArguments: instruction pairAllocation: pairAllocation [
	instruction stackArguments reverseDo: [ :arg |
		arg type = 'oop' ifTrue: [
			self emitIndentations.
			out nextPutAll: 'self ssTop popToReg: ' , arg name, '.'; cr.
			self emitIndentations.
			out nextPutAll: 'self ssPop: 1.'; cr.
		] ifFalse: [
			(pairAllocation and: [arg type = 'int64']) ifTrue: [
				self emitIndentations.
				out nextPutAll: 'self ssNativeTop nativePopToReg: ' , arg name, 'Low secondReg: ', arg name ,'High.'; cr.
				self emitIndentations.
				out nextPutAll: 'self ssNativePop: 1.'; cr.
			] ifFalse: [ 
				self emitIndentations.
				out nextPutAll: 'self ssNativeTop nativePopToReg: ' , arg name, '.'; cr.
				self emitIndentations.
				out nextPutAll: 'self ssNativePop: 1.'; cr.
			]
		]
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> popInterpreterArguments: instruction [
	| popMethod |
	instruction stackArguments reverseDo: [ :arg |
		popMethod := self interpreterPopMethodFor: arg type.
		out tab; nextPutAll: arg name , ' := self ' , popMethod , '.'; cr.
	]
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> pushInterpreterResults: instruction [
	| pushMethod |
	instruction stackResults do: [ :arg |
		pushMethod := self interpreterPushMethodFor: arg type.
		out tab; nextPutAll: 'self ' , pushMethod , ' ' , arg name , '.'; cr.
	]
]

{ #category : #'register allocation' }
LowcodeCogitGenerator >> resetAllocatedRegisterNames [
	allocatedIntRegisters := 0.
	allocatedFloatRegisters := 0.
	allocatedRegisterVarNames := OrderedCollection new.
]

{ #category : #generation }
LowcodeCogitGenerator >> writeOn: aStream implementationCode: implementationCode [
	self writeOn: aStream implementationCode: implementationCode indentationLevels: 1
]

{ #category : #generation }
LowcodeCogitGenerator >> writeOn: aStream implementationCode: implementationCode indentationLevels: indentationLevels [
	| trimmedStringLines |
	trimmedStringLines := implementationCode trimBoth substrings: String cr.
	aStream cr.
	trimmedStringLines do: [ :line |
		1 to: indentationLevels do: [ :i | aStream tab ].
		aStream nextPutAll: line trimBoth.
		aStream cr.
	].
	aStream cr.
]
