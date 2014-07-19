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
			256 pushZero32
			257 pushOne32
			258 pushZero64
			259 pushOne64
			260 pushZeroFloat32
			261 pushOneFloat32
			262 pushZeroFloat64
			263 pushOneFloat64
			264 pushSessionIdentifier
			265 checkSessionIdentifier
			266 pointerOffset32
			267 pointerOffset64
			268 effectiveAddress32
			269 effectiveAddress64
			270 loadUInt8FromMemory
			271 loadUInt16FromMemory
			272 loadUInt32FromMemory
			273 loadUInt64FromMemory
			274 loadInt8FromMemory
			275 loadInt16FromMemory
			276 loadInt32FromMemory
			277 loadInt64FromMemory
			278 loadPointerFromMemory
			279 loadFloat32FromMemory
			280 loadFloat64FromMemory
			281 storeInt8ToMemory
			282 storeInt16ToMemory
			283 storeInt32ToMemory
			284 storeInt64ToMemory
			285 storePointerToMemory
			286 storeFloat32ToMemory
			287 storeFloat64ToMemory
			288 loadLocalUInt8
			289 loadLocalUInt16
			290 loadLocalUInt32
			291 loadLocalUInt64
			292 loadLocalInt8
			293 loadLocalInt16
			294 loadLocalInt32
			295 loadLocalInt64
			296 loadLocalPointer
			297 loadLocalFloat32
			298 loadLocalFloat64
			299 storeLocalInt8
			300 storeLocalInt16
			301 storeLocalInt32
			302 storeLocalInt64
			303 storeLocalPointer
			304 storeLocalFloat32
			305 storeLocalFloat64
			306 signExtend32From8
			307 signExtend32From16
			308 signExtend64From8
			309 signExtend64From16
			310 signExtend64From32
			311 zeroExtend32From8
			312 zeroExtend32From16
			313 zeroExtend64From8
			314 zeroExtend64From16
			315 zeroExtend64From32
			316 truncate32To8
			317 truncate32To16
			318 truncate64To8
			319 truncate64To16
			320 truncate64To32
			321 uint32ToFloat32
			322 uint32ToFloat64
			323 int32ToFloat32
			324 int32ToFloat64
			325 uint64ToFloat32
			326 uint64ToFloat64
			327 int64ToFloat32
			328 int64ToFloat64
			329 float32ToInt32
			330 float64ToInt32
			331 float32ToInt64
			332 float64ToInt64
			333 pointerToInt32
			334 pointerToInt64
			335 int32ToPointer
			336 int64ToPointer
			337 add32
			338 sub32
			339 neg32
			340 mul32
			341 umul32
			342 div32
			343 udiv32
			344 rem32
			345 urem32
			346 add64
			347 sub64
			348 neg64
			349 mul64
			350 umul64
			351 div64
			352 udiv64
			353 rem64
			354 urem64
			355 not32
			356 and32
			357 or32
			358 xor32
			359 leftShift32
			360 rightShift32
			361 arithmeticRightShift32
			362 not64
			363 and64
			364 or64
			365 xor64
			366 leftShift64
			367 rightShift64
			368 arithmeticRightShift64
			369 float32Add
			370 float32Sub
			371 float32Mul
			372 float32Div
			373 float64Add
			374 float64Sub
			375 float64Mul
			376 float64Div
			377 pin
			378 unpin
			379 oopToPointer
			380 oopToPointerReinterpret
			381 pointerToOop
			382 pointerToOopReinterprer
			383 oopToBoolean32
			384 oopToBoolean64
			385 oopSmallIntegerToInt32
			386 oopToInt32
			387 oopToUInt32
			388 oopSmallIntegerToInt64
			389 oopToInt64
			390 oopToUInt64
			391 oopToFloat32
			392 oopToFloat64
			393 boolean32ToOop
			394 boolean64ToOop
			395 smallInt32ToOop
			396 int32ToOop
			397 uint32ToOop
			398 int64ToOop
			399 uint64ToOop
			400 float32ToOop
			401 float64ToOop
			402 firstFieldPointer
			403 firstIndexableFieldPointer
			404 compare32
			405 compare64
			406 float32Compare
			407 float64Compare
			408 test32
			409 test64
			410 jump
			411 branchEqual
			412 branchNotEqual
			413 branchLess
			414 branchLessEqual
			415 branchGreater
			416 branchGreatEqual
			417 branchUnsignedLess
			418 branchUnsignedLessEqual
			419 branchUnsignedGreater
			420 branchUnsignedGreatEqual
			421 branchOverflow
			422 branchNotOverflow
			423 branchPrimitiveFailed
			424 branchPrimitiveSucceed
			429 returnSmallInteger
			430 returnBoolean32
			431 returnBoolean64
			432 returnInt32
			433 returnInt64
			434 returnUInt32
			435 returnUInt64
			436 returnPointer
			437 returnFloat32
			438 returnFloat64
			439 fail
			440 failWithCode
			441 lockVM
			442 unlockVM
			443 compareAndSwap32
			444 alloca32
			445 alloca64
			446 malloc32
			447 malloc64
			448 free
			449 beginCall
			450 callArgumentInt32
			451 callArgumentInt64
			452 callArgumentPointer
			453 callArgumentFloat32
			454 callArgumentFloat64
			455 performCallInt32
			456 performCallInt64
			457 performCallPointer
			458 performCallFloat32
			459 performCallFloat64
			460 performCallIndirectInt32
			461 performCallIndirectInt64
			462 performCallIndirectPointer
			463 performCallIndirectFloat32
			464 performCallIndirectFloat64
			465 endCall
			466 endCallNoCleanup
			467 plaftormCode
			468 lockRegisters
			469 unlockRegisters
			470 moveInt32ToPhysical
			471 moveInt64ToPhysical
			472 movePointerToPhysical
			473 moveFloat32ToPhysical
			474 moveFloat64ToPhysical
			475 pushPhysicalInt32
			476 pushPhysicalInt64
			477 pushPhysicalPointer
			478 pushPhysicalFloat32
			479 pushPhysicalFloat64
			480 callPhysical
			481 callInstruction
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
