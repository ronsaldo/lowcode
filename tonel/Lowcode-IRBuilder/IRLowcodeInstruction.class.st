"
I represent a Lowcode instruction in the OpalCompiler intermediate representation.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	extA:		<Object>
	extB:		<Object>
	opcode:		<Object>


    Implementation Points
"
Class {
	#name : #IRLowcodeInstruction,
	#superclass : #IRInstruction,
	#instVars : [
		'opcode',
		'extendA',
		'extendB',
		'hasLiteral'
	],
	#classVars : [
		'LowcodeMnemonicTable'
	],
	#category : #'Lowcode-IRBuilder'
}

{ #category : #'as yet unclassified' }
IRLowcodeInstruction class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	LowcodeMnemonicTable := Dictionary newFromPairs: self lowcodeInstructionTable 
]

{ #category : #'lowcode instructions' }
IRLowcodeInstruction class >> lowcodeInstructionTable [
	^ #(
		1	boolean32ToOop
		2	boolean64ToOop
		3	float32ToOop
		4	float64ToOop
		5	int32ToOop
		6	int64ToOop
		7	pointerToOop
		8	pointerToOopReinterprer
		9	smallInt32ToOop
		10	uint32ToOop
		11	uint64ToOop
		1007	add32
		1008	add64
		1009	alloca32
		1010	alloca64
		1011	and32
		1012	and64
		1013	arithmeticRightShift32
		1014	arithmeticRightShift64
		1015	beginCall
		1016	callArgumentFloat32
		1017	callArgumentFloat64
		1018	callArgumentInt32
		1019	callArgumentInt64
		1020	callArgumentPointer
		1021	callArgumentStructure
		1022	callInstruction
		1023	callPhysical
		1024	checkSessionIdentifier
		1025	compareAndSwap32
		1026	div32
		1027	div64
		1028	duplicateFloat32
		1029	duplicateFloat64
		1030	duplicateInt32
		1031	duplicateInt64
		1032	duplicatePointer
		1033	effectiveAddress32
		1034	effectiveAddress64
		1035	endCall
		1036	endCallNoCleanup
		1037	float32Add
		1038	float32Div
		1039	float32Equal
		1040	float32Great
		1041	float32GreatEqual
		1042	float32Less
		1043	float32LessEqual
		1044	float32Mul
		1045	float32Neg
		1046	float32NotEqual
		1047	float32Sqrt
		1048	float32Sub
		1049	float32ToFloat64
		1050	float32ToInt32
		1051	float32ToInt64
		1052	float32ToUInt32
		1053	float32ToUInt64
		1054	float64Add
		1055	float64Div
		1056	float64Equal
		1057	float64Great
		1058	float64GreatEqual
		1059	float64Less
		1060	float64LessEqual
		1061	float64Mul
		1062	float64Neg
		1063	float64NotEqual
		1064	float64Sqrt
		1065	float64Sub
		1066	float64ToFloat32
		1067	float64ToInt32
		1068	float64ToInt64
		1069	float64ToUInt32
		1070	float64ToUInt64
		1071	free
		1072	instantiateIndexable32Oop
		1073	instantiateIndexableOop
		1074	instantiateOop
		1075	int32Equal
		1076	int32Great
		1077	int32GreatEqual
		1078	int32Less
		1079	int32LessEqual
		1080	int32NotEqual
		1081	int32ToFloat32
		1082	int32ToFloat64
		1083	int32ToPointer
		1084	int64Equal
		1085	int64Great
		1086	int64GreatEqual
		1087	int64Less
		1088	int64LessEqual
		1089	int64NotEqual
		1090	int64ToFloat32
		1091	int64ToFloat64
		1092	int64ToPointer
		1093	leftShift32
		1094	leftShift64
		1095	loadFloat32FromMemory
		1096	loadFloat64FromMemory
		1097	loadInt16FromMemory
		1098	loadInt32FromMemory
		1099	loadInt64FromMemory
		1100	loadInt8FromMemory
		1101	loadLocalAddress
		1102	loadLocalFloat32
		1103	loadLocalFloat64
		1104	loadLocalInt16
		1105	loadLocalInt32
		1106	loadLocalInt64
		1107	loadLocalInt8
		1108	loadLocalPointer
		1109	loadLocalUInt16
		1110	loadLocalUInt32
		1111	loadLocalUInt64
		1112	loadLocalUInt8
		1113	loadObjectAt
		1114	loadObjectField
		1115	loadPointerFromMemory
		1116	loadUInt16FromMemory
		1117	loadUInt32FromMemory
		1118	loadUInt64FromMemory
		1119	loadUInt8FromMemory
		1120	localFrameSize
		1121	lockRegisters
		1122	lockVM
		1123	malloc32
		1124	malloc64
		1125	memcpy32
		1126	memcpy64
		1127	memcpyFixed
		1128	moveFloat32ToPhysical
		1129	moveFloat64ToPhysical
		1130	moveInt32ToPhysical
		1131	moveInt64ToPhysical
		1132	movePointerToPhysical
		1133	mul32
		1134	mul64
		1135	neg32
		1136	neg64
		1137	not32
		1138	not64
		1139	or32
		1140	or64
		1141	performCallFloat32
		1142	performCallFloat64
		1143	performCallIndirectFloat32
		1144	performCallIndirectFloat64
		1145	performCallIndirectInt32
		1146	performCallIndirectInt64
		1147	performCallIndirectPointer
		1148	performCallIndirectStructure
		1149	performCallInt32
		1150	performCallInt64
		1151	performCallPointer
		1152	performCallStructure
		1153	plaftormCode
		1154	pointerAddConstantOffset
		1155	pointerAddOffset32
		1156	pointerAddOffset64
		1157	pointerEqual
		1158	pointerNotEqual
		1159	pointerToInt32
		1160	pointerToInt64
		1161	popFloat32
		1162	popFloat64
		1163	popInt32
		1164	popInt64
		1165	popPointer
		1166	pushConstantUInt32
		1167	pushConstantUInt64
		1168	pushNullPointer
		1169	pushOne32
		1170	pushOne64
		1171	pushOneFloat32
		1172	pushOneFloat64
		1173	pushPhysicalFloat32
		1174	pushPhysicalFloat64
		1175	pushPhysicalInt32
		1176	pushPhysicalInt64
		1177	pushPhysicalPointer
		1178	pushSessionIdentifier
		1179	pushZero32
		1180	pushZero64
		1181	pushZeroFloat32
		1182	pushZeroFloat64
		1183	rem32
		1184	rem64
		1185	rightShift32
		1186	rightShift64
		1187	signExtend32From16
		1188	signExtend32From8
		1189	signExtend64From16
		1190	signExtend64From32
		1191	signExtend64From8
		1192	storeFloat32ToMemory
		1193	storeFloat64ToMemory
		1194	storeInt16ToMemory
		1195	storeInt32ToMemory
		1196	storeInt64ToMemory
		1197	storeInt8ToMemory
		1198	storeLocalFloat32
		1199	storeLocalFloat64
		1200	storeLocalInt16
		1201	storeLocalInt32
		1202	storeLocalInt64
		1203	storeLocalInt8
		1204	storeLocalPointer
		1205	storePointerToMemory
		1206	sub32
		1207	sub64
		1208	truncate32To16
		1209	truncate32To8
		1210	truncate64To16
		1211	truncate64To32
		1212	truncate64To8
		1213	udiv32
		1214	udiv64
		1215	uint32Great
		1216	uint32GreatEqual
		1217	uint32Less
		1218	uint32LessEqual
		1219	uint32ToFloat32
		1220	uint32ToFloat64
		1221	uint64Great
		1222	uint64GreatEqual
		1223	uint64Less
		1224	uint64LessEqual
		1225	uint64ToFloat32
		1226	uint64ToFloat64
		1227	umul32
		1228	umul64
		1229	unlockRegisters
		1230	unlockVM
		1231	urem32
		1232	urem64
		1233	xor32
		1234	xor64
		1235	zeroExtend32From16
		1236	zeroExtend32From8
		1237	zeroExtend64From16
		1238	zeroExtend64From32
		1239	zeroExtend64From8
		2070	byteSizeOf
		2071	firstFieldPointer
		2072	firstIndexableFieldPointer
		2073	isBytes
		2074	isFloatObject
		2075	isIndexable
		2076	isIntegerObject
		2077	isPointers
		2078	isWords
		2079	isWordsOrBytes
		2080	oopSmallIntegerToInt32
		2081	oopSmallIntegerToInt64
		2082	oopToBoolean32
		2083	oopToBoolean64
		2084	oopToFloat32
		2085	oopToFloat64
		2086	oopToInt32
		2087	oopToInt64
		2088	oopToPointer
		2089	oopToPointerReinterpret
		2090	oopToUInt32
		2091	oopToUInt64
		2092	pin
		2093	unpin
		3005	oopEqual
		3006	oopNotEqual
		3007	storeObjectField
		3008	storeObjectFieldAt
	)

]

