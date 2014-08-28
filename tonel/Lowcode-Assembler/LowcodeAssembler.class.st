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
		'numberOfArguments'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'as yet unclassified' }
LowcodeAssembler class >> compiledMethodCode: aBlock [
	^ self compiledMethodFor: #UndefinedMethod class: UndefinedObject code: aBlock
]

{ #category : #'as yet unclassified' }
LowcodeAssembler class >> compiledMethodFor: aSelector class: aClass code: aBlock [
	| asm |
	asm := self new.
	aBlock value: asm.
	asm addLiteral: aSelector;
		addLiteral: aClass.
	 ^ asm emit asCompiledMethod
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add32 [
	self addInstruction: 2069
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add64 [
	self addInstruction: 2070
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
	self addInstruction: 1007
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca64 [
	self addInstruction: 1008
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
	self addInstruction: 2071
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and64 [
	self addInstruction: 2072
]

{ #category : #'local variables' }
LowcodeAssembler >> argumentCount: count [
	numberOfArguments := count.
	numberOfTemporals := numberOfTemporals + count.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift32 [
	self addInstruction: 2073
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift64 [
	self addInstruction: 2074
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> beginCall: a1Nalignment [
	self addInstruction: 0  extendA: a1Nalignment
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean32ToOop [
	self addInstruction: 1009
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean64ToOop [
	self addInstruction: 1010
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse32: a1Ndest [
	self addInstruction: 1011  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse64: a1Ndest [
	self addInstruction: 1012  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue32: a1Ndest [
	self addInstruction: 1013  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue64: a1Ndest [
	self addInstruction: 1014  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> byteSizeOf [
	self addInstruction: 1015
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat32 [
	self addInstruction: 1016
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat64 [
	self addInstruction: 1017
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt32 [
	self addInstruction: 1018
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt64 [
	self addInstruction: 1019
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentPointer [
	self addInstruction: 1020
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentStructure: a1NstructureSize [
	self addInstruction: 1021  extendA: a1NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callInstruction: a1Nfunction [
	self addInstruction: 1  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callPhysical: a1NregisterID [
	self addInstruction: 2  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> checkSessionIdentifier: a1NexpectedSession [
	self addInstruction: 3  extendA: a1NexpectedSession
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compareAndSwap32 [
	self addInstruction: 3005
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
	self addInstruction: 2075
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div64 [
	self addInstruction: 2076
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat32 [
	self addInstruction: 1022
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat64 [
	self addInstruction: 1023
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt32 [
	self addInstruction: 1024
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt64 [
	self addInstruction: 1025
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicatePointer [
	self addInstruction: 1026
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> duplicateStackTop [
	self addSistaInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress32 [
	self addInstruction: 4000
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress64 [
	self addInstruction: 4001
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emit [
	| size literals instructions|
	size := self computeSizes.
	literals := Array new: literalTable size.
	literalTable doWithIndex: [ :lit :id |
		lit isLiteral ifTrue: [ literals at: id put: lit ]
			ifFalse: [ literals at: id put: lit value ]
	].
	
	instructions := ByteArray new: size streamContents: [ :stream |
		streamElements do: [ :el | el emitToStream: stream ]
	].

	^ LowcodeAssembledMethod new
		literals: literals;
		instructions: instructions;
		stackFrameSize: stackFrameAllocated;
		numberOfTemporals: numberOfTemporals;
		numberOfArguments: numberOfArguments.
]

{ #category : #utilities }
LowcodeAssembler >> emitSessionCheck [
	| rest |
	rest := self makeLabel.
		
	self checkSessionIdentifier: Lowcode uniqueSessionIdentifier;
		branchTrue32: rest;
		failWithCode: LowcodeConstants errorSessionChanged;
		putLabel: rest
		
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCall [
	self addInstruction: 4
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCallNoCleanup [
	self addInstruction: 5
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fail [
	self addInstruction: 6
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> failWithCode: a1NerrorCode [
	self addInstruction: 7  extendA: a1NerrorCode
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstFieldPointer [
	self addInstruction: 1027
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstIndexableFieldPointer [
	self addInstruction: 1028
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Add [
	self addInstruction: 2077
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Div [
	self addInstruction: 2078
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Equal [
	self addInstruction: 2079
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Great [
	self addInstruction: 2080
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32GreatEqual [
	self addInstruction: 2081
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Less [
	self addInstruction: 2082
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32LessEqual [
	self addInstruction: 2083
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Mul [
	self addInstruction: 2084
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32NotEqual [
	self addInstruction: 2085
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Sub [
	self addInstruction: 2086
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToFloat64 [
	self addInstruction: 1029
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt32 [
	self addInstruction: 1030
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt64 [
	self addInstruction: 1031
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToOop [
	self addInstruction: 1032
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt32 [
	self addInstruction: 1033
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt64 [
	self addInstruction: 1034
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Add [
	self addInstruction: 2087
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Div [
	self addInstruction: 2088
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Equal [
	self addInstruction: 2089
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Great [
	self addInstruction: 2090
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64GreatEqual [
	self addInstruction: 2091
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Less [
	self addInstruction: 2092
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64LessEqual [
	self addInstruction: 2093
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Mul [
	self addInstruction: 2094
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64NotEqual [
	self addInstruction: 2095
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Sub [
	self addInstruction: 2096
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToFloat32 [
	self addInstruction: 1035
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt32 [
	self addInstruction: 1036
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt64 [
	self addInstruction: 1037
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToOop [
	self addInstruction: 1038
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt32 [
	self addInstruction: 1039
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt64 [
	self addInstruction: 1040
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> free [
	self addInstruction: 1041
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
	literalTable := OrderedCollection new.
	stackFrameAllocated := 0.
	numberOfTemporals := 0.
	numberOfArguments := 0.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexable32Oop [
	self addInstruction: 2097
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexableOop: a1NindexableSize [
	self addInstruction: 1042  extendA: a1NindexableSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateOop [
	self addInstruction: 1043
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Equal [
	self addInstruction: 2098
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Great [
	self addInstruction: 2099
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32GreatEqual [
	self addInstruction: 2100
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Less [
	self addInstruction: 2101
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32LessEqual [
	self addInstruction: 2102
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32NotEqual [
	self addInstruction: 2103
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat32 [
	self addInstruction: 1044
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat64 [
	self addInstruction: 1045
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToOop [
	self addInstruction: 1046
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToPointer [
	self addInstruction: 1047
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Equal [
	self addInstruction: 2104
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Great [
	self addInstruction: 2105
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64GreatEqual [
	self addInstruction: 2106
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Less [
	self addInstruction: 2107
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64LessEqual [
	self addInstruction: 2108
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64NotEqual [
	self addInstruction: 2109
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat32 [
	self addInstruction: 1048
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat64 [
	self addInstruction: 1049
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToOop [
	self addInstruction: 1050
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToPointer [
	self addInstruction: 1051
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isBytes [
	self addInstruction: 1052
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isFloatObject [
	self addInstruction: 1053
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIndexable [
	self addInstruction: 1054
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIntegerObject [
	self addInstruction: 1055
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isPointers [
	self addInstruction: 1056
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWords [
	self addInstruction: 1057
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWordsOrBytes [
	self addInstruction: 1058
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jump: a1Ndest [
	self addInstruction: 8  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift32 [
	self addInstruction: 2110
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift64 [
	self addInstruction: 2111
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat32FromMemory [
	self addInstruction: 1059
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat64FromMemory [
	self addInstruction: 1060
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt16FromMemory [
	self addInstruction: 1061
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt32FromMemory [
	self addInstruction: 1062
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt64FromMemory [
	self addInstruction: 1063
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt8FromMemory [
	self addInstruction: 1064
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalAddress: a1NbaseOffset [
	self addInstruction: 9  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat32: a1NbaseOffset [
	self addInstruction: 10  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat64: a1NbaseOffset [
	self addInstruction: 11  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt16: a1NbaseOffset [
	self addInstruction: 12  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt32: a1NbaseOffset [
	self addInstruction: 13  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt64: a1NbaseOffset [
	self addInstruction: 14  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt8: a1NbaseOffset [
	self addInstruction: 15  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalPointer: a1NbaseOffset [
	self addInstruction: 16  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt16: a1NbaseOffset [
	self addInstruction: 17  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt32: a1NbaseOffset [
	self addInstruction: 18  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt64: a1NbaseOffset [
	self addInstruction: 19  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt8: a1NbaseOffset [
	self addInstruction: 20  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectAt [
	self addInstruction: 2112
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectField: a1NfieldIndex [
	self addInstruction: 1065  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadPointerFromMemory [
	self addInstruction: 1066
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt16FromMemory [
	self addInstruction: 1067
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt32FromMemory [
	self addInstruction: 1068
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt64FromMemory [
	self addInstruction: 1069
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt8FromMemory [
	self addInstruction: 1070
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockRegisters [
	self addInstruction: 21
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockVM [
	self addInstruction: 22
]

{ #category : #adding }
LowcodeAssembler >> makeLabel [
	| label |
	label := LowcodeLabel new.
	label index: literalTable size.
	literalTable add: label.
	^ label
]

{ #category : #adding }
LowcodeAssembler >> makeLabel: labeName [
	^ self makeLabel
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
	self addInstruction: 1071
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc64 [
	self addInstruction: 1072
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy32 [
	self addInstruction: 3006
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy64 [
	self addInstruction: 3007
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpyFixed: a1Nsize [
	self addInstruction: 2113  extendA: a1Nsize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat32ToPhysical: a1NregisterID [
	self addInstruction: 1073  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat64ToPhysical: a1NregisterID [
	self addInstruction: 1074  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt32ToPhysical: a1NregisterID [
	self addInstruction: 1075  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt64ToPhysical: a1NregisterID [
	self addInstruction: 1076  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movePointerToPhysical: a1NregisterID [
	self addInstruction: 1077  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul32 [
	self addInstruction: 2114
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul64 [
	self addInstruction: 2115
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg32 [
	self addInstruction: 1078
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg64 [
	self addInstruction: 1079
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not32 [
	self addInstruction: 1080
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not64 [
	self addInstruction: 1081
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopEqual [
	self addInstruction: 2116
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopNotEqual [
	self addInstruction: 2117
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt32 [
	self addInstruction: 1082
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt64 [
	self addInstruction: 1083
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean32 [
	self addInstruction: 1084
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean64 [
	self addInstruction: 1085
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat32 [
	self addInstruction: 1086
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat64 [
	self addInstruction: 1087
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt32 [
	self addInstruction: 1088
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt64 [
	self addInstruction: 1089
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointer [
	self addInstruction: 1090
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointerReinterpret [
	self addInstruction: 1091
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt32 [
	self addInstruction: 1092
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt64 [
	self addInstruction: 1093
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or32 [
	self addInstruction: 2118
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or64 [
	self addInstruction: 2119
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat32: a1Nfunction [
	self addInstruction: 23  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat64: a1Nfunction [
	self addInstruction: 24  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat32 [
	self addInstruction: 1094
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat64 [
	self addInstruction: 1095
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt32 [
	self addInstruction: 1096
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt64 [
	self addInstruction: 1097
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectPointer [
	self addInstruction: 1098
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectStructure: a1NstructureSize [
	self addInstruction: 2120  extendA: a1NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt32: a1Nfunction [
	self addInstruction: 25  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt64: a1Nfunction [
	self addInstruction: 26  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallPointer: a1Nfunction [
	self addInstruction: 27  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self addInstruction: 1099  extendA: a1Nfunction  extendB: a2NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin [
	self addInstruction: 1100
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> plaftormCode [
	self addInstruction: 28
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset32 [
	self addInstruction: 2121
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset64 [
	self addInstruction: 2122
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerEqual [
	self addInstruction: 2123
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerNotEqual [
	self addInstruction: 2124
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt32 [
	self addInstruction: 1101
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt64 [
	self addInstruction: 1102
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOop: a1NpointerClassLiteral [
	self addInstruction: 1103  extendA: a1NpointerClassLiteral
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOopReinterprer [
	self addInstruction: 1104
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
	self addInstruction: 1105
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popFloat64 [
	self addInstruction: 1106
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt32 [
	self addInstruction: 1107
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt64 [
	self addInstruction: 1108
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popPointer [
	self addInstruction: 1109
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt32: a1Nconstant [
	self addInstruction: 29  extendA: a1Nconstant
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt64: a1Nconstant [
	self addInstruction: 30  extendA: a1Nconstant
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
	self addInstruction: 31
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushOne [
	self addSistaInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne32 [
	self addInstruction: 32
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne64 [
	self addInstruction: 33
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat32 [
	self addInstruction: 34
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat64 [
	self addInstruction: 35
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat32: a1NregisterID [
	self addInstruction: 36  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat64: a1NregisterID [
	self addInstruction: 37  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt32: a1NregisterID [
	self addInstruction: 38  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt64: a1NregisterID [
	self addInstruction: 39  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalPointer: a1NregisterID [
	self addInstruction: 40  extendA: a1NregisterID
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
	self addInstruction: 41
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
	self addInstruction: 42
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero64 [
	self addInstruction: 43
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat32 [
	self addInstruction: 44
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat64 [
	self addInstruction: 45
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem32 [
	self addInstruction: 2125
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem64 [
	self addInstruction: 2126
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
	self addInstruction: 2127
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift64 [
	self addInstruction: 2128
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> sendSpecialMessageClass [
	self addSistaInstruction: 119
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From16 [
	self addInstruction: 1110
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From8 [
	self addInstruction: 1111
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From16 [
	self addInstruction: 1112
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From32 [
	self addInstruction: 1113
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From8 [
	self addInstruction: 1114
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> smallInt32ToOop [
	self addInstruction: 1115
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat32ToMemory [
	self addInstruction: 2129
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat64ToMemory [
	self addInstruction: 2130
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt16ToMemory [
	self addInstruction: 2131
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt32ToMemory [
	self addInstruction: 2132
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt64ToMemory [
	self addInstruction: 2133
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt8ToMemory [
	self addInstruction: 2134
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat32: a1NbaseOffset [
	self addInstruction: 1116  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat64: a1NbaseOffset [
	self addInstruction: 1117  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt16: a1NbaseOffset [
	self addInstruction: 1118  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt32: a1NbaseOffset [
	self addInstruction: 1119  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt64: a1NbaseOffset [
	self addInstruction: 1120  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt8: a1NbaseOffset [
	self addInstruction: 1121  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalPointer: a1NbaseOffset [
	self addInstruction: 1122  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectField: a1NfieldIndex [
	self addInstruction: 2135  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectFieldAt [
	self addInstruction: 3008
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storePointerToMemory [
	self addInstruction: 2136
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub32 [
	self addInstruction: 2137
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub64 [
	self addInstruction: 2138
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To16 [
	self addInstruction: 1123
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To8 [
	self addInstruction: 1124
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To16 [
	self addInstruction: 1125
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To32 [
	self addInstruction: 1126
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To8 [
	self addInstruction: 1127
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv32 [
	self addInstruction: 2139
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv64 [
	self addInstruction: 2140
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Great [
	self addInstruction: 2141
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32GreatEqual [
	self addInstruction: 2142
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Less [
	self addInstruction: 2143
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32LessEqual [
	self addInstruction: 2144
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat32 [
	self addInstruction: 1128
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat64 [
	self addInstruction: 1129
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToOop [
	self addInstruction: 1130
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Great [
	self addInstruction: 2145
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64GreatEqual [
	self addInstruction: 2146
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Less [
	self addInstruction: 2147
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64LessEqual [
	self addInstruction: 2148
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat32 [
	self addInstruction: 1131
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat64 [
	self addInstruction: 1132
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToOop [
	self addInstruction: 1133
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul32 [
	self addInstruction: 2149
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul64 [
	self addInstruction: 2150
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockRegisters [
	self addInstruction: 46
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockVM [
	self addInstruction: 47
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin [
	self addInstruction: 1134
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem32 [
	self addInstruction: 2151
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem64 [
	self addInstruction: 2152
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor32 [
	self addInstruction: 2153
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor64 [
	self addInstruction: 2154
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From16 [
	self addInstruction: 1135
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From8 [
	self addInstruction: 1136
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From16 [
	self addInstruction: 1137
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From32 [
	self addInstruction: 1138
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From8 [
	self addInstruction: 1139
]
