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
	self addInstruction: 2369
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add64 [
	self addInstruction: 2370
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
	self addInstruction: 1307
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca64 [
	self addInstruction: 1308
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
	self addInstruction: 2371
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and64 [
	self addInstruction: 2372
]

{ #category : #'local variables' }
LowcodeAssembler >> argumentCount: count [
	numberOfArguments := count.
	numberOfTemporals := numberOfTemporals + count.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift32 [
	self addInstruction: 2373
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift64 [
	self addInstruction: 2374
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> beginCall: a1Nalignment [
	self addInstruction: 0  extendA: a1Nalignment
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean32ToOop [
	self addInstruction: 1309
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean64ToOop [
	self addInstruction: 1310
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse32: a1Ndest [
	self addInstruction: 1000  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse64: a1Ndest [
	self addInstruction: 1001  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue32: a1Ndest [
	self addInstruction: 1002  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue64: a1Ndest [
	self addInstruction: 1003  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> byteSizeOf [
	self addInstruction: 1311
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat32 [
	self addInstruction: 1004
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat64 [
	self addInstruction: 1005
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt32 [
	self addInstruction: 1006
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt64 [
	self addInstruction: 1007
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentPointer [
	self addInstruction: 1008
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentStructure: a1NstructureSize [
	self addInstruction: 1009  extendA: a1NstructureSize
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
	self addInstruction: 300  extendA: a1NexpectedSession
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compareAndSwap32 [
	self addInstruction: 3305
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
	self addInstruction: 2375
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div64 [
	self addInstruction: 2376
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat32 [
	self addInstruction: 1600
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat64 [
	self addInstruction: 1601
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt32 [
	self addInstruction: 1602
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt64 [
	self addInstruction: 1603
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicatePointer [
	self addInstruction: 1604
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> duplicateStackTop [
	self addSistaInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress32 [
	self addInstruction: 4300
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress64 [
	self addInstruction: 4301
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
		lit isLiteral ifTrue: [ literals at: id put: lit ]
			ifFalse: [ literals at: id put: lit value ]
	].
	
	bytecodes  := ByteArray new: size streamContents: [ :stream |
		streamElements do: [ :el | el emitToStream: stream ]
	].

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
	self addInstruction: 3
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCallNoCleanup [
	self addInstruction: 4
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fail [
	self addInstruction: 5
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> failWithCode: a1NerrorCode [
	self addInstruction: 6  extendA: a1NerrorCode
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstFieldPointer [
	self addInstruction: 1312
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstIndexableFieldPointer [
	self addInstruction: 1313
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Add [
	self addInstruction: 2377
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Div [
	self addInstruction: 2378
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Equal [
	self addInstruction: 2379
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Great [
	self addInstruction: 2380
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32GreatEqual [
	self addInstruction: 2381
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Less [
	self addInstruction: 2382
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32LessEqual [
	self addInstruction: 2383
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Mul [
	self addInstruction: 2384
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32NotEqual [
	self addInstruction: 2385
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Sub [
	self addInstruction: 2386
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToFloat64 [
	self addInstruction: 1314
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt32 [
	self addInstruction: 1315
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt64 [
	self addInstruction: 1316
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToOop [
	self addInstruction: 1317
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt32 [
	self addInstruction: 1318
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToUInt64 [
	self addInstruction: 1319
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Add [
	self addInstruction: 2387
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Div [
	self addInstruction: 2388
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Equal [
	self addInstruction: 2389
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Great [
	self addInstruction: 2390
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64GreatEqual [
	self addInstruction: 2391
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Less [
	self addInstruction: 2392
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64LessEqual [
	self addInstruction: 2393
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Mul [
	self addInstruction: 2394
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64NotEqual [
	self addInstruction: 2395
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Sub [
	self addInstruction: 2396
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToFloat32 [
	self addInstruction: 1320
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt32 [
	self addInstruction: 1321
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt64 [
	self addInstruction: 1322
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToOop [
	self addInstruction: 1323
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt32 [
	self addInstruction: 1324
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToUInt64 [
	self addInstruction: 1325
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> free [
	self addInstruction: 1010
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
	literalTable := OrderedCollection new.
	stackFrameAllocated := 0.
	numberOfTemporals := 0.
	numberOfArguments := 0.
	self localFrameSize: 0.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexable32Oop [
	self addInstruction: 2397
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexableOop: a1NindexableSize [
	self addInstruction: 1326  extendA: a1NindexableSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateOop [
	self addInstruction: 1327
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Equal [
	self addInstruction: 2398
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Great [
	self addInstruction: 2399
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32GreatEqual [
	self addInstruction: 2400
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Less [
	self addInstruction: 2401
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32LessEqual [
	self addInstruction: 2402
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32NotEqual [
	self addInstruction: 2403
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat32 [
	self addInstruction: 1328
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat64 [
	self addInstruction: 1329
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToOop [
	self addInstruction: 1330
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToPointer [
	self addInstruction: 1331
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Equal [
	self addInstruction: 2404
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Great [
	self addInstruction: 2405
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64GreatEqual [
	self addInstruction: 2406
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Less [
	self addInstruction: 2407
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64LessEqual [
	self addInstruction: 2408
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64NotEqual [
	self addInstruction: 2409
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat32 [
	self addInstruction: 1332
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat64 [
	self addInstruction: 1333
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToOop [
	self addInstruction: 1334
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToPointer [
	self addInstruction: 1335
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isBytes [
	self addInstruction: 1336
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isFloatObject [
	self addInstruction: 1337
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIndexable [
	self addInstruction: 1338
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIntegerObject [
	self addInstruction: 1339
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isPointers [
	self addInstruction: 1340
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWords [
	self addInstruction: 1341
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWordsOrBytes [
	self addInstruction: 1342
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jump: a1Ndest [
	self addInstruction: 7  label: a1Ndest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift32 [
	self addInstruction: 2410
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift64 [
	self addInstruction: 2411
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat32FromMemory [
	self addInstruction: 1343
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat64FromMemory [
	self addInstruction: 1344
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt16FromMemory [
	self addInstruction: 1345
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt32FromMemory [
	self addInstruction: 1346
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt64FromMemory [
	self addInstruction: 1347
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt8FromMemory [
	self addInstruction: 1348
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalAddress: a1NbaseOffset [
	self addInstruction: 301  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat32: a1NbaseOffset [
	self addInstruction: 302  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat64: a1NbaseOffset [
	self addInstruction: 303  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt16: a1NbaseOffset [
	self addInstruction: 304  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt32: a1NbaseOffset [
	self addInstruction: 305  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt64: a1NbaseOffset [
	self addInstruction: 306  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt8: a1NbaseOffset [
	self addInstruction: 307  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalPointer: a1NbaseOffset [
	self addInstruction: 308  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt16: a1NbaseOffset [
	self addInstruction: 309  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt32: a1NbaseOffset [
	self addInstruction: 310  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt64: a1NbaseOffset [
	self addInstruction: 311  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt8: a1NbaseOffset [
	self addInstruction: 312  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectAt [
	self addInstruction: 2412
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectField: a1NfieldIndex [
	self addInstruction: 1349  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadPointerFromMemory [
	self addInstruction: 1350
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt16FromMemory [
	self addInstruction: 1351
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt32FromMemory [
	self addInstruction: 1352
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt64FromMemory [
	self addInstruction: 1353
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt8FromMemory [
	self addInstruction: 1354
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> localFrameSize: a1Nsize [
	self addInstruction: 8  extendA: a1Nsize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockRegisters [
	self addInstruction: 9
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockVM [
	self addInstruction: 10
]

{ #category : #adding }
LowcodeAssembler >> makeLabel [
	| label |
	label := LowcodeLabel new.
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
	self addInstruction: 1355
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc64 [
	self addInstruction: 1356
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy32 [
	self addInstruction: 3000
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy64 [
	self addInstruction: 3001
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpyFixed: a1Nsize [
	self addInstruction: 2000  extendA: a1Nsize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat32ToPhysical: a1NregisterID [
	self addInstruction: 1011  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat64ToPhysical: a1NregisterID [
	self addInstruction: 1012  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt32ToPhysical: a1NregisterID [
	self addInstruction: 1013  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt64ToPhysical: a1NregisterID [
	self addInstruction: 1014  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movePointerToPhysical: a1NregisterID [
	self addInstruction: 1015  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul32 [
	self addInstruction: 2413
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul64 [
	self addInstruction: 2414
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg32 [
	self addInstruction: 1357
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg64 [
	self addInstruction: 1358
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not32 [
	self addInstruction: 1359
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not64 [
	self addInstruction: 1360
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopEqual [
	self addInstruction: 2415
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopNotEqual [
	self addInstruction: 2416
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt32 [
	self addInstruction: 1361
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt64 [
	self addInstruction: 1362
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean32 [
	self addInstruction: 1363
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean64 [
	self addInstruction: 1364
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat32 [
	self addInstruction: 1365
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat64 [
	self addInstruction: 1366
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt32 [
	self addInstruction: 1367
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt64 [
	self addInstruction: 1368
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointer [
	self addInstruction: 1369
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointerReinterpret [
	self addInstruction: 1370
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt32 [
	self addInstruction: 1371
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt64 [
	self addInstruction: 1372
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or32 [
	self addInstruction: 2417
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or64 [
	self addInstruction: 2418
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat32: a1Nfunction [
	self addInstruction: 313  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat64: a1Nfunction [
	self addInstruction: 314  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat32 [
	self addInstruction: 1373
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat64 [
	self addInstruction: 1374
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt32 [
	self addInstruction: 1375
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt64 [
	self addInstruction: 1376
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectPointer [
	self addInstruction: 1377
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectStructure: a1NstructureSize [
	self addInstruction: 2419  extendA: a1NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt32: a1Nfunction [
	self addInstruction: 315  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt64: a1Nfunction [
	self addInstruction: 316  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallPointer: a1Nfunction [
	self addInstruction: 317  extendA: a1Nfunction
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self addInstruction: 1378  extendA: a1Nfunction  extendB: a2NstructureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin [
	self addInstruction: 1016
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> plaftormCode [
	self addInstruction: 318
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset32 [
	self addInstruction: 2420
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerAddOffset64 [
	self addInstruction: 2421
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerEqual [
	self addInstruction: 2422
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerNotEqual [
	self addInstruction: 2423
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt32 [
	self addInstruction: 1379
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt64 [
	self addInstruction: 1380
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOop: a1NpointerClassLiteral [
	self addInstruction: 1381  extendA: a1NpointerClassLiteral
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOopReinterprer [
	self addInstruction: 1382
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
	self addInstruction: 1017
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popFloat64 [
	self addInstruction: 1018
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt32 [
	self addInstruction: 1019
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt64 [
	self addInstruction: 1020
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popPointer [
	self addInstruction: 1021
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt32: a1Nconstant [
	self addInstruction: 319  extendA: a1Nconstant
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt64: a1Nconstant [
	self addInstruction: 320  extendA: a1Nconstant
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
	self addInstruction: 321
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushOne [
	self addSistaInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne32 [
	self addInstruction: 322
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne64 [
	self addInstruction: 323
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat32 [
	self addInstruction: 324
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat64 [
	self addInstruction: 325
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat32: a1NregisterID [
	self addInstruction: 326  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat64: a1NregisterID [
	self addInstruction: 327  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt32: a1NregisterID [
	self addInstruction: 328  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt64: a1NregisterID [
	self addInstruction: 329  extendA: a1NregisterID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalPointer: a1NregisterID [
	self addInstruction: 330  extendA: a1NregisterID
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
	self addInstruction: 331
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
	self addInstruction: 332
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero64 [
	self addInstruction: 333
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat32 [
	self addInstruction: 334
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat64 [
	self addInstruction: 335
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem32 [
	self addInstruction: 2424
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem64 [
	self addInstruction: 2425
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
	self addInstruction: 2426
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift64 [
	self addInstruction: 2427
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> sendSpecialMessageClass [
	self addSistaInstruction: 119
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From16 [
	self addInstruction: 1383
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From8 [
	self addInstruction: 1384
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From16 [
	self addInstruction: 1385
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From32 [
	self addInstruction: 1386
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From8 [
	self addInstruction: 1387
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> smallInt32ToOop [
	self addInstruction: 1388
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> stackFrameSize [
	"TODO: Compute the max stack size"
	^ 30
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat32ToMemory [
	self addInstruction: 2001
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat64ToMemory [
	self addInstruction: 2002
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt16ToMemory [
	self addInstruction: 2003
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt32ToMemory [
	self addInstruction: 2004
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt64ToMemory [
	self addInstruction: 2005
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt8ToMemory [
	self addInstruction: 2006
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat32: a1NbaseOffset [
	self addInstruction: 1022  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat64: a1NbaseOffset [
	self addInstruction: 1023  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt16: a1NbaseOffset [
	self addInstruction: 1024  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt32: a1NbaseOffset [
	self addInstruction: 1025  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt64: a1NbaseOffset [
	self addInstruction: 1026  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt8: a1NbaseOffset [
	self addInstruction: 1027  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalPointer: a1NbaseOffset [
	self addInstruction: 1028  extendA: a1NbaseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectField: a1NfieldIndex [
	self addInstruction: 2007  extendA: a1NfieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectFieldAt [
	self addInstruction: 3002
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storePointerToMemory [
	self addInstruction: 2008
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub32 [
	self addInstruction: 2428
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub64 [
	self addInstruction: 2429
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To16 [
	self addInstruction: 1389
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To8 [
	self addInstruction: 1390
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To16 [
	self addInstruction: 1391
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To32 [
	self addInstruction: 1392
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To8 [
	self addInstruction: 1393
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv32 [
	self addInstruction: 2430
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv64 [
	self addInstruction: 2431
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Great [
	self addInstruction: 2432
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32GreatEqual [
	self addInstruction: 2433
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Less [
	self addInstruction: 2434
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32LessEqual [
	self addInstruction: 2435
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat32 [
	self addInstruction: 1394
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat64 [
	self addInstruction: 1395
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToOop [
	self addInstruction: 1396
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Great [
	self addInstruction: 2436
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64GreatEqual [
	self addInstruction: 2437
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Less [
	self addInstruction: 2438
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64LessEqual [
	self addInstruction: 2439
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat32 [
	self addInstruction: 1397
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat64 [
	self addInstruction: 1398
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToOop [
	self addInstruction: 1399
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul32 [
	self addInstruction: 2440
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul64 [
	self addInstruction: 2441
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockRegisters [
	self addInstruction: 11
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockVM [
	self addInstruction: 12
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin [
	self addInstruction: 1029
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem32 [
	self addInstruction: 2442
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem64 [
	self addInstruction: 2443
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor32 [
	self addInstruction: 2444
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor64 [
	self addInstruction: 2445
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From16 [
	self addInstruction: 1400
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From8 [
	self addInstruction: 1401
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From16 [
	self addInstruction: 1402
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From32 [
	self addInstruction: 1403
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From8 [
	self addInstruction: 1404
]
