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
			7 beginCall
			8 callInstruction
			9 callPhysical
			10 checkSessionIdentifier
			11 endCall
			12 endCallNoCleanup
			13 fail
			14 failWithCode
			15 jump
			16 loadLocalAddress
			17 loadLocalFloat32
			18 loadLocalFloat64
			19 loadLocalInt16
			20 loadLocalInt32
			21 loadLocalInt64
			22 loadLocalInt8
			23 loadLocalPointer
			24 loadLocalUInt16
			25 loadLocalUInt32
			26 loadLocalUInt64
			27 loadLocalUInt8
			28 lockRegisters
			29 lockVM
			30 performCallFloat32
			31 performCallFloat64
			32 performCallInt32
			33 performCallInt64
			34 performCallPointer
			35 plaftormCode
			36 pushConstantUInt32
			37 pushConstantUInt64
			38 pushNullPointer
			39 pushOne32
			40 pushOne64
			41 pushOneFloat32
			42 pushOneFloat64
			43 pushPhysicalFloat32
			44 pushPhysicalFloat64
			45 pushPhysicalInt32
			46 pushPhysicalInt64
			47 pushPhysicalPointer
			48 pushSessionIdentifier
			49 pushZero32
			50 pushZero64
			51 pushZeroFloat32
			52 pushZeroFloat64
			53 unlockRegisters
			54 unlockVM
			1069 alloca32
			1070 alloca64
			1071 boolean32ToOop
			1072 boolean64ToOop
			1073 branchFalse32
			1074 branchFalse64
			1075 branchTrue32
			1076 branchTrue64
			1077 byteSizeOf
			1078 callArgumentFloat32
			1079 callArgumentFloat64
			1080 callArgumentInt32
			1081 callArgumentInt64
			1082 callArgumentPointer
			1083 callArgumentStructure
			1084 duplicateFloat32
			1085 duplicateFloat64
			1086 duplicateInt32
			1087 duplicateInt64
			1088 duplicatePointer
			1089 firstFieldPointer
			1090 firstIndexableFieldPointer
			1091 float32ToFloat64
			1092 float32ToInt32
			1093 float32ToInt64
			1094 float32ToOop
			1095 float32ToUInt32
			1096 float32ToUInt64
			1097 float64ToFloat32
			1098 float64ToInt32
			1099 float64ToInt64
			1100 float64ToOop
			1101 float64ToUInt32
			1102 float64ToUInt64
			1103 free
			1104 instantiateIndexableOop
			1105 instantiateOop
			1106 int32ToFloat32
			1107 int32ToFloat64
			1108 int32ToOop
			1109 int32ToPointer
			1110 int64ToFloat32
			1111 int64ToFloat64
			1112 int64ToOop
			1113 int64ToPointer
			1114 isBytes
			1115 isFloatObject
			1116 isIndexable
			1117 isIntegerObject
			1118 isPointers
			1119 isWords
			1120 isWordsOrBytes
			1121 loadFloat32FromMemory
			1122 loadFloat64FromMemory
			1123 loadInt16FromMemory
			1124 loadInt32FromMemory
			1125 loadInt64FromMemory
			1126 loadInt8FromMemory
			1127 loadObjectField
			1128 loadPointerFromMemory
			1129 loadUInt16FromMemory
			1130 loadUInt32FromMemory
			1131 loadUInt64FromMemory
			1132 loadUInt8FromMemory
			1133 malloc32
			1134 malloc64
			1135 moveFloat32ToPhysical
			1136 moveFloat64ToPhysical
			1137 moveInt32ToPhysical
			1138 moveInt64ToPhysical
			1139 movePointerToPhysical
			1140 neg32
			1141 neg64
			1142 not32
			1143 not64
			1144 oopSmallIntegerToInt32
			1145 oopSmallIntegerToInt64
			1146 oopToBoolean32
			1147 oopToBoolean64
			1148 oopToFloat32
			1149 oopToFloat64
			1150 oopToInt32
			1151 oopToInt64
			1152 oopToPointer
			1153 oopToPointerReinterpret
			1154 oopToUInt32
			1155 oopToUInt64
			1156 performCallIndirectFloat32
			1157 performCallIndirectFloat64
			1158 performCallIndirectInt32
			1159 performCallIndirectInt64
			1160 performCallIndirectPointer
			1161 performCallStructure
			1162 pin
			1163 pointerToInt32
			1164 pointerToInt64
			1165 pointerToOop
			1166 pointerToOopReinterprer
			1167 popFloat32
			1168 popFloat64
			1169 popInt32
			1170 popInt64
			1171 popPointer
			1172 signExtend32From16
			1173 signExtend32From8
			1174 signExtend64From16
			1175 signExtend64From32
			1176 signExtend64From8
			1177 smallInt32ToOop
			1178 storeLocalFloat32
			1179 storeLocalFloat64
			1180 storeLocalInt16
			1181 storeLocalInt32
			1182 storeLocalInt64
			1183 storeLocalInt8
			1184 storeLocalPointer
			1185 truncate32To16
			1186 truncate32To8
			1187 truncate64To16
			1188 truncate64To32
			1189 truncate64To8
			1190 uint32ToFloat32
			1191 uint32ToFloat64
			1192 uint32ToOop
			1193 uint64ToFloat32
			1194 uint64ToFloat64
			1195 uint64ToOop
			1196 unpin
			1197 zeroExtend32From16
			1198 zeroExtend32From8
			1199 zeroExtend64From16
			1200 zeroExtend64From32
			1201 zeroExtend64From8
			2005 add32
			2006 add64
			2007 and32
			2008 and64
			2009 arithmeticRightShift32
			2010 arithmeticRightShift64
			2011 div32
			2012 div64
			2013 float32Add
			2014 float32Div
			2015 float32Equal
			2016 float32Great
			2017 float32GreatEqual
			2018 float32Less
			2019 float32LessEqual
			2020 float32Mul
			2021 float32NotEqual
			2022 float32Sub
			2023 float64Add
			2024 float64Div
			2025 float64Equal
			2026 float64Great
			2027 float64GreatEqual
			2028 float64Less
			2029 float64LessEqual
			2030 float64Mul
			2031 float64NotEqual
			2032 float64Sub
			2033 instantiateIndexable32Oop
			2034 int32Equal
			2035 int32Great
			2036 int32GreatEqual
			2037 int32Less
			2038 int32LessEqual
			2039 int32NotEqual
			2040 int64Equal
			2041 int64Great
			2042 int64GreatEqual
			2043 int64Less
			2044 int64LessEqual
			2045 int64NotEqual
			2046 leftShift32
			2047 leftShift64
			2048 loadObjectAt
			2049 memcpyFixed
			2050 mul32
			2051 mul64
			2052 oopEqual
			2053 oopNotEqual
			2054 or32
			2055 or64
			2056 performCallIndirectStructure
			2057 pointerAddOffset32
			2058 pointerAddOffset64
			2059 pointerEqual
			2060 pointerNotEqual
			2061 rem32
			2062 rem64
			2063 rightShift32
			2064 rightShift64
			2065 storeFloat32ToMemory
			2066 storeFloat64ToMemory
			2067 storeInt16ToMemory
			2068 storeInt32ToMemory
			2069 storeInt64ToMemory
			2070 storeInt8ToMemory
			2071 storeObjectField
			2072 storePointerToMemory
			2073 sub32
			2074 sub64
			2075 udiv32
			2076 udiv64
			2077 uint32Great
			2078 uint32GreatEqual
			2079 uint32Less
			2080 uint32LessEqual
			2081 uint64Great
			2082 uint64GreatEqual
			2083 uint64Less
			2084 uint64LessEqual
			2085 umul32
			2086 umul64
			2087 urem32
			2088 urem64
			2089 xor32
			2090 xor64
			3000 compareAndSwap32
			3001 memcpy32
			3002 memcpy64
			3003 storeObjectFieldAt
			4000 effectiveAddress32
			4001 effectiveAddress64
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
