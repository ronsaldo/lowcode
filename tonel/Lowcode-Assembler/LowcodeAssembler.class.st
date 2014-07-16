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
	self addInstruction: 331
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add64 [
	self addInstruction: 339
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
	self addInstruction: 426
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca64 [
	self addInstruction: 427
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
	ret := numberOfTemporals
	numberOfTemporals + 1.
	^ ret
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and32 [
	self addInstruction: 348
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and64 [
	self addInstruction: 355
]

{ #category : #'local variables' }
LowcodeAssembler >> argumentCount: count [
	numberOfTemporals := numberOfTemporals + count
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift32 [
	self addInstruction: 353
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> arithmeticRightShift64 [
	self addInstruction: 360
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> beginCall: a1_alignment [
	self addInstruction: 431  extendA: a1_alignment
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> booleanToOop32 [
	self addInstruction: 383
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchEqual: a1_dest [
	self addInstruction: 400  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchGreatEqual: a1_dest [
	self addInstruction: 405  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchGreater: a1_dest [
	self addInstruction: 404  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchLess: a1_dest [
	self addInstruction: 402  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchLessEqual: a1_dest [
	self addInstruction: 403  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchNotEqual: a1_dest [
	self addInstruction: 401  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchNotOverflow: a1_dest [
	self addInstruction: 411  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchOverflow: a1_dest [
	self addInstruction: 410  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchPrimitiveFailed: a1_dest [
	self addInstruction: 412  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchPrimitiveSucceed: a1_dest [
	self addInstruction: 413  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchUnsignedGreatEqual: a1_dest [
	self addInstruction: 409  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchUnsignedGreater: a1_dest [
	self addInstruction: 408  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchUnsignedLess: a1_dest [
	self addInstruction: 406  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> branchUnsignedLessEqual: a1_dest [
	self addInstruction: 407  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat32 [
	self addInstruction: 435
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentFloat64 [
	self addInstruction: 436
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt32 [
	self addInstruction: 432
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentInt64 [
	self addInstruction: 433
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callArgumentPointer [
	self addInstruction: 434
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callInstruction: a1_function [
	self addInstruction: 463  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callPhysical: a1_registerID [
	self addInstruction: 462  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compare32 [
	self addInstruction: 393
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compare64 [
	self addInstruction: 394
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> compareAndSwap32 [
	self addInstruction: 425
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
	self addInstruction: 335
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div64 [
	self addInstruction: 343
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> duplicateStackTop [
	self addSistaInstruction: 83
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress32 [
	self addInstruction: 266
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> effectiveAddress64 [
	self addInstruction: 267
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emit [
	| size literals instructions|
	size := self computeSizes.
	literals := Array new: literalTable size.
	literalTable doWithIndex: [ :lit :id |
		lit isLiteral ifTrue: [ literals at: id put: lit ]
			ifFalse: [ literals at: id put: lit asLiteral ]
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

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCall [
	self addInstruction: 447
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> endCallNoCleanup [
	self addInstruction: 448
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstFieldPtr [
	self addInstruction: 391
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> firstIndexPtr [
	self addInstruction: 392
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Add [
	self addInstruction: 361
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Compare [
	self addInstruction: 395
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Div [
	self addInstruction: 364
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Mul [
	self addInstruction: 363
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32Sub [
	self addInstruction: 362
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt32 [
	self addInstruction: 327
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToInt64 [
	self addInstruction: 329
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float32ToOop [
	self addInstruction: 389
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Add [
	self addInstruction: 365
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Compare [
	self addInstruction: 396
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Div [
	self addInstruction: 368
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Mul [
	self addInstruction: 367
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64Sub [
	self addInstruction: 366
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt32 [
	self addInstruction: 328
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToInt64 [
	self addInstruction: 330
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> float64ToOop [
	self addInstruction: 390
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> free [
	self addInstruction: 430
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
	literalTable := OrderedCollection new.
	stackFrameAllocated := 0.
	numberOfTemporals := 0.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat32 [
	self addInstruction: 321
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToFloat64 [
	self addInstruction: 322
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int32ToOop [
	self addInstruction: 385
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat32 [
	self addInstruction: 325
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToFloat64 [
	self addInstruction: 326
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int64ToOop [
	self addInstruction: 387
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jump: a1_dest [
	self addInstruction: 399  label: a1_dest
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift32 [
	self addInstruction: 351
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> leftShift64 [
	self addInstruction: 358
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat32FromMemory [
	self addInstruction: 277
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadFloat64FromMemory [
	self addInstruction: 278
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt16FromMemory [
	self addInstruction: 273
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt32FromMemory [
	self addInstruction: 274
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt64FromMemory [
	self addInstruction: 275
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadInt8FromMemory [
	self addInstruction: 272
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat32: a1_baseOffset [
	self addInstruction: 295  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalFloat64: a1_baseOffset [
	self addInstruction: 296  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt16: a1_baseOffset [
	self addInstruction: 291  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt32: a1_baseOffset [
	self addInstruction: 292  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt64: a1_baseOffset [
	self addInstruction: 293  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalInt8: a1_baseOffset [
	self addInstruction: 290  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalPointer: a1_baseOffset [
	self addInstruction: 294  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt16: a1_baseOffset [
	self addInstruction: 287  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt32: a1_baseOffset [
	self addInstruction: 288  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt64: a1_baseOffset [
	self addInstruction: 289  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadLocalUInt8: a1_baseOffset [
	self addInstruction: 286  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadPointerFromMemory [
	self addInstruction: 276
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt16FromMemory [
	self addInstruction: 269
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt32FromMemory [
	self addInstruction: 270
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt64FromMemory [
	self addInstruction: 271
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> loadUInt8FromMemory [
	self addInstruction: 268
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockRegisters [
	self addInstruction: 450
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockVM [
	self addInstruction: 423
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
LowcodeAssembler >> makeLabelHere [
	| label |
	label := self makeLabel.
	self putLabel: label.
	^ label
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc32 [
	self addInstruction: 428
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> malloc64 [
	self addInstruction: 429
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat32ToPhysical: a1_registerID [
	self addInstruction: 455  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveFloat64ToPhysical: a1_registerID [
	self addInstruction: 456  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt32ToPhysical: a1_registerID [
	self addInstruction: 452  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> moveInt64ToPhysical: a1_registerID [
	self addInstruction: 453  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movePointerToPhysical: a1_registerID [
	self addInstruction: 454  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul32 [
	self addInstruction: 333
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul64 [
	self addInstruction: 341
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not32 [
	self addInstruction: 347
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not64 [
	self addInstruction: 354
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntToInt32 [
	self addInstruction: 375
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopSmallIntegerToInt64 [
	self addInstruction: 378
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToBoolean [
	self addInstruction: 374
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat32 [
	self addInstruction: 381
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToFloat64 [
	self addInstruction: 382
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt32 [
	self addInstruction: 376
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToInt64 [
	self addInstruction: 379
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointer [
	self addInstruction: 371
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToPointerReinterpret [
	self addInstruction: 372
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt32 [
	self addInstruction: 377
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oopToUInt64 [
	self addInstruction: 380
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or32 [
	self addInstruction: 349
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or64 [
	self addInstruction: 356
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat32: a1_function [
	self addInstruction: 440  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallFloat64: a1_function [
	self addInstruction: 441  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat32 [
	self addInstruction: 445
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectFloat64 [
	self addInstruction: 446
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt32 [
	self addInstruction: 442
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectInt64 [
	self addInstruction: 443
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallIndirectPointer [
	self addInstruction: 444
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt32: a1_function [
	self addInstruction: 437  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallInt64: a1_function [
	self addInstruction: 438  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> performCallPointer: a1_function [
	self addInstruction: 439  extendA: a1_function
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin [
	self addInstruction: 369
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> plaftormCode [
	self addInstruction: 449
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerOffset32 [
	self addInstruction: 264
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerOffset64 [
	self addInstruction: 265
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pointerToOopReinterprer [
	self addInstruction: 373
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushFalse [
	self addSistaInstruction: 78
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

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> pushOne [
	self addSistaInstruction: 81
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne32 [
	self addInstruction: 257
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOne64 [
	self addInstruction: 259
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat32 [
	self addInstruction: 261
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushOneFloat64 [
	self addInstruction: 263
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat32: a1_registerID [
	self addInstruction: 460  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalFloat64: a1_registerID [
	self addInstruction: 461  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt32: a1_registerID [
	self addInstruction: 457  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalInt64: a1_registerID [
	self addInstruction: 458  extendA: a1_registerID
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushPhysicalPointer: a1_registerID [
	self addInstruction: 459  extendA: a1_registerID
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
	self addInstruction: 256
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZero64 [
	self addInstruction: 258
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat32 [
	self addInstruction: 260
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushZeroFloat64 [
	self addInstruction: 262
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem32 [
	self addInstruction: 337
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem64 [
	self addInstruction: 345
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnFalse [
	self addSistaInstruction: 90
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnFloat32 [
	self addInstruction: 421
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnFloat64 [
	self addInstruction: 422
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnInt32 [
	self addInstruction: 418
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnInt64 [
	self addInstruction: 419
]

{ #category : #'sista extended bytecode instructions' }
LowcodeAssembler >> returnNil [
	self addSistaInstruction: 91
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> returnPointer [
	self addInstruction: 420
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
	self addInstruction: 352
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rightShift64 [
	self addInstruction: 359
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From16 [
	self addInstruction: 305
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend32From8 [
	self addInstruction: 304
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From16 [
	self addInstruction: 307
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From32 [
	self addInstruction: 308
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> signExtend64From8 [
	self addInstruction: 306
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> smallInt32ToOop [
	self addInstruction: 384
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat32ToMemory [
	self addInstruction: 284
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeFloat64ToMemory [
	self addInstruction: 285
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt16ToMemory [
	self addInstruction: 280
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt32ToMemory [
	self addInstruction: 281
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt64ToMemory [
	self addInstruction: 282
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeInt8ToMemory [
	self addInstruction: 279
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat32: a1_baseOffset [
	self addInstruction: 302  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalFloat64: a1_baseOffset [
	self addInstruction: 303  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt16: a1_baseOffset [
	self addInstruction: 298  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt32: a1_baseOffset [
	self addInstruction: 299  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt64: a1_baseOffset [
	self addInstruction: 300  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalInt8: a1_baseOffset [
	self addInstruction: 297  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storeLocalPointer: a1_baseOffset [
	self addInstruction: 301  extendA: a1_baseOffset
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> storePointerToMemory [
	self addInstruction: 283
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub32 [
	self addInstruction: 332
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub64 [
	self addInstruction: 340
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> test32 [
	self addInstruction: 397
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> test64 [
	self addInstruction: 398
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To16 [
	self addInstruction: 315
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate32To8 [
	self addInstruction: 314
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To16 [
	self addInstruction: 317
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To32 [
	self addInstruction: 318
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> truncate64To8 [
	self addInstruction: 316
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv32 [
	self addInstruction: 336
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv64 [
	self addInstruction: 344
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat32 [
	self addInstruction: 319
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToFloat64 [
	self addInstruction: 320
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint32ToOop [
	self addInstruction: 386
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat32 [
	self addInstruction: 323
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToFloat64 [
	self addInstruction: 324
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint64ToOop [
	self addInstruction: 388
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul32 [
	self addInstruction: 334
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul64 [
	self addInstruction: 342
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockRegisters [
	self addInstruction: 451
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockVM [
	self addInstruction: 424
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin [
	self addInstruction: 370
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem32 [
	self addInstruction: 338
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem64 [
	self addInstruction: 346
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor32 [
	self addInstruction: 350
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor64 [
	self addInstruction: 357
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From16 [
	self addInstruction: 310
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend32From8 [
	self addInstruction: 309
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From16 [
	self addInstruction: 312
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From32 [
	self addInstruction: 313
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zeroExtend64From8 [
	self addInstruction: 311
]
