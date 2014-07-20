"
Lowcode assembler instruction stream element
"
Class {
	#name : #LowcodeStreamElement,
	#superclass : #Object,
	#classVars : [
		'LowcodeMnemonics',
		'SistaExtendedBytecodeMnemonics'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'lowcode instructions' }
LowcodeStreamElement class >> initMnemonicTables [
	LowcodeMnemonics := IdentityDictionary newFromPairs: #(
			256 duplicateInt32
			257 duplicateInt64
			258 duplicatePointer
			259 duplicateFloat32
			260 duplicateFloat64
			261 popInt32
			262 popInt64
			263 popPointer
			264 popFloat32
			265 popFloat64
			266 pushZero32
			267 pushOne32
			268 pushZero64
			269 pushOne64
			270 pushZeroFloat32
			271 pushOneFloat32
			272 pushZeroFloat64
			273 pushOneFloat64
			274 pushNullPointer
			275 pushSessionIdentifier
			276 checkSessionIdentifier
			277 pointerOffset32
			278 pointerOffset64
			279 effectiveAddress32
			280 effectiveAddress64
			281 loadUInt8FromMemory
			282 loadUInt16FromMemory
			283 loadUInt32FromMemory
			284 loadUInt64FromMemory
			285 loadInt8FromMemory
			286 loadInt16FromMemory
			287 loadInt32FromMemory
			288 loadInt64FromMemory
			289 loadPointerFromMemory
			290 loadFloat32FromMemory
			291 loadFloat64FromMemory
			292 storeInt8ToMemory
			293 storeInt16ToMemory
			294 storeInt32ToMemory
			295 storeInt64ToMemory
			296 storePointerToMemory
			297 storeFloat32ToMemory
			298 storeFloat64ToMemory
			299 loadLocalUInt8
			300 loadLocalUInt16
			301 loadLocalUInt32
			302 loadLocalUInt64
			303 loadLocalInt8
			304 loadLocalInt16
			305 loadLocalInt32
			306 loadLocalInt64
			307 loadLocalPointer
			308 loadLocalFloat32
			309 loadLocalFloat64
			310 storeLocalInt8
			311 storeLocalInt16
			312 storeLocalInt32
			313 storeLocalInt64
			314 storeLocalPointer
			315 storeLocalFloat32
			316 storeLocalFloat64
			317 signExtend32From8
			318 signExtend32From16
			319 signExtend64From8
			320 signExtend64From16
			321 signExtend64From32
			322 zeroExtend32From8
			323 zeroExtend32From16
			324 zeroExtend64From8
			325 zeroExtend64From16
			326 zeroExtend64From32
			327 truncate32To8
			328 truncate32To16
			329 truncate64To8
			330 truncate64To16
			331 truncate64To32
			332 uint32ToFloat32
			333 uint32ToFloat64
			334 int32ToFloat32
			335 int32ToFloat64
			336 uint64ToFloat32
			337 uint64ToFloat64
			338 int64ToFloat32
			339 int64ToFloat64
			340 float32ToInt32
			341 float64ToInt32
			342 float32ToInt64
			343 float64ToInt64
			344 pointerToInt32
			345 pointerToInt64
			346 int32ToPointer
			347 int64ToPointer
			348 add32
			349 sub32
			350 neg32
			351 mul32
			352 umul32
			353 div32
			354 udiv32
			355 rem32
			356 urem32
			357 add64
			358 sub64
			359 neg64
			360 mul64
			361 umul64
			362 div64
			363 udiv64
			364 rem64
			365 urem64
			366 not32
			367 and32
			368 or32
			369 xor32
			370 leftShift32
			371 rightShift32
			372 arithmeticRightShift32
			373 not64
			374 and64
			375 or64
			376 xor64
			377 leftShift64
			378 rightShift64
			379 arithmeticRightShift64
			380 float32Add
			381 float32Sub
			382 float32Mul
			383 float32Div
			384 float64Add
			385 float64Sub
			386 float64Mul
			387 float64Div
			388 pin
			389 unpin
			390 oopToPointer
			391 oopToPointerReinterpret
			392 pointerToOop
			393 pointerToOopReinterprer
			394 oopToBoolean32
			395 oopToBoolean64
			396 oopSmallIntegerToInt32
			397 oopToInt32
			398 oopToUInt32
			399 oopSmallIntegerToInt64
			400 oopToInt64
			401 oopToUInt64
			402 oopToFloat32
			403 oopToFloat64
			404 boolean32ToOop
			405 boolean64ToOop
			406 smallInt32ToOop
			407 int32ToOop
			408 uint32ToOop
			409 int64ToOop
			410 uint64ToOop
			411 float32ToOop
			412 float64ToOop
			413 firstFieldPointer
			414 firstIndexableFieldPointer
			415 isBytes
			416 isFloatObject
			417 isIndexable
			418 isIntegerObject
			419 isWords
			420 isWordsOrBytes
			421 isPointers
			422 pointerEqual
			423 pointerNotEqual
			424 oopEqual
			425 oopNotEqual
			426 int32Equal
			427 int32NotEqual
			428 int32Less
			429 int32LessEqual
			430 int32Great
			431 int32GreatEqual
			432 uint32Less
			433 uint32LessEqual
			434 uint32Great
			435 uint32GreatEqual
			436 int64Equal
			437 int64NotEqual
			438 int64Less
			439 int64LessEqual
			440 int64Great
			441 int64GreatEqual
			442 uint64Less
			443 uint64LessEqual
			444 uint64Great
			445 uint64GreatEqual
			446 float32Equal
			447 float32NotEqual
			448 float32Less
			449 float32LessEqual
			450 float32Great
			451 float32GreatEqual
			452 float64Equal
			453 float64NotEqual
			454 float64Less
			455 float64LessEqual
			456 float64Great
			457 float64GreatEqual
			458 jump
			459 branchTrue32
			460 branchFalse32
			461 branchTrue64
			462 branchFalse64
			467 returnSmallInteger
			468 returnBoolean32AsOop
			469 returnBoolean64AsOop
			470 returnInt32AsOop
			471 returnInt64AsOop
			472 returnUInt32AsOop
			473 returnUInt64AsOop
			474 returnPointerAsOop
			475 returnFloat32AsOop
			476 returnFloat64AsOop
			477 fail
			478 failWithCode
			479 lockVM
			480 unlockVM
			481 compareAndSwap32
			482 alloca32
			483 alloca64
			484 malloc32
			485 malloc64
			486 free
			487 beginCall
			488 callArgumentInt32
			489 callArgumentInt64
			490 callArgumentPointer
			491 callArgumentFloat32
			492 callArgumentFloat64
			493 performCallInt32
			494 performCallInt64
			495 performCallPointer
			496 performCallFloat32
			497 performCallFloat64
			498 performCallIndirectInt32
			499 performCallIndirectInt64
			500 performCallIndirectPointer
			501 performCallIndirectFloat32
			502 performCallIndirectFloat64
			503 endCall
			504 endCallNoCleanup
			505 plaftormCode
			506 lockRegisters
			507 unlockRegisters
			508 moveInt32ToPhysical
			509 moveInt64ToPhysical
			510 movePointerToPhysical
			511 moveFloat32ToPhysical
			512 moveFloat64ToPhysical
			513 pushPhysicalInt32
			514 pushPhysicalInt64
			515 pushPhysicalPointer
			516 pushPhysicalFloat32
			517 pushPhysicalFloat64
			518 callPhysical
			519 callInstruction
).
	SistaExtendedBytecodeMnemonics := IdentityDictionary newFromPairs: #(
			0 'pushReceiverVariableSmallIndex: 0'
			1 'pushReceiverVariableSmallIndex: 1'
			2 'pushReceiverVariableSmallIndex: 2'
			3 'pushReceiverVariableSmallIndex: 3'
			4 'pushReceiverVariableSmallIndex: 4'
			5 'pushReceiverVariableSmallIndex: 5'
			6 'pushReceiverVariableSmallIndex: 6'
			7 'pushReceiverVariableSmallIndex: 7'
			8 'pushReceiverVariableSmallIndex: 8'
			9 'pushReceiverVariableSmallIndex: 9'
			10 'pushReceiverVariableSmallIndex: 10'
			11 'pushReceiverVariableSmallIndex: 11'
			12 'pushReceiverVariableSmallIndex: 12'
			13 'pushReceiverVariableSmallIndex: 13'
			14 'pushReceiverVariableSmallIndex: 14'
			15 'pushReceiverVariableSmallIndex: 15'
			16 'pushLiteralVariableSmallIndex: 0'
			17 'pushLiteralVariableSmallIndex: 1'
			18 'pushLiteralVariableSmallIndex: 2'
			19 'pushLiteralVariableSmallIndex: 3'
			20 'pushLiteralVariableSmallIndex: 4'
			21 'pushLiteralVariableSmallIndex: 5'
			22 'pushLiteralVariableSmallIndex: 6'
			23 'pushLiteralVariableSmallIndex: 7'
			24 'pushLiteralVariableSmallIndex: 8'
			25 'pushLiteralVariableSmallIndex: 9'
			26 'pushLiteralVariableSmallIndex: 10'
			27 'pushLiteralVariableSmallIndex: 11'
			28 'pushLiteralVariableSmallIndex: 12'
			29 'pushLiteralVariableSmallIndex: 13'
			30 'pushLiteralVariableSmallIndex: 14'
			31 'pushLiteralVariableSmallIndex: 15'
			32 'pushLiteralSmallIndex: 0'
			33 'pushLiteralSmallIndex: 1'
			34 'pushLiteralSmallIndex: 2'
			35 'pushLiteralSmallIndex: 3'
			36 'pushLiteralSmallIndex: 4'
			37 'pushLiteralSmallIndex: 5'
			38 'pushLiteralSmallIndex: 6'
			39 'pushLiteralSmallIndex: 7'
			40 'pushLiteralSmallIndex: 8'
			41 'pushLiteralSmallIndex: 9'
			42 'pushLiteralSmallIndex: 10'
			43 'pushLiteralSmallIndex: 11'
			44 'pushLiteralSmallIndex: 12'
			45 'pushLiteralSmallIndex: 13'
			46 'pushLiteralSmallIndex: 14'
			47 'pushLiteralSmallIndex: 15'
			48 'pushLiteralSmallIndex: 16'
			49 'pushLiteralSmallIndex: 17'
			50 'pushLiteralSmallIndex: 18'
			51 'pushLiteralSmallIndex: 19'
			52 'pushLiteralSmallIndex: 20'
			53 'pushLiteralSmallIndex: 21'
			54 'pushLiteralSmallIndex: 22'
			55 'pushLiteralSmallIndex: 23'
			56 'pushLiteralSmallIndex: 24'
			57 'pushLiteralSmallIndex: 25'
			58 'pushLiteralSmallIndex: 26'
			59 'pushLiteralSmallIndex: 27'
			60 'pushLiteralSmallIndex: 28'
			61 'pushLiteralSmallIndex: 29'
			62 'pushLiteralSmallIndex: 30'
			63 'pushLiteralSmallIndex: 31'
			64 'pushTempSmallIndex: 0'
			65 'pushTempSmallIndex: 1'
			66 'pushTempSmallIndex: 2'
			67 'pushTempSmallIndex: 3'
			68 'pushTempSmallIndex: 4'
			69 'pushTempSmallIndex: 5'
			70 'pushTempSmallIndex: 6'
			71 'pushTempSmallIndex: 7'
			72 'pushTempSmallIndex2: 0'
			73 'pushTempSmallIndex2: 1'
			74 'pushTempSmallIndex2: 2'
			75 'pushTempSmallIndex2: 3'
			76 pushReceiver
			77 pushTrue
			78 pushFalse
			79 pushNil
			80 pushZero
			81 pushOne
			82 pushThisContext
			83 dupTop
			88 returnReceiver
			89 returnTrue
			90 returnFalse
			91 returnNil
			92 returnTop
			95 nop
			119 sendSpecialMessageClass
			216 popStackTop

)

]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> bytesFor: uint [
	uint > 16rFFFFFF ifTrue: [ ^ 4 ].
	uint > 16rFFFF ifTrue: [ ^ 3 ].
	uint > 16rFF ifTrue: [ ^ 2 ].
	^ 1
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> computeSizeForOffset: anOffset [
	self subclassResponsibility 
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> elementSize [
	self subclassResponsibility
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitExtend: opcode value: value toStream: stream [
	| numBytes |
	numBytes := self bytesFor: value.
	numBytes >= 4 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 24) & 16rFF ].
	numBytes >= 3 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 16) & 16rFF ].
	numBytes >= 2 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 8) & 16rFF ].
	numBytes >= 1 ifTrue: [ stream nextPut: opcode; nextPut: value & 16rFF ].
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitExtendA: value toStream: stream [
	self emitExtend: 224 value: value toStream: stream
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitExtendB: value toStream: stream [
	self emitExtend: 225 value: value toStream: stream
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitToStream: stream [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement >> lowcodeMnemonicFor: opcode [
	^ LowcodeMnemonics at: opcode
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement >> sistaExtendedBytecodeMnemonicFor: opcode [
	^ SistaExtendedBytecodeMnemonics at: opcode
]
