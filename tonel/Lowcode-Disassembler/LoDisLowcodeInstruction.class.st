Class {
	#name : #LoDisLowcodeInstruction,
	#superclass : #LoDisInstruction,
	#classVars : [
		'InstructionKinds'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #'class initialization' }
LoDisLowcodeInstruction class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	self initializeInstructionKindMap
	
]

{ #category : #initialization }
LoDisLowcodeInstruction class >> initializeInstructionKindMap [
	InstructionKinds := IdentityDictionary newFromPairs: #(
0 operation
1 operation
2 operation
3 operation
4 operation
5 terminator
6 terminator
7 jump
8 operation
9 operation
10 operation
11 operation
300 operation
301 operation
302 operation
303 operation
304 operation
305 operation
306 operation
307 operation
308 operation
309 operation
310 operation
311 operation
312 operation
313 operation
314 operation
315 operation
316 operation
317 operation
318 operation
319 operation
320 operation
321 operation
322 operation
323 operation
324 operation
325 operation
326 operation
327 operation
328 operation
329 operation
330 operation
331 operation
332 operation
333 operation
334 operation
335 operation
1000 branch
1001 branch
1002 branch
1003 branch
1004 operation
1005 operation
1006 operation
1007 operation
1008 operation
1009 operation
1010 operation
1011 operation
1012 operation
1013 operation
1014 operation
1015 operation
1016 operation
1017 operation
1018 operation
1019 operation
1020 operation
1021 operation
1022 operation
1023 operation
1024 operation
1025 operation
1026 operation
1027 operation
1028 operation
1029 operation
1307 operation
1308 operation
1309 operation
1310 operation
1311 operation
1312 operation
1313 operation
1314 operation
1315 operation
1316 operation
1317 operation
1318 operation
1319 operation
1320 operation
1321 operation
1322 operation
1323 operation
1324 operation
1325 operation
1326 operation
1327 operation
1328 operation
1329 operation
1330 operation
1331 operation
1332 operation
1333 operation
1334 operation
1335 operation
1336 operation
1337 operation
1338 operation
1339 operation
1340 operation
1341 operation
1342 operation
1343 operation
1344 operation
1345 operation
1346 operation
1347 operation
1348 operation
1349 operation
1350 operation
1351 operation
1352 operation
1353 operation
1354 operation
1355 operation
1356 operation
1357 operation
1358 operation
1359 operation
1360 operation
1361 operation
1362 operation
1363 operation
1364 operation
1365 operation
1366 operation
1367 operation
1368 operation
1369 operation
1370 operation
1371 operation
1372 operation
1373 operation
1374 operation
1375 operation
1376 operation
1377 operation
1378 operation
1379 operation
1380 operation
1381 operation
1382 operation
1383 operation
1384 operation
1385 operation
1386 operation
1387 operation
1388 operation
1389 operation
1390 operation
1391 operation
1392 operation
1393 operation
1394 operation
1395 operation
1396 operation
1397 operation
1398 operation
1399 operation
1400 operation
1401 operation
1402 operation
1403 operation
1404 operation
1600 operation
1601 operation
1602 operation
1603 operation
1604 operation
2000 operation
2001 operation
2002 operation
2003 operation
2004 operation
2005 operation
2006 operation
2007 operation
2008 operation
2369 operation
2370 operation
2371 operation
2372 operation
2373 operation
2374 operation
2375 operation
2376 operation
2377 operation
2378 operation
2379 operation
2380 operation
2381 operation
2382 operation
2383 operation
2384 operation
2385 operation
2386 operation
2387 operation
2388 operation
2389 operation
2390 operation
2391 operation
2392 operation
2393 operation
2394 operation
2395 operation
2396 operation
2397 operation
2398 operation
2399 operation
2400 operation
2401 operation
2402 operation
2403 operation
2404 operation
2405 operation
2406 operation
2407 operation
2408 operation
2409 operation
2410 operation
2411 operation
2412 operation
2413 operation
2414 operation
2415 operation
2416 operation
2417 operation
2418 operation
2419 operation
2420 operation
2421 operation
2422 operation
2423 operation
2424 operation
2425 operation
2426 operation
2427 operation
2428 operation
2429 operation
2430 operation
2431 operation
2432 operation
2433 operation
2434 operation
2435 operation
2436 operation
2437 operation
2438 operation
2439 operation
2440 operation
2441 operation
2442 operation
2443 operation
2444 operation
2445 operation
3000 operation
3001 operation
3002 operation
3305 operation
4300 operation
4301 operation

	)
]

{ #category : #'instance creation' }
LoDisLowcodeInstruction class >> new: opcode [
	^ self new opcode: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> beginCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> branchAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> byteSizeOfValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callInstructionValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callPhysicalValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> checkSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> compareAndSwap32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicatePointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallNoCleanupValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failWithCodeValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstIndexableFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32AddValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32DivValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32EqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32MulValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32NotEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32SubValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToFloat64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToOopValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToUInt32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToUInt64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64AddValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64DivValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64EqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64MulValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64NotEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64SubValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToFloat32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToOopValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToUInt32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToUInt64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> freeValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexable32OopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexableOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> instructionKind [
	^ InstructionKinds at: opcode ifAbsent: [ #operation ]
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32EqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToPointerValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64EqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToPointerValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isFloatObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIndexableValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIntegerObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isPointersValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsOrBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> jumpAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> jumpValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalAddressValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectAtValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadPointerFromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpyFixedValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #printing }
LoDisLowcodeInstruction >> mnemonic [
	^ LowcodeStreamElement lowcodeMnemonicFor: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat32ToPhysicalValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat64ToPhysicalValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt32ToPhysicalValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt64ToPhysicalValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> movePointerToPhysicalValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopNotEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerReinterpretValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> plaftormCodeValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerAddOffset32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerAddOffset64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerNotEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopReinterprerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushNullPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> smallInt32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat32ToMemoryValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat64ToMemoryValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt16ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt32ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt64ToMemoryValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt8ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldAtValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storePointerToMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unpinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]
