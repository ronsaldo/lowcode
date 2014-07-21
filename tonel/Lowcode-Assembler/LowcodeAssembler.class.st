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
		'numberOfTemporals'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add32 [
	self addInstruction: 351
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add64 [
	self addInstruction: 360
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
	self addInstruction: 493
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca64 [
	self addInstruction: 494
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
	self addInstruction: 370
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and64 [
	self addInstruction: 377
]

{ #category : #'local variables' }
LowcodeAssembler >> argumentCount: count [
	numberOfTemporals := numberOfTemporals + count
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift32 [
	self addInstruction: 375
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift64 [
	self addInstruction: 382
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> beginCall: a1_alignment [
	self addInstruction: 501  extendA: a1_alignment
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean32ToOop [
	self addInstruction: 410
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> boolean64ToOop [
	self addInstruction: 411
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse32: a1_dest [
	self addInstruction: 471  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchFalse64: a1_dest [
	self addInstruction: 473  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue32: a1_dest [
	self addInstruction: 470  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchTrue64: a1_dest [
	self addInstruction: 472  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> byteSizeOf [
	self addInstruction: 425
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat32 [
	self addInstruction: 506
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat64 [
	self addInstruction: 507
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt32 [
	self addInstruction: 502
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt64 [
	self addInstruction: 503
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentPointer [
	self addInstruction: 504
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentStructure: a1_structureSize [
	self addInstruction: 505  extendA: a1_structureSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callInstruction: a1_function [
	self addInstruction: 534  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callPhysical: a1_registerID [
	self addInstruction: 533  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> checkSessionIdentifier: a1_expectedSession [
	self addInstruction: 278  extendA: a1_expectedSession
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compareAndSwap32 [
	self addInstruction: 492
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
	self addInstruction: 356
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div64 [
	self addInstruction: 365
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat32 [
	self addInstruction: 259
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateFloat64 [
	self addInstruction: 260
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt32 [
	self addInstruction: 256
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicateInt64 [
	self addInstruction: 257
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> duplicatePointer [
	self addInstruction: 258
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> duplicateStackTop [
	self addSistaInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress32 [
	self addInstruction: 281
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress64 [
	self addInstruction: 282
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
		numberOfTemporals: numberOfTemporals.

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
	self addInstruction: 518
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCallNoCleanup [
	self addInstruction: 519
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fail [
	self addInstruction: 488
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> failWithCode: a1_errorCode [
	self addInstruction: 489  extendA: a1_errorCode
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstFieldPointer [
	self addInstruction: 423
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstIndexableFieldPointer [
	self addInstruction: 424
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Add [
	self addInstruction: 383
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Div [
	self addInstruction: 386
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Equal [
	self addInstruction: 457
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Great [
	self addInstruction: 461
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32GreatEqual [
	self addInstruction: 462
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Less [
	self addInstruction: 459
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32LessEqual [
	self addInstruction: 460
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Mul [
	self addInstruction: 385
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32NotEqual [
	self addInstruction: 458
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Sub [
	self addInstruction: 384
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt32 [
	self addInstruction: 343
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt64 [
	self addInstruction: 345
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToOop [
	self addInstruction: 417
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Add [
	self addInstruction: 387
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Div [
	self addInstruction: 390
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Equal [
	self addInstruction: 463
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Great [
	self addInstruction: 467
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64GreatEqual [
	self addInstruction: 468
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Less [
	self addInstruction: 465
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64LessEqual [
	self addInstruction: 466
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Mul [
	self addInstruction: 389
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64NotEqual [
	self addInstruction: 464
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Sub [
	self addInstruction: 388
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt32 [
	self addInstruction: 344
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt64 [
	self addInstruction: 346
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToOop [
	self addInstruction: 418
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> free [
	self addInstruction: 497
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
	literalTable := OrderedCollection new.
	stackFrameAllocated := 0.
	numberOfTemporals := 0.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexable32Oop [
	self addInstruction: 399
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateIndexableOop: a1_indexableSize [
	self addInstruction: 398  extendA: a1_indexableSize
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> instantiateOop [
	self addInstruction: 397
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Equal [
	self addInstruction: 437
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Great [
	self addInstruction: 441
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32GreatEqual [
	self addInstruction: 442
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32Less [
	self addInstruction: 439
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32LessEqual [
	self addInstruction: 440
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32NotEqual [
	self addInstruction: 438
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat32 [
	self addInstruction: 337
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat64 [
	self addInstruction: 338
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToOop [
	self addInstruction: 413
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToPointer [
	self addInstruction: 349
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Equal [
	self addInstruction: 447
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Great [
	self addInstruction: 451
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64GreatEqual [
	self addInstruction: 452
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64Less [
	self addInstruction: 449
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64LessEqual [
	self addInstruction: 450
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64NotEqual [
	self addInstruction: 448
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat32 [
	self addInstruction: 341
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat64 [
	self addInstruction: 342
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToOop [
	self addInstruction: 415
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToPointer [
	self addInstruction: 350
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isBytes [
	self addInstruction: 426
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isFloatObject [
	self addInstruction: 427
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIndexable [
	self addInstruction: 428
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isIntegerObject [
	self addInstruction: 429
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isPointers [
	self addInstruction: 432
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWords [
	self addInstruction: 430
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> isWordsOrBytes [
	self addInstruction: 431
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jump: a1_dest [
	self addInstruction: 469  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift32 [
	self addInstruction: 373
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift64 [
	self addInstruction: 380
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat32FromMemory [
	self addInstruction: 292
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat64FromMemory [
	self addInstruction: 293
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt16FromMemory [
	self addInstruction: 288
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt32FromMemory [
	self addInstruction: 289
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt64FromMemory [
	self addInstruction: 290
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt8FromMemory [
	self addInstruction: 287
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalAddress: a1_baseOffset [
	self addInstruction: 301  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat32: a1_baseOffset [
	self addInstruction: 311  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat64: a1_baseOffset [
	self addInstruction: 312  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt16: a1_baseOffset [
	self addInstruction: 307  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt32: a1_baseOffset [
	self addInstruction: 308  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt64: a1_baseOffset [
	self addInstruction: 309  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt8: a1_baseOffset [
	self addInstruction: 306  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalPointer: a1_baseOffset [
	self addInstruction: 310  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt16: a1_baseOffset [
	self addInstruction: 303  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt32: a1_baseOffset [
	self addInstruction: 304  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt64: a1_baseOffset [
	self addInstruction: 305  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt8: a1_baseOffset [
	self addInstruction: 302  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectAt [
	self addInstruction: 421
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadObjectField: a1_fieldIndex [
	self addInstruction: 419  extendA: a1_fieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadPointerFromMemory [
	self addInstruction: 291
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt16FromMemory [
	self addInstruction: 284
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt32FromMemory [
	self addInstruction: 285
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt64FromMemory [
	self addInstruction: 286
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt8FromMemory [
	self addInstruction: 283
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockRegisters [
	self addInstruction: 521
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockVM [
	self addInstruction: 490
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
	self addInstruction: 495
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc64 [
	self addInstruction: 496
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy32 [
	self addInstruction: 499
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpy64 [
	self addInstruction: 500
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> memcpyFixed: a1_size [
	self addInstruction: 498  extendA: a1_size
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat32ToPhysical: a1_registerID [
	self addInstruction: 526  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat64ToPhysical: a1_registerID [
	self addInstruction: 527  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt32ToPhysical: a1_registerID [
	self addInstruction: 523  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt64ToPhysical: a1_registerID [
	self addInstruction: 524  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movePointerToPhysical: a1_registerID [
	self addInstruction: 525  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul32 [
	self addInstruction: 354
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul64 [
	self addInstruction: 363
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg32 [
	self addInstruction: 353
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> neg64 [
	self addInstruction: 362
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not32 [
	self addInstruction: 369
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not64 [
	self addInstruction: 376
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopEqual [
	self addInstruction: 435
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopNotEqual [
	self addInstruction: 436
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt32 [
	self addInstruction: 402
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt64 [
	self addInstruction: 405
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean32 [
	self addInstruction: 400
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean64 [
	self addInstruction: 401
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat32 [
	self addInstruction: 408
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat64 [
	self addInstruction: 409
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt32 [
	self addInstruction: 403
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt64 [
	self addInstruction: 406
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointer [
	self addInstruction: 393
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointerReinterpret [
	self addInstruction: 394
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt32 [
	self addInstruction: 404
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt64 [
	self addInstruction: 407
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or32 [
	self addInstruction: 371
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or64 [
	self addInstruction: 378
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat32: a1_function [
	self addInstruction: 511  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat64: a1_function [
	self addInstruction: 512  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat32 [
	self addInstruction: 516
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat64 [
	self addInstruction: 517
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt32 [
	self addInstruction: 513
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt64 [
	self addInstruction: 514
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectPointer [
	self addInstruction: 515
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt32: a1_function [
	self addInstruction: 508  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt64: a1_function [
	self addInstruction: 509  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallPointer: a1_function [
	self addInstruction: 510  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin [
	self addInstruction: 391
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> plaftormCode [
	self addInstruction: 520
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerEqual [
	self addInstruction: 433
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerNotEqual [
	self addInstruction: 434
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerOffset32 [
	self addInstruction: 279
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerOffset64 [
	self addInstruction: 280
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt32 [
	self addInstruction: 347
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToInt64 [
	self addInstruction: 348
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOop: a1_pointerClassLiteral [
	self addInstruction: 395  extendA: a1_pointerClassLiteral
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOopReinterprer [
	self addInstruction: 396
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
	self addInstruction: 264
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popFloat64 [
	self addInstruction: 265
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt32 [
	self addInstruction: 261
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popInt64 [
	self addInstruction: 262
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popPointer [
	self addInstruction: 263
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt32: a1_constant [
	self addInstruction: 270  extendA: a1_constant
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushConstantUInt64: a1_constant [
	self addInstruction: 271  extendA: a1_constant
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
	self addInstruction: 276
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushOne [
	self addSistaInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne32 [
	self addInstruction: 267
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne64 [
	self addInstruction: 269
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat32 [
	self addInstruction: 273
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat64 [
	self addInstruction: 275
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat32: a1_registerID [
	self addInstruction: 531  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat64: a1_registerID [
	self addInstruction: 532  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt32: a1_registerID [
	self addInstruction: 528  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt64: a1_registerID [
	self addInstruction: 529  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalPointer: a1_registerID [
	self addInstruction: 530  extendA: a1_registerID
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
	self addInstruction: 277
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
	self addInstruction: 266
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero64 [
	self addInstruction: 268
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat32 [
	self addInstruction: 272
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat64 [
	self addInstruction: 274
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem32 [
	self addInstruction: 358
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem64 [
	self addInstruction: 367
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnBoolean32AsOop [
	self addInstruction: 479
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnBoolean64AsOop [
	self addInstruction: 480
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnFalse [
	self addSistaInstruction: 90
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnFloat32AsOop [
	self addInstruction: 486
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnFloat64AsOop [
	self addInstruction: 487
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnInt32AsOop [
	self addInstruction: 481
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnInt64AsOop [
	self addInstruction: 482
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnNil [
	self addSistaInstruction: 91
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnPointerAsOop: a1_pointerClassLiteral [
	self addInstruction: 485  extendA: a1_pointerClassLiteral
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnReceiver [
	self addSistaInstruction: 88
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnSmallInteger [
	self addInstruction: 478
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
LowcodeAssembler >> returnUInt32AsOop [
	self addInstruction: 483
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnUInt64AsOop [
	self addInstruction: 484
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift32 [
	self addInstruction: 374
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift64 [
	self addInstruction: 381
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> sendSpecialMessageClass [
	self addSistaInstruction: 119
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From16 [
	self addInstruction: 321
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From8 [
	self addInstruction: 320
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From16 [
	self addInstruction: 323
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From32 [
	self addInstruction: 324
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From8 [
	self addInstruction: 322
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> smallInt32ToOop [
	self addInstruction: 412
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat32ToMemory [
	self addInstruction: 299
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat64ToMemory [
	self addInstruction: 300
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt16ToMemory [
	self addInstruction: 295
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt32ToMemory [
	self addInstruction: 296
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt64ToMemory [
	self addInstruction: 297
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt8ToMemory [
	self addInstruction: 294
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat32: a1_baseOffset [
	self addInstruction: 318  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat64: a1_baseOffset [
	self addInstruction: 319  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt16: a1_baseOffset [
	self addInstruction: 314  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt32: a1_baseOffset [
	self addInstruction: 315  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt64: a1_baseOffset [
	self addInstruction: 316  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt8: a1_baseOffset [
	self addInstruction: 313  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalPointer: a1_baseOffset [
	self addInstruction: 317  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectField: a1_fieldIndex [
	self addInstruction: 420  extendA: a1_fieldIndex
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeObjectFieldAt [
	self addInstruction: 422
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storePointerToMemory [
	self addInstruction: 298
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub32 [
	self addInstruction: 352
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub64 [
	self addInstruction: 361
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To16 [
	self addInstruction: 331
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To8 [
	self addInstruction: 330
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To16 [
	self addInstruction: 333
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To32 [
	self addInstruction: 334
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To8 [
	self addInstruction: 332
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv32 [
	self addInstruction: 357
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv64 [
	self addInstruction: 366
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Great [
	self addInstruction: 445
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32GreatEqual [
	self addInstruction: 446
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32Less [
	self addInstruction: 443
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32LessEqual [
	self addInstruction: 444
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat32 [
	self addInstruction: 335
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat64 [
	self addInstruction: 336
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToOop [
	self addInstruction: 414
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Great [
	self addInstruction: 455
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64GreatEqual [
	self addInstruction: 456
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64Less [
	self addInstruction: 453
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64LessEqual [
	self addInstruction: 454
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat32 [
	self addInstruction: 339
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat64 [
	self addInstruction: 340
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToOop [
	self addInstruction: 416
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul32 [
	self addInstruction: 355
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul64 [
	self addInstruction: 364
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockRegisters [
	self addInstruction: 522
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockVM [
	self addInstruction: 491
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin [
	self addInstruction: 392
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem32 [
	self addInstruction: 359
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem64 [
	self addInstruction: 368
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor32 [
	self addInstruction: 372
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor64 [
	self addInstruction: 379
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From16 [
	self addInstruction: 326
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From8 [
	self addInstruction: 325
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From16 [
	self addInstruction: 328
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From32 [
	self addInstruction: 329
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From8 [
	self addInstruction: 327
]
