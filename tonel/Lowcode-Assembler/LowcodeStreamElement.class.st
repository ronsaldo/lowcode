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
			0 beginCall
			1 callInstruction
			2 callPhysical
			3 endCall
			4 endCallNoCleanup
			5 fail
			6 failWithCode
			7 jump
			8 lockRegisters
			9 lockVM
			10 unlockRegisters
			11 unlockVM
			300 checkSessionIdentifier
			301 loadLocalAddress
			302 loadLocalFloat32
			303 loadLocalFloat64
			304 loadLocalInt16
			305 loadLocalInt32
			306 loadLocalInt64
			307 loadLocalInt8
			308 loadLocalPointer
			309 loadLocalUInt16
			310 loadLocalUInt32
			311 loadLocalUInt64
			312 loadLocalUInt8
			313 performCallFloat32
			314 performCallFloat64
			315 performCallInt32
			316 performCallInt64
			317 performCallPointer
			318 plaftormCode
			319 pushConstantUInt32
			320 pushConstantUInt64
			321 pushNullPointer
			322 pushOne32
			323 pushOne64
			324 pushOneFloat32
			325 pushOneFloat64
			326 pushPhysicalFloat32
			327 pushPhysicalFloat64
			328 pushPhysicalInt32
			329 pushPhysicalInt64
			330 pushPhysicalPointer
			331 pushSessionIdentifier
			332 pushZero32
			333 pushZero64
			334 pushZeroFloat32
			335 pushZeroFloat64
			1000 branchFalse32
			1001 branchFalse64
			1002 branchTrue32
			1003 branchTrue64
			1004 callArgumentFloat32
			1005 callArgumentFloat64
			1006 callArgumentInt32
			1007 callArgumentInt64
			1008 callArgumentPointer
			1009 callArgumentStructure
			1010 free
			1011 moveFloat32ToPhysical
			1012 moveFloat64ToPhysical
			1013 moveInt32ToPhysical
			1014 moveInt64ToPhysical
			1015 movePointerToPhysical
			1016 pin
			1017 popFloat32
			1018 popFloat64
			1019 popInt32
			1020 popInt64
			1021 popPointer
			1022 storeLocalFloat32
			1023 storeLocalFloat64
			1024 storeLocalInt16
			1025 storeLocalInt32
			1026 storeLocalInt64
			1027 storeLocalInt8
			1028 storeLocalPointer
			1029 unpin
			1307 alloca32
			1308 alloca64
			1309 boolean32ToOop
			1310 boolean64ToOop
			1311 byteSizeOf
			1312 firstFieldPointer
			1313 firstIndexableFieldPointer
			1314 float32ToFloat64
			1315 float32ToInt32
			1316 float32ToInt64
			1317 float32ToOop
			1318 float32ToUInt32
			1319 float32ToUInt64
			1320 float64ToFloat32
			1321 float64ToInt32
			1322 float64ToInt64
			1323 float64ToOop
			1324 float64ToUInt32
			1325 float64ToUInt64
			1326 instantiateIndexableOop
			1327 instantiateOop
			1328 int32ToFloat32
			1329 int32ToFloat64
			1330 int32ToOop
			1331 int32ToPointer
			1332 int64ToFloat32
			1333 int64ToFloat64
			1334 int64ToOop
			1335 int64ToPointer
			1336 isBytes
			1337 isFloatObject
			1338 isIndexable
			1339 isIntegerObject
			1340 isPointers
			1341 isWords
			1342 isWordsOrBytes
			1343 loadFloat32FromMemory
			1344 loadFloat64FromMemory
			1345 loadInt16FromMemory
			1346 loadInt32FromMemory
			1347 loadInt64FromMemory
			1348 loadInt8FromMemory
			1349 loadObjectField
			1350 loadPointerFromMemory
			1351 loadUInt16FromMemory
			1352 loadUInt32FromMemory
			1353 loadUInt64FromMemory
			1354 loadUInt8FromMemory
			1355 malloc32
			1356 malloc64
			1357 neg32
			1358 neg64
			1359 not32
			1360 not64
			1361 oopSmallIntegerToInt32
			1362 oopSmallIntegerToInt64
			1363 oopToBoolean32
			1364 oopToBoolean64
			1365 oopToFloat32
			1366 oopToFloat64
			1367 oopToInt32
			1368 oopToInt64
			1369 oopToPointer
			1370 oopToPointerReinterpret
			1371 oopToUInt32
			1372 oopToUInt64
			1373 performCallIndirectFloat32
			1374 performCallIndirectFloat64
			1375 performCallIndirectInt32
			1376 performCallIndirectInt64
			1377 performCallIndirectPointer
			1378 performCallStructure
			1379 pointerToInt32
			1380 pointerToInt64
			1381 pointerToOop
			1382 pointerToOopReinterprer
			1383 signExtend32From16
			1384 signExtend32From8
			1385 signExtend64From16
			1386 signExtend64From32
			1387 signExtend64From8
			1388 smallInt32ToOop
			1389 truncate32To16
			1390 truncate32To8
			1391 truncate64To16
			1392 truncate64To32
			1393 truncate64To8
			1394 uint32ToFloat32
			1395 uint32ToFloat64
			1396 uint32ToOop
			1397 uint64ToFloat32
			1398 uint64ToFloat64
			1399 uint64ToOop
			1400 zeroExtend32From16
			1401 zeroExtend32From8
			1402 zeroExtend64From16
			1403 zeroExtend64From32
			1404 zeroExtend64From8
			1600 duplicateFloat32
			1601 duplicateFloat64
			1602 duplicateInt32
			1603 duplicateInt64
			1604 duplicatePointer
			2000 memcpyFixed
			2001 storeFloat32ToMemory
			2002 storeFloat64ToMemory
			2003 storeInt16ToMemory
			2004 storeInt32ToMemory
			2005 storeInt64ToMemory
			2006 storeInt8ToMemory
			2007 storeObjectField
			2008 storePointerToMemory
			2369 add32
			2370 add64
			2371 and32
			2372 and64
			2373 arithmeticRightShift32
			2374 arithmeticRightShift64
			2375 div32
			2376 div64
			2377 float32Add
			2378 float32Div
			2379 float32Equal
			2380 float32Great
			2381 float32GreatEqual
			2382 float32Less
			2383 float32LessEqual
			2384 float32Mul
			2385 float32NotEqual
			2386 float32Sub
			2387 float64Add
			2388 float64Div
			2389 float64Equal
			2390 float64Great
			2391 float64GreatEqual
			2392 float64Less
			2393 float64LessEqual
			2394 float64Mul
			2395 float64NotEqual
			2396 float64Sub
			2397 instantiateIndexable32Oop
			2398 int32Equal
			2399 int32Great
			2400 int32GreatEqual
			2401 int32Less
			2402 int32LessEqual
			2403 int32NotEqual
			2404 int64Equal
			2405 int64Great
			2406 int64GreatEqual
			2407 int64Less
			2408 int64LessEqual
			2409 int64NotEqual
			2410 leftShift32
			2411 leftShift64
			2412 loadObjectAt
			2413 mul32
			2414 mul64
			2415 oopEqual
			2416 oopNotEqual
			2417 or32
			2418 or64
			2419 performCallIndirectStructure
			2420 pointerAddOffset32
			2421 pointerAddOffset64
			2422 pointerEqual
			2423 pointerNotEqual
			2424 rem32
			2425 rem64
			2426 rightShift32
			2427 rightShift64
			2428 sub32
			2429 sub64
			2430 udiv32
			2431 udiv64
			2432 uint32Great
			2433 uint32GreatEqual
			2434 uint32Less
			2435 uint32LessEqual
			2436 uint64Great
			2437 uint64GreatEqual
			2438 uint64Less
			2439 uint64LessEqual
			2440 umul32
			2441 umul64
			2442 urem32
			2443 urem64
			2444 xor32
			2445 xor64
			3000 memcpy32
			3001 memcpy64
			3002 storeObjectFieldAt
			3305 compareAndSwap32
			4300 effectiveAddress32
			4301 effectiveAddress64
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

{ #category : #'as yet unclassified' }
LowcodeStreamElement class >> lowcodeMnemonicFor: opcode [
	^ LowcodeMnemonics at: opcode
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement class >> sistaExtendedBytecodeMnemonicFor: opcode [
	^ SistaExtendedBytecodeMnemonics at: opcode
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
