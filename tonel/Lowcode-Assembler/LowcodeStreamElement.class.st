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
			347 float32ToUInt32
			348 float64ToUInt32
			349 float32ToUInt64
			350 float64ToUInt64
			351 float32ToFloat64
			352 float64ToFloat32
			353 pointerToInt32
			354 pointerToInt64
			355 int32ToPointer
			356 int64ToPointer
			357 add32
			358 sub32
			359 neg32
			360 mul32
			361 umul32
			362 div32
			363 udiv32
			364 rem32
			365 urem32
			366 add64
			367 sub64
			368 neg64
			369 mul64
			370 umul64
			371 div64
			372 udiv64
			373 rem64
			374 urem64
			375 not32
			376 and32
			377 or32
			378 xor32
			379 leftShift32
			380 rightShift32
			381 arithmeticRightShift32
			382 not64
			383 and64
			384 or64
			385 xor64
			386 leftShift64
			387 rightShift64
			388 arithmeticRightShift64
			389 float32Add
			390 float32Sub
			391 float32Mul
			392 float32Div
			393 float64Add
			394 float64Sub
			395 float64Mul
			396 float64Div
			397 pin
			398 unpin
			399 oopToPointer
			400 oopToPointerReinterpret
			401 pointerToOop
			402 pointerToOopReinterprer
			403 instantiateOop
			404 instantiateIndexableOop
			405 instantiateIndexable32Oop
			406 oopToBoolean32
			407 oopToBoolean64
			408 oopSmallIntegerToInt32
			409 oopToInt32
			410 oopToUInt32
			411 oopSmallIntegerToInt64
			412 oopToInt64
			413 oopToUInt64
			414 oopToFloat32
			415 oopToFloat64
			416 boolean32ToOop
			417 boolean64ToOop
			418 smallInt32ToOop
			419 int32ToOop
			420 uint32ToOop
			421 int64ToOop
			422 uint64ToOop
			423 float32ToOop
			424 float64ToOop
			425 loadObjectField
			426 storeObjectField
			427 loadObjectAt
			428 storeObjectFieldAt
			429 firstFieldPointer
			430 firstIndexableFieldPointer
			431 byteSizeOf
			432 isBytes
			433 isFloatObject
			434 isIndexable
			435 isIntegerObject
			436 isWords
			437 isWordsOrBytes
			438 isPointers
			439 pointerEqual
			440 pointerNotEqual
			441 oopEqual
			442 oopNotEqual
			443 int32Equal
			444 int32NotEqual
			445 int32Less
			446 int32LessEqual
			447 int32Great
			448 int32GreatEqual
			449 uint32Less
			450 uint32LessEqual
			451 uint32Great
			452 uint32GreatEqual
			453 int64Equal
			454 int64NotEqual
			455 int64Less
			456 int64LessEqual
			457 int64Great
			458 int64GreatEqual
			459 uint64Less
			460 uint64LessEqual
			461 uint64Great
			462 uint64GreatEqual
			463 float32Equal
			464 float32NotEqual
			465 float32Less
			466 float32LessEqual
			467 float32Great
			468 float32GreatEqual
			469 float64Equal
			470 float64NotEqual
			471 float64Less
			472 float64LessEqual
			473 float64Great
			474 float64GreatEqual
			475 jump
			476 branchTrue32
			477 branchFalse32
			478 branchTrue64
			479 branchFalse64
			484 returnSmallInteger
			485 returnBoolean32AsOop
			486 returnBoolean64AsOop
			487 returnInt32AsOop
			488 returnInt64AsOop
			489 returnUInt32AsOop
			490 returnUInt64AsOop
			491 returnPointerAsOop
			492 returnFloat32AsOop
			493 returnFloat64AsOop
			494 fail
			495 failWithCode
			496 lockVM
			497 unlockVM
			498 compareAndSwap32
			499 alloca32
			500 alloca64
			501 malloc32
			502 malloc64
			503 free
			504 memcpyFixed
			505 memcpy32
			506 memcpy64
			507 beginCall
			508 callArgumentInt32
			509 callArgumentInt64
			510 callArgumentPointer
			511 callArgumentStructure
			512 callArgumentFloat32
			513 callArgumentFloat64
			514 performCallInt32
			515 performCallInt64
			516 performCallPointer
			517 performCallStructure
			518 performCallFloat32
			519 performCallFloat64
			520 performCallIndirectInt32
			521 performCallIndirectInt64
			522 performCallIndirectPointer
			523 performCallIndirectStructure
			524 performCallIndirectFloat32
			525 performCallIndirectFloat64
			526 endCall
			527 endCallNoCleanup
			528 plaftormCode
			529 lockRegisters
			530 unlockRegisters
			531 moveInt32ToPhysical
			532 moveInt64ToPhysical
			533 movePointerToPhysical
			534 moveFloat32ToPhysical
			535 moveFloat64ToPhysical
			536 pushPhysicalInt32
			537 pushPhysicalInt64
			538 pushPhysicalPointer
			539 pushPhysicalFloat32
			540 pushPhysicalFloat64
			541 callPhysical
			542 callInstruction
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
