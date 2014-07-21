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
			270 pushConstantUInt32
			271 pushConstantUInt64
			272 pushZeroFloat32
			273 pushOneFloat32
			274 pushZeroFloat64
			275 pushOneFloat64
			276 pushNullPointer
			277 pushSessionIdentifier
			278 checkSessionIdentifier
			279 pointerOffset32
			280 pointerOffset64
			281 effectiveAddress32
			282 effectiveAddress64
			283 loadUInt8FromMemory
			284 loadUInt16FromMemory
			285 loadUInt32FromMemory
			286 loadUInt64FromMemory
			287 loadInt8FromMemory
			288 loadInt16FromMemory
			289 loadInt32FromMemory
			290 loadInt64FromMemory
			291 loadPointerFromMemory
			292 loadFloat32FromMemory
			293 loadFloat64FromMemory
			294 storeInt8ToMemory
			295 storeInt16ToMemory
			296 storeInt32ToMemory
			297 storeInt64ToMemory
			298 storePointerToMemory
			299 storeFloat32ToMemory
			300 storeFloat64ToMemory
			301 loadLocalAddress
			302 loadLocalUInt8
			303 loadLocalUInt16
			304 loadLocalUInt32
			305 loadLocalUInt64
			306 loadLocalInt8
			307 loadLocalInt16
			308 loadLocalInt32
			309 loadLocalInt64
			310 loadLocalPointer
			311 loadLocalFloat32
			312 loadLocalFloat64
			313 storeLocalInt8
			314 storeLocalInt16
			315 storeLocalInt32
			316 storeLocalInt64
			317 storeLocalPointer
			318 storeLocalFloat32
			319 storeLocalFloat64
			320 signExtend32From8
			321 signExtend32From16
			322 signExtend64From8
			323 signExtend64From16
			324 signExtend64From32
			325 zeroExtend32From8
			326 zeroExtend32From16
			327 zeroExtend64From8
			328 zeroExtend64From16
			329 zeroExtend64From32
			330 truncate32To8
			331 truncate32To16
			332 truncate64To8
			333 truncate64To16
			334 truncate64To32
			335 uint32ToFloat32
			336 uint32ToFloat64
			337 int32ToFloat32
			338 int32ToFloat64
			339 uint64ToFloat32
			340 uint64ToFloat64
			341 int64ToFloat32
			342 int64ToFloat64
			343 float32ToInt32
			344 float64ToInt32
			345 float32ToInt64
			346 float64ToInt64
			347 pointerToInt32
			348 pointerToInt64
			349 int32ToPointer
			350 int64ToPointer
			351 add32
			352 sub32
			353 neg32
			354 mul32
			355 umul32
			356 div32
			357 udiv32
			358 rem32
			359 urem32
			360 add64
			361 sub64
			362 neg64
			363 mul64
			364 umul64
			365 div64
			366 udiv64
			367 rem64
			368 urem64
			369 not32
			370 and32
			371 or32
			372 xor32
			373 leftShift32
			374 rightShift32
			375 arithmeticRightShift32
			376 not64
			377 and64
			378 or64
			379 xor64
			380 leftShift64
			381 rightShift64
			382 arithmeticRightShift64
			383 float32Add
			384 float32Sub
			385 float32Mul
			386 float32Div
			387 float64Add
			388 float64Sub
			389 float64Mul
			390 float64Div
			391 pin
			392 unpin
			393 oopToPointer
			394 oopToPointerReinterpret
			395 pointerToOop
			396 pointerToOopReinterprer
			397 instantiateOop
			398 instantiateIndexableOop
			399 instantiateIndexable32Oop
			400 oopToBoolean32
			401 oopToBoolean64
			402 oopSmallIntegerToInt32
			403 oopToInt32
			404 oopToUInt32
			405 oopSmallIntegerToInt64
			406 oopToInt64
			407 oopToUInt64
			408 oopToFloat32
			409 oopToFloat64
			410 boolean32ToOop
			411 boolean64ToOop
			412 smallInt32ToOop
			413 int32ToOop
			414 uint32ToOop
			415 int64ToOop
			416 uint64ToOop
			417 float32ToOop
			418 float64ToOop
			419 loadObjectField
			420 storeObjectField
			421 loadObjectAt
			422 storeObjectFieldAt
			423 firstFieldPointer
			424 firstIndexableFieldPointer
			425 byteSizeOf
			426 isBytes
			427 isFloatObject
			428 isIndexable
			429 isIntegerObject
			430 isWords
			431 isWordsOrBytes
			432 isPointers
			433 pointerEqual
			434 pointerNotEqual
			435 oopEqual
			436 oopNotEqual
			437 int32Equal
			438 int32NotEqual
			439 int32Less
			440 int32LessEqual
			441 int32Great
			442 int32GreatEqual
			443 uint32Less
			444 uint32LessEqual
			445 uint32Great
			446 uint32GreatEqual
			447 int64Equal
			448 int64NotEqual
			449 int64Less
			450 int64LessEqual
			451 int64Great
			452 int64GreatEqual
			453 uint64Less
			454 uint64LessEqual
			455 uint64Great
			456 uint64GreatEqual
			457 float32Equal
			458 float32NotEqual
			459 float32Less
			460 float32LessEqual
			461 float32Great
			462 float32GreatEqual
			463 float64Equal
			464 float64NotEqual
			465 float64Less
			466 float64LessEqual
			467 float64Great
			468 float64GreatEqual
			469 jump
			470 branchTrue32
			471 branchFalse32
			472 branchTrue64
			473 branchFalse64
			478 returnSmallInteger
			479 returnBoolean32AsOop
			480 returnBoolean64AsOop
			481 returnInt32AsOop
			482 returnInt64AsOop
			483 returnUInt32AsOop
			484 returnUInt64AsOop
			485 returnPointerAsOop
			486 returnFloat32AsOop
			487 returnFloat64AsOop
			488 fail
			489 failWithCode
			490 lockVM
			491 unlockVM
			492 compareAndSwap32
			493 alloca32
			494 alloca64
			495 malloc32
			496 malloc64
			497 free
			498 memcpyFixed
			499 memcpy32
			500 memcpy64
			501 beginCall
			502 callArgumentInt32
			503 callArgumentInt64
			504 callArgumentPointer
			505 callArgumentStructure
			506 callArgumentFloat32
			507 callArgumentFloat64
			508 performCallInt32
			509 performCallInt64
			510 performCallPointer
			511 performCallFloat32
			512 performCallFloat64
			513 performCallIndirectInt32
			514 performCallIndirectInt64
			515 performCallIndirectPointer
			516 performCallIndirectFloat32
			517 performCallIndirectFloat64
			518 endCall
			519 endCallNoCleanup
			520 plaftormCode
			521 lockRegisters
			522 unlockRegisters
			523 moveInt32ToPhysical
			524 moveInt64ToPhysical
			525 movePointerToPhysical
			526 moveFloat32ToPhysical
			527 moveFloat64ToPhysical
			528 pushPhysicalInt32
			529 pushPhysicalInt64
			530 pushPhysicalPointer
			531 pushPhysicalFloat32
			532 pushPhysicalFloat64
			533 callPhysical
			534 callInstruction
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
			208 'popAndStoreTemp: 0'
			209 'popAndStoreTemp: 1'
			210 'popAndStoreTemp: 2'
			211 'popAndStoreTemp: 3'
			212 'popAndStoreTemp: 4'
			213 'popAndStoreTemp: 5'
			214 'popAndStoreTemp: 6'
			215 'popAndStoreTemp: 7'
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