{ #category : #visitor }
IRLowcodeInstruction >> accept: arg1 [
	^ arg1 visitLowcodeInstruction: self
]

{ #category : #accessing }
IRLowcodeInstruction >> extendA [
	^ extendA
]

{ #category : #accessing }
IRLowcodeInstruction >> extendA: arg1 [
	extendA := arg1
]

{ #category : #accessing }
IRLowcodeInstruction >> extendB [
	^ extendB
]

{ #category : #accessing }
IRLowcodeInstruction >> extendB: arg1 [
	extendB := arg1
]

{ #category : #accessing }
IRLowcodeInstruction >> hasLiteral [
	^ hasLiteral
]

{ #category : #accessing }
IRLowcodeInstruction >> hasLiteral: anObject [
	hasLiteral := anObject
]

{ #category : #initialization }
IRLowcodeInstruction >> initialize [
	super initialize.
	hasLiteral := false.
]

{ #category : #testing }
IRLowcodeInstruction >> isLowcodeInstruction [
	^ false
]

{ #category : #accessing }
IRLowcodeInstruction >> lowcodeMnemonic [
	^ LowcodeMnemonicTable at: opcode ifAbsent: [ 'lowcodePrimtive' , opcode printString ]
]

{ #category : #accessing }
IRLowcodeInstruction >> opcode [
	^ opcode
]

{ #category : #accessing }
IRLowcodeInstruction >> opcode: arg1 [
	opcode := arg1
]

{ #category : #accessing }
IRLowcodeInstruction >> stackDifference [
	| stackDelta |
	stackDelta := opcode // 1000.
	^ 1 - (stackDelta >= 16 ifTrue: [ stackDelta - 33 ] ifFalse: [ stackDelta ])
]
