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
			3 checkSessionIdentifier
			4 endCall
			5 endCallNoCleanup
			6 fail
			7 failWithCode
			8 jump
			9 loadLocalAddress
			10 loadLocalFloat32
			11 loadLocalFloat64
			12 loadLocalInt16
			13 loadLocalInt32
			14 loadLocalInt64
			15 loadLocalInt8
			16 loadLocalPointer
			17 loadLocalUInt16
			18 loadLocalUInt32
			19 loadLocalUInt64
			20 loadLocalUInt8
			21 lockRegisters
			22 lockVM
			23 performCallFloat32
			24 performCallFloat64
			25 performCallInt32
			26 performCallInt64
			27 performCallPointer
			28 plaftormCode
			29 pushConstantUInt32
			30 pushConstantUInt64
			31 pushNullPointer
			32 pushOne32
			33 pushOne64
			34 pushOneFloat32
			35 pushOneFloat64
			36 pushPhysicalFloat32
			37 pushPhysicalFloat64
			38 pushPhysicalInt32
			39 pushPhysicalInt64
			40 pushPhysicalPointer
			41 pushSessionIdentifier
			42 pushZero32
			43 pushZero64
			44 pushZeroFloat32
			45 pushZeroFloat64
			46 unlockRegisters
			47 unlockVM
			1007 alloca32
			1008 alloca64
			1009 boolean32ToOop
			1010 boolean64ToOop
			1011 branchFalse32
			1012 branchFalse64
			1013 branchTrue32
			1014 branchTrue64
			1015 byteSizeOf
			1016 callArgumentFloat32
			1017 callArgumentFloat64
			1018 callArgumentInt32
			1019 callArgumentInt64
			1020 callArgumentPointer
			1021 callArgumentStructure
			1022 duplicateFloat32
			1023 duplicateFloat64
			1024 duplicateInt32
			1025 duplicateInt64
			1026 duplicatePointer
			1027 firstFieldPointer
			1028 firstIndexableFieldPointer
			1029 float32ToFloat64
			1030 float32ToInt32
			1031 float32ToInt64
			1032 float32ToOop
			1033 float32ToUInt32
			1034 float32ToUInt64
			1035 float64ToFloat32
			1036 float64ToInt32
			1037 float64ToInt64
			1038 float64ToOop
			1039 float64ToUInt32
			1040 float64ToUInt64
			1041 free
			1042 instantiateIndexableOop
			1043 instantiateOop
			1044 int32ToFloat32
			1045 int32ToFloat64
			1046 int32ToOop
			1047 int32ToPointer
			1048 int64ToFloat32
			1049 int64ToFloat64
			1050 int64ToOop
			1051 int64ToPointer
			1052 isBytes
			1053 isFloatObject
			1054 isIndexable
			1055 isIntegerObject
			1056 isPointers
			1057 isWords
			1058 isWordsOrBytes
			1059 loadFloat32FromMemory
			1060 loadFloat64FromMemory
			1061 loadInt16FromMemory
			1062 loadInt32FromMemory
			1063 loadInt64FromMemory
			1064 loadInt8FromMemory
			1065 loadObjectField
			1066 loadPointerFromMemory
			1067 loadUInt16FromMemory
			1068 loadUInt32FromMemory
			1069 loadUInt64FromMemory
			1070 loadUInt8FromMemory
			1071 malloc32
			1072 malloc64
			1073 moveFloat32ToPhysical
			1074 moveFloat64ToPhysical
			1075 moveInt32ToPhysical
			1076 moveInt64ToPhysical
			1077 movePointerToPhysical
			1078 neg32
			1079 neg64
			1080 not32
			1081 not64
			1082 oopSmallIntegerToInt32
			1083 oopSmallIntegerToInt64
			1084 oopToBoolean32
			1085 oopToBoolean64
			1086 oopToFloat32
			1087 oopToFloat64
			1088 oopToInt32
			1089 oopToInt64
			1090 oopToPointer
			1091 oopToPointerReinterpret
			1092 oopToUInt32
			1093 oopToUInt64
			1094 performCallIndirectFloat32
			1095 performCallIndirectFloat64
			1096 performCallIndirectInt32
			1097 performCallIndirectInt64
			1098 performCallIndirectPointer
			1099 performCallStructure
			1100 pin
			1101 pointerToInt32
			1102 pointerToInt64
			1103 pointerToOop
			1104 pointerToOopReinterprer
			1105 popFloat32
			1106 popFloat64
			1107 popInt32
			1108 popInt64
			1109 popPointer
			1110 signExtend32From16
			1111 signExtend32From8
			1112 signExtend64From16
			1113 signExtend64From32
			1114 signExtend64From8
			1115 smallInt32ToOop
			1116 storeLocalFloat32
			1117 storeLocalFloat64
			1118 storeLocalInt16
			1119 storeLocalInt32
			1120 storeLocalInt64
			1121 storeLocalInt8
			1122 storeLocalPointer
			1123 truncate32To16
			1124 truncate32To8
			1125 truncate64To16
			1126 truncate64To32
			1127 truncate64To8
			1128 uint32ToFloat32
			1129 uint32ToFloat64
			1130 uint32ToOop
			1131 uint64ToFloat32
			1132 uint64ToFloat64
			1133 uint64ToOop
			1134 unpin
			1135 zeroExtend32From16
			1136 zeroExtend32From8
			1137 zeroExtend64From16
			1138 zeroExtend64From32
			1139 zeroExtend64From8
			2069 add32
			2070 add64
			2071 and32
			2072 and64
			2073 arithmeticRightShift32
			2074 arithmeticRightShift64
			2075 div32
			2076 div64
			2077 float32Add
			2078 float32Div
			2079 float32Equal
			2080 float32Great
			2081 float32GreatEqual
			2082 float32Less
			2083 float32LessEqual
			2084 float32Mul
			2085 float32NotEqual
			2086 float32Sub
			2087 float64Add
			2088 float64Div
			2089 float64Equal
			2090 float64Great
			2091 float64GreatEqual
			2092 float64Less
			2093 float64LessEqual
			2094 float64Mul
			2095 float64NotEqual
			2096 float64Sub
			2097 instantiateIndexable32Oop
			2098 int32Equal
			2099 int32Great
			2100 int32GreatEqual
			2101 int32Less
			2102 int32LessEqual
			2103 int32NotEqual
			2104 int64Equal
			2105 int64Great
			2106 int64GreatEqual
			2107 int64Less
			2108 int64LessEqual
			2109 int64NotEqual
			2110 leftShift32
			2111 leftShift64
			2112 loadObjectAt
			2113 memcpyFixed
			2114 mul32
			2115 mul64
			2116 oopEqual
			2117 oopNotEqual
			2118 or32
			2119 or64
			2120 performCallIndirectStructure
			2121 pointerAddOffset32
			2122 pointerAddOffset64
			2123 pointerEqual
			2124 pointerNotEqual
			2125 rem32
			2126 rem64
			2127 rightShift32
			2128 rightShift64
			2129 storeFloat32ToMemory
			2130 storeFloat64ToMemory
			2131 storeInt16ToMemory
			2132 storeInt32ToMemory
			2133 storeInt64ToMemory
			2134 storeInt8ToMemory
			2135 storeObjectField
			2136 storePointerToMemory
			2137 sub32
			2138 sub64
			2139 udiv32
			2140 udiv64
			2141 uint32Great
			2142 uint32GreatEqual
			2143 uint32Less
			2144 uint32LessEqual
			2145 uint64Great
			2146 uint64GreatEqual
			2147 uint64Less
			2148 uint64LessEqual
			2149 umul32
			2150 umul64
			2151 urem32
			2152 urem64
			2153 xor32
			2154 xor64
			3005 compareAndSwap32
			3006 memcpy32
			3007 memcpy64
			3008 storeObjectFieldAt
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
