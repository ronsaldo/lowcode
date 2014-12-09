"
This class is the Lowcode assembler.
Basic usage consists in making an instance of it, write the instructions and then emit.
"
Class {
	#name : #LowcodeAssembler,
	#superclass : #Object,
	#instVars : [
		'streamElements',
		'literalTable',
		'stackFrameAllocated',
		'numberOfTemporals',
		'numberOfArguments',
		'literals',
		'bytecodes'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'as yet unclassified' }
LowcodeAssembler class >> compiledMethodCode: aBlock [
	^ self compiledMethodFor: #UndefinedMethod class: UndefinedObject code: aBlock trailer: CompiledMethodTrailer empty
]

{ #category : #'as yet unclassified' }
LowcodeAssembler class >> compiledMethodFor: aSelector class: aClass code: aBlock trailer: trailer [
	| asm |
	asm := self new.
	aBlock value: asm.
	asm addLiteral: aSelector;
		addLiteral: aClass binding.
	 ^ asm emitCompiledMethodWith: trailer
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add32 [
	self addInstruction: 0
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add64 [
	self addInstruction: 1
]

{ #category : #adding }
LowcodeAssembler >> addElement: aLowcodeInstruction [
	streamElements add: aLowcodeInstruction
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode [
	self addElement: (LowcodeInstruction new: opcode)
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode extendA: extendA [
	self addElement: (LowcodeInstruction new: opcode extendA: extendA)
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode extendA: extendA extendB: extendB [
	self addElement: (LowcodeInstruction new: opcode extendA: extendA extendB: extendB)
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode label: label [
	self addElement: (LowcodeInstruction new: opcode label: label)
]

{ #category : #adding }
LowcodeAssembler >> addLiteral: literal [
	^ (literalTable indexOf: literal ifAbsent: [
	  	literalTable add: literal.
		^ literalTable size - 1
	 ]) -1
]

{ #category : #adding }
LowcodeAssembler >> addSistaInstruction: opcode [
	self addElement: (LowcodeSistaInstruction new: opcode)
]

{ #category : #adding }
LowcodeAssembler >> addSistaInstruction: opcode with: arg [ 
	self addElement: (LowcodeSistaInstruction new: opcode with: arg)
]

{ #category : #adding }
LowcodeAssembler >> addSistaInstruction: opcode with: arg with: arg2 [
	self addElement: (LowcodeSistaInstruction new: opcode with: arg with: arg2)
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca32 [
	self addInstruction: 2
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca64 [
	self addInstruction: 3
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocal: size [
	| offset |
	offset := stackFrameAllocated.
	stackFrameAllocated := stackFrameAllocated + size.
	^ offset
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalFloat32 [
	^ self allocateLocal: 4
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalFloat64 [
	^ self allocateLocal: 8
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalInt16 [
	^ self allocateLocal: 2
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalInt32 [
	^ self allocateLocal: 4
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalInt64 [
	^ self allocateLocal: 8
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalInt8 [
	^ self allocateLocal: 1
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateLocalPointer [
	^ self allocateLocal: 8
]

{ #category : #'local variables' }
LowcodeAssembler >> allocateTemp [
	| ret |
	ret := numberOfTemporals.
	numberOfTemporals := numberOfTemporals + 1.
	^ ret
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and32 [
	self addInstruction: 4
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and64 [
	self addInstruction: 5
]

{ #category : #'local variables' }
LowcodeAssembler >> argumentCount: count [
	numberOfArguments := count.
	numberOfTemporals := numberOfTemporals + count.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift32 [
	self addInstruction: 6
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift64 [
	self addInstruction: 7
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> beginCall: a1Nalignment [
	self addInstruction: 8  extendA: a1Nalignment
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean32ToOop [
	self addInstruction: 300
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean64ToOop [
	self addInstruction: 301
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse32: a1Ndest [
	self addInstruction: 9  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse64: a1Ndest [
	self addInstruction: 10  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue32: a1Ndest [
	self addInstruction: 11  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue64: a1Ndest [
	self addInstruction: 12  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> byteSizeOf [
	self addInstruction: 1000
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat32 [
	self addInstruction: 13
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat64 [
	self addInstruction: 14
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt32 [
	self addInstruction: 15
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt64 [
	self addInstruction: 16
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentPointer [
	self addInstruction: 17
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentStructure: a1NstructureSize [
	self addInstruction: 18  extendA: a1NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callInstruction: a1Nfunction [
	self addInstruction: 19  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callPhysical: a1NregisterID [
	self addInstruction: 20  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> checkSessionIdentifier: a1NexpectedSession [
	self addInstruction: 21  extendA: a1NexpectedSession
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compareAndSwap32 [
	self addInstruction: 22
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> computeSizes [
	| size |
	size := 0.
	streamElements do: [ :el |
		size := size + (el computeSizeForOffset: size)
	].
	^ size
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div32 [
	self addInstruction: 23
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div64 [
	self addInstruction: 24
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> dump [
	self dumpTo: FileStream stdout
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> dumpTo: aStream [
	| initialPC |
	initialPC := (literals size + 1) * Smalltalk wordSize + 1.
	streamElements do: [ :i | i dumpTo: aStream startPC:  initialPC].
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat32 [
	self addInstruction: 25
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat64 [
	self addInstruction: 26
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt32 [
	self addInstruction: 27
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt64 [
	self addInstruction: 28
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicatePointer [
	self addInstruction: 29
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> duplicateStackTop [
	self addSistaInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress32 [
	self addInstruction: 30
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress64 [
	self addInstruction: 31
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emit [
	self emitInstructions.

	^ LowcodeAssembledMethod new
		literals: literals;
		instructions: bytecodes;
		stackFrameSize: stackFrameAllocated;
		numberOfTemporals: numberOfTemporals;
		numberOfArguments: numberOfArguments.
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emitCompiledMethodWith: trailer [
	"
	Method taken from IRSistaV1BytecodeGenerator >> #compiledMethodWith:
	"
	| cm header |
	self emitInstructions.

	header := ((numberOfArguments bitShift: 24) +
				(numberOfTemporals bitShift: 18) +
				literals size ) + SmallInteger minVal.
	cm := trailer createMethod: bytecodes size class: CompiledMethod header: header.
	(WriteStream with: cm)
		position: cm initialPC - 1;
		nextPutAll: bytecodes.
	literals withIndexDo: [:obj :i | cm literalAt: i put: obj].
	cm needsFrameSize: self stackFrameSize.
	^ cm
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emitInstructions [
	| size |
	streamElements first extendA: stackFrameAllocated.
	size := self computeSizes.
	literals := Array new: literalTable size.
	literalTable doWithIndex: [ :lit :id |
		literals at: id put: lit
	].
	
	bytecodes  := ByteArray new: size streamContents: [ :stream |
		streamElements do: [ :el | el emitToStream: stream ]
	].

]

{ #category : #utilities }
LowcodeAssembler >> emitSessionCheck [
	| rest |
	rest := self makeLabel: 'sessionCorrect'.
		
	self checkSessionIdentifier: Lowcode uniqueSessionIdentifier;
		branchTrue32: rest;
		failWithCode: LowcodeConstants errorSessionChanged;
		returnNil;
		putLabel: rest
		
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCall [
	self addInstruction: 32
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCallNoCleanup [
	self addInstruction: 33
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fail [
	self addInstruction: 34
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> failWithCode: a1NerrorCode [
	self addInstruction: 35  extendA: a1NerrorCode
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstFieldPointer [
	self addInstruction: 1001
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstIndexableFieldPointer [
	self addInstruction: 1002
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Add [
	self addInstruction: 36
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Div [
	self addInstruction: 37
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Equal [
	self addInstruction: 38
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Great [
	self addInstruction: 39
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32GreatEqual [
	self addInstruction: 40
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Less [
	self addInstruction: 41
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32LessEqual [
	self addInstruction: 42
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Mul [
	self addInstruction: 43
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32NotEqual [
	self addInstruction: 44
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Sub [
	self addInstruction: 45
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToFloat64 [
	self addInstruction: 46
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt32 [
	self addInstruction: 47
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt64 [
	self addInstruction: 48
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToOop [
	self addInstruction: 302
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt32 [
	self addInstruction: 49
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt64 [
	self addInstruction: 50
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Add [
	self addInstruction: 51
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Div [
	self addInstruction: 52
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Equal [
	self addInstruction: 53
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Great [
	self addInstruction: 54
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64GreatEqual [
	self addInstruction: 55
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Less [
	self addInstruction: 56
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64LessEqual [
	self addInstruction: 57
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Mul [
	self addInstruction: 58
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64NotEqual [
	self addInstruction: 59
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Sub [
	self addInstruction: 60
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToFloat32 [
	self addInstruction: 61
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt32 [
	self addInstruction: 62
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt64 [
	self addInstruction: 63
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToOop [
	self addInstruction: 303
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt32 [
	self addInstruction: 64
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt64 [
	self addInstruction: 65
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> free [
	self addInstruction: 66
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
	literalTable := OrderedCollection new.
	stackFrameAllocated := 0.
	numberOfTemporals := 2.
	numberOfArguments := 0.
	self localFrameSize: 0.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexable32Oop [
	self addInstruction: 1307
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexableOop: a1NindexableSize [
	self addInstruction: 1308  extendA: a1NindexableSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateOop [
	self addInstruction: 1309
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Equal [
	self addInstruction: 67
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Great [
	self addInstruction: 68
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32GreatEqual [
	self addInstruction: 69
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Less [
	self addInstruction: 70
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32LessEqual [
	self addInstruction: 71
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32NotEqual [
	self addInstruction: 72
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat32 [
	self addInstruction: 73
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat64 [
	self addInstruction: 74
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToOop [
	self addInstruction: 304
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToPointer [
	self addInstruction: 75
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Equal [
	self addInstruction: 76
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Great [
	self addInstruction: 77
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64GreatEqual [
	self addInstruction: 78
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Less [
	self addInstruction: 79
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64LessEqual [
	self addInstruction: 80
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64NotEqual [
	self addInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat32 [
	self addInstruction: 82
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat64 [
	self addInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToOop [
	self addInstruction: 305
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToPointer [
	self addInstruction: 84
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isBytes [
	self addInstruction: 1003
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isFloatObject [
	self addInstruction: 1004
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIndexable [
	self addInstruction: 1005
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIntegerObject [
	self addInstruction: 1006
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isPointers [
	self addInstruction: 1007
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWords [
	self addInstruction: 1008
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWordsOrBytes [
	self addInstruction: 1009
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jump: a1Ndest [
	self addInstruction: 85  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift32 [
	self addInstruction: 86
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift64 [
	self addInstruction: 87
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat32FromMemory [
	self addInstruction: 88
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat64FromMemory [
	self addInstruction: 89
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt16FromMemory [
	self addInstruction: 90
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt32FromMemory [
	self addInstruction: 91
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt64FromMemory [
	self addInstruction: 92
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt8FromMemory [
	self addInstruction: 93
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalAddress: a1NbaseOffset [
	self addInstruction: 94  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat32: a1NbaseOffset [
	self addInstruction: 95  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat64: a1NbaseOffset [
	self addInstruction: 96  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt16: a1NbaseOffset [
	self addInstruction: 97  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt32: a1NbaseOffset [
	self addInstruction: 98  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt64: a1NbaseOffset [
	self addInstruction: 99  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt8: a1NbaseOffset [
	self addInstruction: 100  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalPointer: a1NbaseOffset [
	self addInstruction: 101  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt16: a1NbaseOffset [
	self addInstruction: 102  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt32: a1NbaseOffset [
	self addInstruction: 103  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt64: a1NbaseOffset [
	self addInstruction: 104  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt8: a1NbaseOffset [
	self addInstruction: 105  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectAt [
	self addInstruction: 1310
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectField: a1NfieldIndex [
	self addInstruction: 1311  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadPointerFromMemory [
	self addInstruction: 106
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt16FromMemory [
	self addInstruction: 107
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt32FromMemory [
	self addInstruction: 108
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt64FromMemory [
	self addInstruction: 109
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt8FromMemory [
	self addInstruction: 110
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> localFrameSize: a1Nsize [
	self addInstruction: 111  extendA: a1Nsize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockRegisters [
	self addInstruction: 112
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockVM [
	self addInstruction: 113
]

{ #category : #adding }
LowcodeAssembler >> makeLabel [
	| label |
	label := LowcodeLabel new.
	^ label
]

{ #category : #adding }
LowcodeAssembler >> makeLabel: labelName [
	^ self makeLabel name: labelName
]

{ #category : #adding }
LowcodeAssembler >> makeLabelHere [
	| label |
	label := self makeLabel.
	self putLabel: label.
	^ label
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc32 [
	self addInstruction: 114
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc64 [
	self addInstruction: 115
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy32 [
	self addInstruction: 116
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy64 [
	self addInstruction: 117
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpyFixed: a1Nsize [
	self addInstruction: 118  extendA: a1Nsize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat32ToPhysical: a1NregisterID [
	self addInstruction: 119  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat64ToPhysical: a1NregisterID [
	self addInstruction: 120  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt32ToPhysical: a1NregisterID [
	self addInstruction: 121  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt64ToPhysical: a1NregisterID [
	self addInstruction: 122  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movePointerToPhysical: a1NregisterID [
	self addInstruction: 123  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul32 [
	self addInstruction: 124
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul64 [
	self addInstruction: 125
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg32 [
	self addInstruction: 126
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg64 [
	self addInstruction: 127
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not32 [
	self addInstruction: 128
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not64 [
	self addInstruction: 129
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopEqual [
	self addInstruction: 2000
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopNotEqual [
	self addInstruction: 2001
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt32 [
	self addInstruction: 1010
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt64 [
	self addInstruction: 1011
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean32 [
	self addInstruction: 1012
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean64 [
	self addInstruction: 1013
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat32 [
	self addInstruction: 1014
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat64 [
	self addInstruction: 1015
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt32 [
	self addInstruction: 1016
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt64 [
	self addInstruction: 1017
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointer [
	self addInstruction: 1018
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointerReinterpret [
	self addInstruction: 1019
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt32 [
	self addInstruction: 1020
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt64 [
	self addInstruction: 1021
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or32 [
	self addInstruction: 130
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or64 [
	self addInstruction: 131
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat32: a1Nfunction [
	self addInstruction: 132  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat64: a1Nfunction [
	self addInstruction: 133  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat32 [
	self addInstruction: 134
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat64 [
	self addInstruction: 135
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt32 [
	self addInstruction: 136
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt64 [
	self addInstruction: 137
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectPointer [
	self addInstruction: 138
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectStructure: a1NstructureSize [
	self addInstruction: 139  extendA: a1NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt32: a1Nfunction [
	self addInstruction: 140  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt64: a1Nfunction [
	self addInstruction: 141  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallPointer: a1Nfunction [
	self addInstruction: 142  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self addInstruction: 143  extendA: a1Nfunction  extendB: a2NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin [
	self addInstruction: 1022
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> plaftormCode [
	self addInstruction: 144
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset32 [
	self addInstruction: 145
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset64 [
	self addInstruction: 146
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerEqual [
	self addInstruction: 147
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerNotEqual [
	self addInstruction: 148
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt32 [
	self addInstruction: 149
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt64 [
	self addInstruction: 150
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOop: a1NpointerClassLiteral [
	self addInstruction: 306  extendA: a1NpointerClassLiteral
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOopReinterprer [
	self addInstruction: 307
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> popAndStoreTemp: index [
	index < 8 ifTrue: [ ^ self popAndStoreTempSmallIndex: index ].
	self popAndStoreTempLargeIndex: index
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> popAndStoreTempSmallIndex: index [
	self addSistaInstruction: 208 | index
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popFloat32 [
	self addInstruction: 151
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popFloat64 [
	self addInstruction: 152
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt32 [
	self addInstruction: 153
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt64 [
	self addInstruction: 154
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popPointer [
	self addInstruction: 155
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt32: a1Nconstant [
	self addInstruction: 156  extendA: a1Nconstant
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt64: a1Nconstant [
	self addInstruction: 157  extendA: a1Nconstant
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushFalse [
	self addSistaInstruction: 78
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushLiteral: index [
	index < 32 ifTrue: [ ^ self pushLiteralSmallIndex: index ].
	^ self pushLiteralLargeIndex: index.
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushLiteralSmallIndex: index [
	self addSistaInstruction: 32 | (index)
]

{ #category : #utilities }
LowcodeAssembler >> pushMyInstanceVariable: aSymbol [
	| selfObj selfClass index |
	selfObj := thisContext sender receiver.
	selfClass := selfObj class.
	index := selfClass instVarIndexFor: aSymbol.
	self pushReceiverVariable: index - 1
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushNil [
	self addSistaInstruction: 79
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushNullPointer [
	self addInstruction: 158
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushOne [
	self addSistaInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne32 [
	self addInstruction: 159
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne64 [
	self addInstruction: 160
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat32 [
	self addInstruction: 161
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat64 [
	self addInstruction: 162
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat32: a1NregisterID [
	self addInstruction: 163  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat64: a1NregisterID [
	self addInstruction: 164  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt32: a1NregisterID [
	self addInstruction: 165  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt64: a1NregisterID [
	self addInstruction: 166  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalPointer: a1NregisterID [
	self addInstruction: 167  extendA: a1NregisterID
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushReceiver [
	self addSistaInstruction: 76
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushReceiverVariable: index [
	index < 16 ifTrue: [ ^ self pushReceiverVariableSmallIndex: index].
	^ self pushReceiverVariableLargeIndex: index
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushReceiverVariableSmallIndex: index [
	self addSistaInstruction: 0 | (index & 15)
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushSessionIdentifier [
	self addInstruction: 168
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushTemp: index [
	index < 16 ifTrue: [ ^ self pushTempSmallIndex: index ].
	index < 20 ifTrue: [ ^ self pushTempSmallIndex2: index ].
	^ self pushTempLargeIndex: index.
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushTempSmallIndex2: index [
	self addSistaInstruction: 72 | (index - 8)
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushTempSmallIndex: index [
	self addSistaInstruction: 64 | index
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushTrue [
	self addSistaInstruction: 77
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushZero [
	self addSistaInstruction: 80
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero32 [
	self addInstruction: 169
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero64 [
	self addInstruction: 170
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat32 [
	self addInstruction: 171
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat64 [
	self addInstruction: 172
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem32 [
	self addInstruction: 173
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem64 [
	self addInstruction: 174
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnFalse [
	self addSistaInstruction: 90
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnNil [
	self addSistaInstruction: 91
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnReceiver [
	self addSistaInstruction: 88
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnTop [
	self addSistaInstruction: 92
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnTrue [
	self addSistaInstruction: 89
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift32 [
	self addInstruction: 175
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift64 [
	self addInstruction: 176
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> sendSpecialMessageClass [
	self addSistaInstruction: 119
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From16 [
	self addInstruction: 177
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From8 [
	self addInstruction: 178
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From16 [
	self addInstruction: 179
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From32 [
	self addInstruction: 180
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From8 [
	self addInstruction: 181
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> smallInt32ToOop [
	self addInstruction: 308
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> stackFrameSize [
	"TODO: Compute the max stack size"
	^ 30
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat32ToMemory [
	self addInstruction: 182
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat64ToMemory [
	self addInstruction: 183
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt16ToMemory [
	self addInstruction: 184
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt32ToMemory [
	self addInstruction: 185
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt64ToMemory [
	self addInstruction: 186
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt8ToMemory [
	self addInstruction: 187
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat32: a1NbaseOffset [
	self addInstruction: 188  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat64: a1NbaseOffset [
	self addInstruction: 189  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt16: a1NbaseOffset [
	self addInstruction: 190  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt32: a1NbaseOffset [
	self addInstruction: 191  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt64: a1NbaseOffset [
	self addInstruction: 192  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt8: a1NbaseOffset [
	self addInstruction: 193  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalPointer: a1NbaseOffset [
	self addInstruction: 194  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectField: a1NfieldIndex [
	self addInstruction: 2002  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectFieldAt [
	self addInstruction: 2003
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storePointerToMemory [
	self addInstruction: 195
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub32 [
	self addInstruction: 196
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub64 [
	self addInstruction: 197
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To16 [
	self addInstruction: 198
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To8 [
	self addInstruction: 199
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To16 [
	self addInstruction: 200
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To32 [
	self addInstruction: 201
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To8 [
	self addInstruction: 202
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv32 [
	self addInstruction: 203
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv64 [
	self addInstruction: 204
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Great [
	self addInstruction: 205
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32GreatEqual [
	self addInstruction: 206
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Less [
	self addInstruction: 207
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32LessEqual [
	self addInstruction: 208
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat32 [
	self addInstruction: 209
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat64 [
	self addInstruction: 210
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToOop [
	self addInstruction: 309
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Great [
	self addInstruction: 211
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64GreatEqual [
	self addInstruction: 212
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Less [
	self addInstruction: 213
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64LessEqual [
	self addInstruction: 214
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat32 [
	self addInstruction: 215
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat64 [
	self addInstruction: 216
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToOop [
	self addInstruction: 310
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul32 [
	self addInstruction: 217
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul64 [
	self addInstruction: 218
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockRegisters [
	self addInstruction: 219
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockVM [
	self addInstruction: 220
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin [
	self addInstruction: 1023
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem32 [
	self addInstruction: 221
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem64 [
	self addInstruction: 222
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor32 [
	self addInstruction: 223
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor64 [
	self addInstruction: 224
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From16 [
	self addInstruction: 225
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From8 [
	self addInstruction: 226
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From16 [
	self addInstruction: 227
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From32 [
	self addInstruction: 228
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From8 [
	self addInstruction: 229
]
