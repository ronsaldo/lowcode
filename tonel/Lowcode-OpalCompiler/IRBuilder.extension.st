Extension { #name : #IRBuilder }

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd32 [
	self add: (IRInstruction lowcodeInstruction: 1234)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAdd64 [
	self add: (IRInstruction lowcodeInstruction: 1233)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca32 [
	self add: (IRInstruction lowcodeInstruction: 1232)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAlloca64 [
	self add: (IRInstruction lowcodeInstruction: 1231)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd32 [
	self add: (IRInstruction lowcodeInstruction: 1230)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeAnd64 [
	self add: (IRInstruction lowcodeInstruction: 1229)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 1228)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeArithmeticRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 1227)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBeginCall: a1Nalignment [
	self add: (IRInstruction lowcodeInstruction: 1226 extendA: a1Nalignment)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean32ToOop [
	self add: (IRInstruction lowcodeInstruction: 10)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeBoolean64ToOop [
	self add: (IRInstruction lowcodeInstruction: 9)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeByteSizeOf [
	self add: (IRInstruction lowcodeInstruction: 2093)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1225)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1224)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt32 [
	self add: (IRInstruction lowcodeInstruction: 1223)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentInt64 [
	self add: (IRInstruction lowcodeInstruction: 1222)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentPointer [
	self add: (IRInstruction lowcodeInstruction: 1221)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallArgumentStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 1220 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallInstruction: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1219 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCallPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1218 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCheckSessionIdentifier: a1NexpectedSession [
	self add: (IRInstruction lowcodeInstruction: 1217 extendA: a1NexpectedSession)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeCompareAndSwap32 [
	self add: (IRInstruction lowcodeInstruction: 1216)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv32 [
	self add: (IRInstruction lowcodeInstruction: 1215)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDiv64 [
	self add: (IRInstruction lowcodeInstruction: 1214)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1213)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1212)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt32 [
	self add: (IRInstruction lowcodeInstruction: 1211)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicateInt64 [
	self add: (IRInstruction lowcodeInstruction: 1210)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeDuplicatePointer [
	self add: (IRInstruction lowcodeInstruction: 1209)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress32 [
	self add: (IRInstruction lowcodeInstruction: 1208)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEffectiveAddress64 [
	self add: (IRInstruction lowcodeInstruction: 1207)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCall [
	self add: (IRInstruction lowcodeInstruction: 1206)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeEndCallNoCleanup [
	self add: (IRInstruction lowcodeInstruction: 1205)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 2092)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFirstIndexableFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 2091)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Add [
	self add: (IRInstruction lowcodeInstruction: 1204)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Div [
	self add: (IRInstruction lowcodeInstruction: 1203)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Equal [
	self add: (IRInstruction lowcodeInstruction: 1202)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Great [
	self add: (IRInstruction lowcodeInstruction: 1201)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1200)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Less [
	self add: (IRInstruction lowcodeInstruction: 1199)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1198)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Mul [
	self add: (IRInstruction lowcodeInstruction: 1197)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1196)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32Sub [
	self add: (IRInstruction lowcodeInstruction: 1195)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1194)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1193)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1192)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToOop [
	self add: (IRInstruction lowcodeInstruction: 8)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 1191)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat32ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 1190)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Add [
	self add: (IRInstruction lowcodeInstruction: 1189)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Div [
	self add: (IRInstruction lowcodeInstruction: 1188)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Equal [
	self add: (IRInstruction lowcodeInstruction: 1187)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Great [
	self add: (IRInstruction lowcodeInstruction: 1186)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1185)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Less [
	self add: (IRInstruction lowcodeInstruction: 1184)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1183)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Mul [
	self add: (IRInstruction lowcodeInstruction: 1182)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1181)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64Sub [
	self add: (IRInstruction lowcodeInstruction: 1180)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1179)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1178)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1177)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToOop [
	self add: (IRInstruction lowcodeInstruction: 7)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 1176)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFloat64ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 1175)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeFree [
	self add: (IRInstruction lowcodeInstruction: 1174)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexable32Oop [
	self add: (IRInstruction lowcodeInstruction: 1011)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateIndexableOop: a1NindexableSize [
	self add: (IRInstruction lowcodeInstruction: 1010 extendA: a1NindexableSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInstantiateOop [
	self add: (IRInstruction lowcodeInstruction: 1009)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Equal [
	self add: (IRInstruction lowcodeInstruction: 1173)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Great [
	self add: (IRInstruction lowcodeInstruction: 1172)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1171)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32Less [
	self add: (IRInstruction lowcodeInstruction: 1170)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1169)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1168)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1167)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1166)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 6)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt32ToPointer [
	self add: (IRInstruction lowcodeInstruction: 1165)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Equal [
	self add: (IRInstruction lowcodeInstruction: 1164)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Great [
	self add: (IRInstruction lowcodeInstruction: 1163)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1162)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64Less [
	self add: (IRInstruction lowcodeInstruction: 1161)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1160)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1159)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1158)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1157)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToOop [
	self add: (IRInstruction lowcodeInstruction: 5)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeInt64ToPointer [
	self add: (IRInstruction lowcodeInstruction: 1156)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsBytes [
	self add: (IRInstruction lowcodeInstruction: 2090)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsFloatObject [
	self add: (IRInstruction lowcodeInstruction: 2089)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIndexable [
	self add: (IRInstruction lowcodeInstruction: 2088)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsIntegerObject [
	self add: (IRInstruction lowcodeInstruction: 2087)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsPointers [
	self add: (IRInstruction lowcodeInstruction: 2086)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWords [
	self add: (IRInstruction lowcodeInstruction: 2085)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeIsWordsOrBytes [
	self add: (IRInstruction lowcodeInstruction: 2084)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift32 [
	self add: (IRInstruction lowcodeInstruction: 1155)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLeftShift64 [
	self add: (IRInstruction lowcodeInstruction: 1154)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1153)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadFloat64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1152)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1151)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1150)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1149)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1148)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalAddress: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1147 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1146 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1145 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1144 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1143 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1142 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1141 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1140 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1139 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1138 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1137 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadLocalUInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1136 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectAt [
	self add: (IRInstruction lowcodeInstruction: 1008)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 1007 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadPointerFromMemory [
	self add: (IRInstruction lowcodeInstruction: 1135)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1134)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1133)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1132)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLoadUInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1131)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLocalFrameSize: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 1130 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockRegisters [
	self add: (IRInstruction lowcodeInstruction: 1129)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeLockVM [
	self add: (IRInstruction lowcodeInstruction: 1128)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc32 [
	self add: (IRInstruction lowcodeInstruction: 1127)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMalloc64 [
	self add: (IRInstruction lowcodeInstruction: 1126)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy32 [
	self add: (IRInstruction lowcodeInstruction: 1125)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpy64 [
	self add: (IRInstruction lowcodeInstruction: 1124)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMemcpyFixed: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 1123 extendA: a1Nsize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1122 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveFloat64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1121 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt32ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1120 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMoveInt64ToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1119 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMovePointerToPhysical: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1118 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul32 [
	self add: (IRInstruction lowcodeInstruction: 1117)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeMul64 [
	self add: (IRInstruction lowcodeInstruction: 1116)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg32 [
	self add: (IRInstruction lowcodeInstruction: 1115)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNeg64 [
	self add: (IRInstruction lowcodeInstruction: 1114)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot32 [
	self add: (IRInstruction lowcodeInstruction: 1113)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeNot64 [
	self add: (IRInstruction lowcodeInstruction: 1112)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopEqual [
	self add: (IRInstruction lowcodeInstruction: 3008)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopNotEqual [
	self add: (IRInstruction lowcodeInstruction: 3007)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 2083)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopSmallIntegerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 2082)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean32 [
	self add: (IRInstruction lowcodeInstruction: 2081)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToBoolean64 [
	self add: (IRInstruction lowcodeInstruction: 2080)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 2079)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 2078)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt32 [
	self add: (IRInstruction lowcodeInstruction: 2077)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToInt64 [
	self add: (IRInstruction lowcodeInstruction: 2076)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointer [
	self add: (IRInstruction lowcodeInstruction: 2075)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToPointerReinterpret [
	self add: (IRInstruction lowcodeInstruction: 2074)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 2073)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOopToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 2072)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr32 [
	self add: (IRInstruction lowcodeInstruction: 1111)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeOr64 [
	self add: (IRInstruction lowcodeInstruction: 1110)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1109 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallFloat64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1108 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1107)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1106)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt32 [
	self add: (IRInstruction lowcodeInstruction: 1105)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectInt64 [
	self add: (IRInstruction lowcodeInstruction: 1104)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectPointer [
	self add: (IRInstruction lowcodeInstruction: 1103)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallIndirectStructure: a1NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 1102 extendA: a1NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt32: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1101 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallInt64: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1100 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallPointer: a1Nfunction [
	self add: (IRInstruction lowcodeInstruction: 1099 extendA: a1Nfunction)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePerformCallStructure: a1Nfunction structureSize: a2NstructureSize [
	self add: (IRInstruction lowcodeInstruction: 1098 extendA: a1Nfunction extendB: a2NstructureSize)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePin [
	self add: (IRInstruction lowcodeInstruction: 2071)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePlaftormCode [
	self add: (IRInstruction lowcodeInstruction: 1097)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset32 [
	self add: (IRInstruction lowcodeInstruction: 1096)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerAddOffset64 [
	self add: (IRInstruction lowcodeInstruction: 1095)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerEqual [
	self add: (IRInstruction lowcodeInstruction: 1094)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerNotEqual [
	self add: (IRInstruction lowcodeInstruction: 1093)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1092)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1091)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOop: a1NpointerClassLiteral [
	self add: (IRInstruction lowcodeInstruction: 4 literal: a1NpointerClassLiteral)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePointerToOopReinterprer [
	self add: (IRInstruction lowcodeInstruction: 3)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1090)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1089)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt32 [
	self add: (IRInstruction lowcodeInstruction: 1088)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopInt64 [
	self add: (IRInstruction lowcodeInstruction: 1087)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePopPointer [
	self add: (IRInstruction lowcodeInstruction: 1086)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt32: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 1085 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushConstantUInt64: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 1084 extendA: a1Nconstant)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushNullPointer [
	self add: (IRInstruction lowcodeInstruction: 1083)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne32 [
	self add: (IRInstruction lowcodeInstruction: 1082)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOne64 [
	self add: (IRInstruction lowcodeInstruction: 1081)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1080)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushOneFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1079)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1078 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalFloat64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1077 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt32: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1076 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalInt64: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1075 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushPhysicalPointer: a1NregisterID [
	self add: (IRInstruction lowcodeInstruction: 1074 extendA: a1NregisterID)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushSessionIdentifier [
	self add: (IRInstruction lowcodeInstruction: 1073)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero32 [
	self add: (IRInstruction lowcodeInstruction: 1072)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZero64 [
	self add: (IRInstruction lowcodeInstruction: 1071)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1070)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodePushZeroFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1069)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem32 [
	self add: (IRInstruction lowcodeInstruction: 1068)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRem64 [
	self add: (IRInstruction lowcodeInstruction: 1067)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 1066)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 1065)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 1064)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 1063)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 1062)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 1061)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSignExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 1060)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSmallInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 2)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1059)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreFloat64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1058)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt16ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1057)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1056)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1055)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreInt8ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1054)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1053 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1052 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1051 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1050 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1049 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1048 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1047 extendA: a1NbaseOffset)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 3006 extendA: a1NfieldIndex)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStoreObjectFieldAt [
	self add: (IRInstruction lowcodeInstruction: 3005)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeStorePointerToMemory [
	self add: (IRInstruction lowcodeInstruction: 1046)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub32 [
	self add: (IRInstruction lowcodeInstruction: 1045)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeSub64 [
	self add: (IRInstruction lowcodeInstruction: 1044)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To16 [
	self add: (IRInstruction lowcodeInstruction: 1043)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate32To8 [
	self add: (IRInstruction lowcodeInstruction: 1042)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To16 [
	self add: (IRInstruction lowcodeInstruction: 1041)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To32 [
	self add: (IRInstruction lowcodeInstruction: 1040)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeTruncate64To8 [
	self add: (IRInstruction lowcodeInstruction: 1039)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv32 [
	self add: (IRInstruction lowcodeInstruction: 1038)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUdiv64 [
	self add: (IRInstruction lowcodeInstruction: 1037)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Great [
	self add: (IRInstruction lowcodeInstruction: 1036)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1035)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32Less [
	self add: (IRInstruction lowcodeInstruction: 1034)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1033)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1032)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1031)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint32ToOop [
	self add: (IRInstruction lowcodeInstruction: 1)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Great [
	self add: (IRInstruction lowcodeInstruction: 1030)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1029)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64Less [
	self add: (IRInstruction lowcodeInstruction: 1028)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1027)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1026)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1025)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUint64ToOop [
	self add: (IRInstruction lowcodeInstruction: 0)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul32 [
	self add: (IRInstruction lowcodeInstruction: 1024)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUmul64 [
	self add: (IRInstruction lowcodeInstruction: 1023)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockRegisters [
	self add: (IRInstruction lowcodeInstruction: 1022)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnlockVM [
	self add: (IRInstruction lowcodeInstruction: 1021)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUnpin [
	self add: (IRInstruction lowcodeInstruction: 2070)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem32 [
	self add: (IRInstruction lowcodeInstruction: 1020)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeUrem64 [
	self add: (IRInstruction lowcodeInstruction: 1019)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor32 [
	self add: (IRInstruction lowcodeInstruction: 1018)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeXor64 [
	self add: (IRInstruction lowcodeInstruction: 1017)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 1016)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 1015)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 1014)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 1013)
]

{ #category : #'*Lowcode-OpalCompiler' }
IRBuilder >> lowcodeZeroExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 1012)
]
