Extension { #name : #IRBuilder }

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd32 [
	self add: (IRInstruction lowcodeInstruction: 234)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd64 [
	self add: (IRInstruction lowcodeInstruction: 233)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca32 [
	self add: (IRInstruction lowcodeInstruction: 232)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca64 [
	self add: (IRInstruction lowcodeInstruction: 231)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd32 [
	self add: (IRInstruction lowcodeInstruction: 230)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd64 [
	self add: (IRInstruction lowcodeInstruction: 229)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 228)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 227)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBeginCall: a1Nalignment [
	self add: (IRInstruction lowcodeInstruction: 226 extendA: a1Nalignment)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1010)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1009)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBranchFalse32: a1Ndest [
	self add: (IRInstruction lowcodeInstruction: 225 label: a1Ndest)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBranchFalse64: a1Ndest [
	self add: (IRInstruction lowcodeInstruction: 224 label: a1Ndest)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBranchTrue32: a1Ndest [
	self add: (IRInstruction lowcodeInstruction: 223 label: a1Ndest)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBranchTrue64: a1Ndest [
	self add: (IRInstruction lowcodeInstruction: 222 label: a1Ndest)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeByteSizeOf [
	self add: (IRInstruction lowcodeInstruction: 32023)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat32 [
	self add: (IRInstruction lowcodeInstruction: 221)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat64 [
	self add: (IRInstruction lowcodeInstruction: 220)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt32 [
	self add: (IRInstruction lowcodeInstruction: 219)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt64 [
	self add: (IRInstruction lowcodeInstruction: 218)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentPointer [
	self add: (IRInstruction lowcodeInstruction: 217)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 216 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallInstruction: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 215 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 214 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCheckSessionIdentifier: a1NexpectedSession [
	self add: (IRInstruction lowcodeInstruction: 213 extendA: a1NexpectedSession)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCompareAndSwap32 [
	self add: (IRInstruction lowcodeInstruction: 212)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv32 [
	self add: (IRInstruction lowcodeInstruction: 211)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv64 [
	self add: (IRInstruction lowcodeInstruction: 210)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat32 [
	self add: (IRInstruction lowcodeInstruction: 209)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat64 [
	self add: (IRInstruction lowcodeInstruction: 208)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt32 [
	self add: (IRInstruction lowcodeInstruction: 207)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt64 [
	self add: (IRInstruction lowcodeInstruction: 206)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicatePointer [
	self add: (IRInstruction lowcodeInstruction: 205)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress32 [
	self add: (IRInstruction lowcodeInstruction: 204)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress64 [
	self add: (IRInstruction lowcodeInstruction: 203)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCall [
	self add: (IRInstruction lowcodeInstruction: 202)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCallNoCleanup [
	self add: (IRInstruction lowcodeInstruction: 201)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFail [
	self add: (IRInstruction lowcodeInstruction: 200)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFailWithCode: a1NerrorCode [
	self add: (IRInstruction lowcodeInstruction: 199 extendA: a1NerrorCode)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 32022)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstIndexableFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 32021)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Add [
	self add: (IRInstruction lowcodeInstruction: 198)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Div [
	self add: (IRInstruction lowcodeInstruction: 197)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Equal [
	self add: (IRInstruction lowcodeInstruction: 196)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Great [
	self add: (IRInstruction lowcodeInstruction: 195)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 194)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Less [
	self add: (IRInstruction lowcodeInstruction: 193)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 192)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Mul [
	self add: (IRInstruction lowcodeInstruction: 191)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 190)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Sub [
	self add: (IRInstruction lowcodeInstruction: 189)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 188)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 187)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 186)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1008)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 185)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 184)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Add [
	self add: (IRInstruction lowcodeInstruction: 183)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Div [
	self add: (IRInstruction lowcodeInstruction: 182)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Equal [
	self add: (IRInstruction lowcodeInstruction: 181)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Great [
	self add: (IRInstruction lowcodeInstruction: 180)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 179)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Less [
	self add: (IRInstruction lowcodeInstruction: 178)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 177)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Mul [
	self add: (IRInstruction lowcodeInstruction: 176)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 175)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Sub [
	self add: (IRInstruction lowcodeInstruction: 174)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 173)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 172)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 171)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1007)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 170)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 169)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFree [
	self add: (IRInstruction lowcodeInstruction: 168)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexable32Oop [
	self add: (IRInstruction lowcodeInstruction: 4)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexableOop: a1NindexableSize [
	self add: (IRInstruction lowcodeInstruction: 3 extendA: a1NindexableSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateOop [
	self add: (IRInstruction lowcodeInstruction: 2)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Equal [
	self add: (IRInstruction lowcodeInstruction: 167)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Great [
	self add: (IRInstruction lowcodeInstruction: 166)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 165)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Less [
	self add: (IRInstruction lowcodeInstruction: 164)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 163)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 162)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 161)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 160)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1006)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToPointer [
	self add: (IRInstruction lowcodeInstruction: 159)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Equal [
	self add: (IRInstruction lowcodeInstruction: 158)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Great [
	self add: (IRInstruction lowcodeInstruction: 157)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 156)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Less [
	self add: (IRInstruction lowcodeInstruction: 155)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 154)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 153)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 152)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 151)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1005)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToPointer [
	self add: (IRInstruction lowcodeInstruction: 150)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsBytes [
	self add: (IRInstruction lowcodeInstruction: 32020)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsFloatObject [
	self add: (IRInstruction lowcodeInstruction: 32019)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIndexable [
	self add: (IRInstruction lowcodeInstruction: 32018)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIntegerObject [
	self add: (IRInstruction lowcodeInstruction: 32017)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsPointers [
	self add: (IRInstruction lowcodeInstruction: 32016)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWords [
	self add: (IRInstruction lowcodeInstruction: 32015)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWordsOrBytes [
	self add: (IRInstruction lowcodeInstruction: 32014)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeJump: a1Ndest [
	self add: (IRInstruction lowcodeInstruction: 149 label: a1Ndest)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift32 [
	self add: (IRInstruction lowcodeInstruction: 148)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift64 [
	self add: (IRInstruction lowcodeInstruction: 147)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 146)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 145)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 144)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 143)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 142)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 141)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalAddress: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 140 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 139 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 138 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 137 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 136 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 135 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 134 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 133 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 132 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 131 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 130 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 129 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectAt [
	self add: (IRInstruction lowcodeInstruction: 1)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 0 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadPointerFromMemory [
	self add: (IRInstruction lowcodeInstruction: 128)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 127)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 126)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 125)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 124)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLocalFrameSize: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 123 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockRegisters [
	self add: (IRInstruction lowcodeInstruction: 122)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockVM [
	self add: (IRInstruction lowcodeInstruction: 121)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc32 [
	self add: (IRInstruction lowcodeInstruction: 120)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc64 [
	self add: (IRInstruction lowcodeInstruction: 119)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy32 [
	self add: (IRInstruction lowcodeInstruction: 118)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy64 [
	self add: (IRInstruction lowcodeInstruction: 117)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpyFixed: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 116 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 115 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 114 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 113 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 112 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMovePointerToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 111 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul32 [
	self add: (IRInstruction lowcodeInstruction: 110)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul64 [
	self add: (IRInstruction lowcodeInstruction: 109)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg32 [
	self add: (IRInstruction lowcodeInstruction: 108)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg64 [
	self add: (IRInstruction lowcodeInstruction: 107)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot32 [
	self add: (IRInstruction lowcodeInstruction: 106)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot64 [
	self add: (IRInstruction lowcodeInstruction: 105)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopEqual [
	self add: (IRInstruction lowcodeInstruction: 31004)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopNotEqual [
	self add: (IRInstruction lowcodeInstruction: 31003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 32013)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 32012)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean32 [
	self add: (IRInstruction lowcodeInstruction: 32011)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean64 [
	self add: (IRInstruction lowcodeInstruction: 32010)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 32009)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 32008)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt32 [
	self add: (IRInstruction lowcodeInstruction: 32007)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt64 [
	self add: (IRInstruction lowcodeInstruction: 32006)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointer [
	self add: (IRInstruction lowcodeInstruction: 32005)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointerReinterpret [
	self add: (IRInstruction lowcodeInstruction: 32004)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 32003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 32002)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr32 [
	self add: (IRInstruction lowcodeInstruction: 104)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr64 [
	self add: (IRInstruction lowcodeInstruction: 103)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 102 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 101 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat32 [
	self add: (IRInstruction lowcodeInstruction: 100)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat64 [
	self add: (IRInstruction lowcodeInstruction: 99)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt32 [
	self add: (IRInstruction lowcodeInstruction: 98)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt64 [
	self add: (IRInstruction lowcodeInstruction: 97)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectPointer [
	self add: (IRInstruction lowcodeInstruction: 96)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 95 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 94 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 93 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallPointer: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 92 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 91 extendA: a1Nfunction extendB: a2NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePin [
	self add: (IRInstruction lowcodeInstruction: 32001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePlaftormCode [
	self add: (IRInstruction lowcodeInstruction: 90)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset32 [
	self add: (IRInstruction lowcodeInstruction: 89)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset64 [
	self add: (IRInstruction lowcodeInstruction: 88)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerEqual [
	self add: (IRInstruction lowcodeInstruction: 87)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerNotEqual [
	self add: (IRInstruction lowcodeInstruction: 86)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 85)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 84)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOop: a1NpointerClassLiteral [
	self add: (IRInstruction lowcodeInstruction: 1004 extendA: a1NpointerClassLiteral)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOopReinterprer [
	self add: (IRInstruction lowcodeInstruction: 1003)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat32 [
	self add: (IRInstruction lowcodeInstruction: 83)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat64 [
	self add: (IRInstruction lowcodeInstruction: 82)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt32 [
	self add: (IRInstruction lowcodeInstruction: 81)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt64 [
	self add: (IRInstruction lowcodeInstruction: 80)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopPointer [
	self add: (IRInstruction lowcodeInstruction: 79)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt32: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 78 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt64: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 77 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushNullPointer [
	self add: (IRInstruction lowcodeInstruction: 76)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne32 [
	self add: (IRInstruction lowcodeInstruction: 75)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne64 [
	self add: (IRInstruction lowcodeInstruction: 74)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat32 [
	self add: (IRInstruction lowcodeInstruction: 73)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat64 [
	self add: (IRInstruction lowcodeInstruction: 72)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 71 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 70 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 69 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 68 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalPointer: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 67 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushSessionIdentifier [
	self add: (IRInstruction lowcodeInstruction: 66)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero32 [
	self add: (IRInstruction lowcodeInstruction: 65)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero64 [
	self add: (IRInstruction lowcodeInstruction: 64)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat32 [
	self add: (IRInstruction lowcodeInstruction: 63)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat64 [
	self add: (IRInstruction lowcodeInstruction: 62)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem32 [
	self add: (IRInstruction lowcodeInstruction: 61)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem64 [
	self add: (IRInstruction lowcodeInstruction: 60)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 59)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 58)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 57)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 56)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 55)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 54)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 53)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSmallInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1002)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 52)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 51)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt16ToMemory [
	self add: (IRInstruction lowcodeInstruction: 50)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 49)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 48)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt8ToMemory [
	self add: (IRInstruction lowcodeInstruction: 47)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 46 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 45 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 44 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 43 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 42 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 41 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 40 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 31002 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectFieldAt [
	self add: (IRInstruction lowcodeInstruction: 31001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStorePointerToMemory [
	self add: (IRInstruction lowcodeInstruction: 39)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub32 [
	self add: (IRInstruction lowcodeInstruction: 38)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub64 [
	self add: (IRInstruction lowcodeInstruction: 37)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To16 [
	self add: (IRInstruction lowcodeInstruction: 36)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To8 [
	self add: (IRInstruction lowcodeInstruction: 35)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To16 [
	self add: (IRInstruction lowcodeInstruction: 34)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To32 [
	self add: (IRInstruction lowcodeInstruction: 33)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To8 [
	self add: (IRInstruction lowcodeInstruction: 32)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv32 [
	self add: (IRInstruction lowcodeInstruction: 31)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv64 [
	self add: (IRInstruction lowcodeInstruction: 30)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Great [
	self add: (IRInstruction lowcodeInstruction: 29)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 28)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Less [
	self add: (IRInstruction lowcodeInstruction: 27)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 26)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 25)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 24)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1001)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Great [
	self add: (IRInstruction lowcodeInstruction: 23)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 22)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Less [
	self add: (IRInstruction lowcodeInstruction: 21)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 20)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 19)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 18)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1000)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul32 [
	self add: (IRInstruction lowcodeInstruction: 17)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul64 [
	self add: (IRInstruction lowcodeInstruction: 16)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockRegisters [
	self add: (IRInstruction lowcodeInstruction: 15)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockVM [
	self add: (IRInstruction lowcodeInstruction: 14)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnpin [
	self add: (IRInstruction lowcodeInstruction: 32000)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem32 [
	self add: (IRInstruction lowcodeInstruction: 13)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem64 [
	self add: (IRInstruction lowcodeInstruction: 12)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor32 [
	self add: (IRInstruction lowcodeInstruction: 11)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor64 [
	self add: (IRInstruction lowcodeInstruction: 10)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 9)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 8)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 7)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 6)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 5)
]
