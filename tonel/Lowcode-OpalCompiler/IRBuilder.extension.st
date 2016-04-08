Extension { #name : #IRBuilder }

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd32 [
	self add: (IRInstruction lowcodeInstruction: 32000)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd64 [
	self add: (IRInstruction lowcodeInstruction: 32001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca32 [
	self add: (IRInstruction lowcodeInstruction: 32002)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca64 [
	self add: (IRInstruction lowcodeInstruction: 32003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd32 [
	self add: (IRInstruction lowcodeInstruction: 32004)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd64 [
	self add: (IRInstruction lowcodeInstruction: 32005)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 32006)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 32007)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBeginCall: a1Nalignment [
	self add: (IRInstruction lowcodeInstruction: 32008 extendA: a1Nalignment)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean32ToOop [
	self add: (IRInstruction lowcodeInstruction: 0)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeByteSizeOf [
	self add: (IRInstruction lowcodeInstruction: 31000)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32009)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32010)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt32 [
	self add: (IRInstruction lowcodeInstruction: 32011)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt64 [
	self add: (IRInstruction lowcodeInstruction: 32012)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentPointer [
	self add: (IRInstruction lowcodeInstruction: 32013)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 32014 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallInstruction: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32015 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32016 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCheckSessionIdentifier: a1NexpectedSession [
	self add: (IRInstruction lowcodeInstruction: 32017 extendA: a1NexpectedSession)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCompareAndSwap32 [
	self add: (IRInstruction lowcodeInstruction: 32018)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv32 [
	self add: (IRInstruction lowcodeInstruction: 32019)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv64 [
	self add: (IRInstruction lowcodeInstruction: 32020)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32021)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32022)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt32 [
	self add: (IRInstruction lowcodeInstruction: 32023)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt64 [
	self add: (IRInstruction lowcodeInstruction: 32024)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicatePointer [
	self add: (IRInstruction lowcodeInstruction: 32025)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress32 [
	self add: (IRInstruction lowcodeInstruction: 32026)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress64 [
	self add: (IRInstruction lowcodeInstruction: 32027)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCall [
	self add: (IRInstruction lowcodeInstruction: 32028)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCallNoCleanup [
	self add: (IRInstruction lowcodeInstruction: 32029)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 31001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstIndexableFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 31002)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Add [
	self add: (IRInstruction lowcodeInstruction: 32030)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Div [
	self add: (IRInstruction lowcodeInstruction: 32031)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Equal [
	self add: (IRInstruction lowcodeInstruction: 32032)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Great [
	self add: (IRInstruction lowcodeInstruction: 32033)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32034)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Less [
	self add: (IRInstruction lowcodeInstruction: 32035)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32036)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Mul [
	self add: (IRInstruction lowcodeInstruction: 32037)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 32038)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Sub [
	self add: (IRInstruction lowcodeInstruction: 32039)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32040)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 32041)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 32042)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToOop [
	self add: (IRInstruction lowcodeInstruction: 2)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 32043)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 32044)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Add [
	self add: (IRInstruction lowcodeInstruction: 32045)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Div [
	self add: (IRInstruction lowcodeInstruction: 32046)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Equal [
	self add: (IRInstruction lowcodeInstruction: 32047)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Great [
	self add: (IRInstruction lowcodeInstruction: 32048)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32049)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Less [
	self add: (IRInstruction lowcodeInstruction: 32050)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32051)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Mul [
	self add: (IRInstruction lowcodeInstruction: 32052)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 32053)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Sub [
	self add: (IRInstruction lowcodeInstruction: 32054)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32055)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 32056)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 32057)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToOop [
	self add: (IRInstruction lowcodeInstruction: 3)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 32058)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 32059)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFree [
	self add: (IRInstruction lowcodeInstruction: 32060)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexable32Oop [
	self add: (IRInstruction lowcodeInstruction: 32223)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexableOop: a1NindexableSize [
	self add: (IRInstruction lowcodeInstruction: 32224 extendA: a1NindexableSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateOop [
	self add: (IRInstruction lowcodeInstruction: 32225)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Equal [
	self add: (IRInstruction lowcodeInstruction: 32061)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Great [
	self add: (IRInstruction lowcodeInstruction: 32062)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32063)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Less [
	self add: (IRInstruction lowcodeInstruction: 32064)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32065)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 32066)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32067)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32068)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 4)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToPointer [
	self add: (IRInstruction lowcodeInstruction: 32069)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Equal [
	self add: (IRInstruction lowcodeInstruction: 32070)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Great [
	self add: (IRInstruction lowcodeInstruction: 32071)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32072)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Less [
	self add: (IRInstruction lowcodeInstruction: 32073)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32074)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 32075)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32076)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32077)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToOop [
	self add: (IRInstruction lowcodeInstruction: 5)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToPointer [
	self add: (IRInstruction lowcodeInstruction: 32078)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsBytes [
	self add: (IRInstruction lowcodeInstruction: 31003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsFloatObject [
	self add: (IRInstruction lowcodeInstruction: 31004)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIndexable [
	self add: (IRInstruction lowcodeInstruction: 31005)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIntegerObject [
	self add: (IRInstruction lowcodeInstruction: 31006)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsPointers [
	self add: (IRInstruction lowcodeInstruction: 31007)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWords [
	self add: (IRInstruction lowcodeInstruction: 31008)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWordsOrBytes [
	self add: (IRInstruction lowcodeInstruction: 31009)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift32 [
	self add: (IRInstruction lowcodeInstruction: 32079)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift64 [
	self add: (IRInstruction lowcodeInstruction: 32080)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32081)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32082)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32083)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32084)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32085)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32086)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalAddress: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32087 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32088 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32089 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32090 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32091 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32092 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32093 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32094 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32095 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32096 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32097 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32098 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectAt [
	self add: (IRInstruction lowcodeInstruction: 32226)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 32227 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadPointerFromMemory [
	self add: (IRInstruction lowcodeInstruction: 32099)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32100)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32101)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32102)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 32103)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLocalFrameSize: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 32104 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockRegisters [
	self add: (IRInstruction lowcodeInstruction: 32105)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockVM [
	self add: (IRInstruction lowcodeInstruction: 32106)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc32 [
	self add: (IRInstruction lowcodeInstruction: 32107)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc64 [
	self add: (IRInstruction lowcodeInstruction: 32108)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy32 [
	self add: (IRInstruction lowcodeInstruction: 32109)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy64 [
	self add: (IRInstruction lowcodeInstruction: 32110)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpyFixed: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 32111 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32112 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32113 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32114 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32115 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMovePointerToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32116 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul32 [
	self add: (IRInstruction lowcodeInstruction: 32117)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul64 [
	self add: (IRInstruction lowcodeInstruction: 32118)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg32 [
	self add: (IRInstruction lowcodeInstruction: 32119)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg64 [
	self add: (IRInstruction lowcodeInstruction: 32120)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot32 [
	self add: (IRInstruction lowcodeInstruction: 32121)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot64 [
	self add: (IRInstruction lowcodeInstruction: 32122)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopEqual [
	self add: (IRInstruction lowcodeInstruction: 30000)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopNotEqual [
	self add: (IRInstruction lowcodeInstruction: 30001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 31010)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 31011)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean32 [
	self add: (IRInstruction lowcodeInstruction: 31012)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean64 [
	self add: (IRInstruction lowcodeInstruction: 31013)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 31014)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 31015)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt32 [
	self add: (IRInstruction lowcodeInstruction: 31016)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt64 [
	self add: (IRInstruction lowcodeInstruction: 31017)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointer [
	self add: (IRInstruction lowcodeInstruction: 31018)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointerReinterpret [
	self add: (IRInstruction lowcodeInstruction: 31019)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 31020)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 31021)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr32 [
	self add: (IRInstruction lowcodeInstruction: 32123)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr64 [
	self add: (IRInstruction lowcodeInstruction: 32124)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32125 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32126 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32127)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32128)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt32 [
	self add: (IRInstruction lowcodeInstruction: 32129)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt64 [
	self add: (IRInstruction lowcodeInstruction: 32130)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectPointer [
	self add: (IRInstruction lowcodeInstruction: 32131)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 32132 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32133 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32134 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallPointer: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 32135 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 32136 extendA: a1Nfunction extendB: a2NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePin [
	self add: (IRInstruction lowcodeInstruction: 31022)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePlaftormCode [
	self add: (IRInstruction lowcodeInstruction: 32137)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset32 [
	self add: (IRInstruction lowcodeInstruction: 32138)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset64 [
	self add: (IRInstruction lowcodeInstruction: 32139)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerEqual [
	self add: (IRInstruction lowcodeInstruction: 32140)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerNotEqual [
	self add: (IRInstruction lowcodeInstruction: 32141)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 32142)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 32143)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOop: a1NpointerClassLiteral [
	self add: (IRInstruction lowcodeInstruction: 6 literal: a1NpointerClassLiteral)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOopReinterprer [
	self add: (IRInstruction lowcodeInstruction: 7)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32144)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32145)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt32 [
	self add: (IRInstruction lowcodeInstruction: 32146)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt64 [
	self add: (IRInstruction lowcodeInstruction: 32147)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopPointer [
	self add: (IRInstruction lowcodeInstruction: 32148)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt32: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 32149 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt64: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 32150 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushNullPointer [
	self add: (IRInstruction lowcodeInstruction: 32151)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne32 [
	self add: (IRInstruction lowcodeInstruction: 32152)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne64 [
	self add: (IRInstruction lowcodeInstruction: 32153)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32154)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32155)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32156 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32157 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32158 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32159 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalPointer: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 32160 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushSessionIdentifier [
	self add: (IRInstruction lowcodeInstruction: 32161)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero32 [
	self add: (IRInstruction lowcodeInstruction: 32162)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero64 [
	self add: (IRInstruction lowcodeInstruction: 32163)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32164)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32165)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem32 [
	self add: (IRInstruction lowcodeInstruction: 32166)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem64 [
	self add: (IRInstruction lowcodeInstruction: 32167)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 32168)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 32169)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 32170)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 32171)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 32172)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 32173)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 32174)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSmallInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 8)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32175)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32176)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt16ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32177)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32178)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32179)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt8ToMemory [
	self add: (IRInstruction lowcodeInstruction: 32180)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32181 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32182 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32183 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32184 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32185 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32186 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 32187 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 30002 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectFieldAt [
	self add: (IRInstruction lowcodeInstruction: 30003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStorePointerToMemory [
	self add: (IRInstruction lowcodeInstruction: 32188)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub32 [
	self add: (IRInstruction lowcodeInstruction: 32189)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub64 [
	self add: (IRInstruction lowcodeInstruction: 32190)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To16 [
	self add: (IRInstruction lowcodeInstruction: 32191)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To8 [
	self add: (IRInstruction lowcodeInstruction: 32192)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To16 [
	self add: (IRInstruction lowcodeInstruction: 32193)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To32 [
	self add: (IRInstruction lowcodeInstruction: 32194)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To8 [
	self add: (IRInstruction lowcodeInstruction: 32195)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv32 [
	self add: (IRInstruction lowcodeInstruction: 32196)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv64 [
	self add: (IRInstruction lowcodeInstruction: 32197)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Great [
	self add: (IRInstruction lowcodeInstruction: 32198)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32199)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Less [
	self add: (IRInstruction lowcodeInstruction: 32200)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32201)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32202)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32203)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToOop [
	self add: (IRInstruction lowcodeInstruction: 9)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Great [
	self add: (IRInstruction lowcodeInstruction: 32204)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 32205)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Less [
	self add: (IRInstruction lowcodeInstruction: 32206)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 32207)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32208)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32209)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToOop [
	self add: (IRInstruction lowcodeInstruction: 10)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul32 [
	self add: (IRInstruction lowcodeInstruction: 32210)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul64 [
	self add: (IRInstruction lowcodeInstruction: 32211)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockRegisters [
	self add: (IRInstruction lowcodeInstruction: 32212)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockVM [
	self add: (IRInstruction lowcodeInstruction: 32213)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnpin [
	self add: (IRInstruction lowcodeInstruction: 31023)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem32 [
	self add: (IRInstruction lowcodeInstruction: 32214)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem64 [
	self add: (IRInstruction lowcodeInstruction: 32215)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor32 [
	self add: (IRInstruction lowcodeInstruction: 32216)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor64 [
	self add: (IRInstruction lowcodeInstruction: 32217)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 32218)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 32219)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 32220)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 32221)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 32222)
]
