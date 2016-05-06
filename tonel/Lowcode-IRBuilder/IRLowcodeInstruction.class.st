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
		0	boolean32ToOop
		1	boolean64ToOop
		2	float32ToOop
		3	float64ToOop
		4	int32ToOop
		5	int64ToOop
		6	pointerToOop
		7	pointerToOopReinterprer
		8	smallInt32ToOop
		9	uint32ToOop
		10	uint64ToOop
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
		1045	float32NotEqual
		1046	float32Sub
		1047	float32ToFloat64
		1048	float32ToInt32
		1049	float32ToInt64
		1050	float32ToUInt32
		1051	float32ToUInt64
		1052	float64Add
		1053	float64Div
		1054	float64Equal
		1055	float64Great
		1056	float64GreatEqual
		1057	float64Less
		1058	float64LessEqual
		1059	float64Mul
		1060	float64NotEqual
		1061	float64Sub
		1062	float64ToFloat32
		1063	float64ToInt32
		1064	float64ToInt64
		1065	float64ToUInt32
		1066	float64ToUInt64
		1067	free
		1068	int32Equal
		1069	int32Great
		1070	int32GreatEqual
		1071	int32Less
		1072	int32LessEqual
		1073	int32NotEqual
		1074	int32ToFloat32
		1075	int32ToFloat64
		1076	int32ToPointer
		1077	int64Equal
		1078	int64Great
		1079	int64GreatEqual
		1080	int64Less
		1081	int64LessEqual
		1082	int64NotEqual
		1083	int64ToFloat32
		1084	int64ToFloat64
		1085	int64ToPointer
		1086	leftShift32
		1087	leftShift64
		1088	loadFloat32FromMemory
		1089	loadFloat64FromMemory
		1090	loadInt16FromMemory
		1091	loadInt32FromMemory
		1092	loadInt64FromMemory
		1093	loadInt8FromMemory
		1094	loadLocalAddress
		1095	loadLocalFloat32
		1096	loadLocalFloat64
		1097	loadLocalInt16
		1098	loadLocalInt32
		1099	loadLocalInt64
		1100	loadLocalInt8
		1101	loadLocalPointer
		1102	loadLocalUInt16
		1103	loadLocalUInt32
		1104	loadLocalUInt64
		1105	loadLocalUInt8
		1106	loadPointerFromMemory
		1107	loadUInt16FromMemory
		1108	loadUInt32FromMemory
		1109	loadUInt64FromMemory
		1110	loadUInt8FromMemory
		1111	localFrameSize
		1112	lockRegisters
		1113	lockVM
		1114	malloc32
		1115	malloc64
		1116	memcpy32
		1117	memcpy64
		1118	memcpyFixed
		1119	moveFloat32ToPhysical
		1120	moveFloat64ToPhysical
		1121	moveInt32ToPhysical
		1122	moveInt64ToPhysical
		1123	movePointerToPhysical
		1124	mul32
		1125	mul64
		1126	neg32
		1127	neg64
		1128	not32
		1129	not64
		1130	or32
		1131	or64
		1132	performCallFloat32
		1133	performCallFloat64
		1134	performCallIndirectFloat32
		1135	performCallIndirectFloat64
		1136	performCallIndirectInt32
		1137	performCallIndirectInt64
		1138	performCallIndirectPointer
		1139	performCallIndirectStructure
		1140	performCallInt32
		1141	performCallInt64
		1142	performCallPointer
		1143	performCallStructure
		1144	plaftormCode
		1145	pointerAddOffset32
		1146	pointerAddOffset64
		1147	pointerAddConstantOffset
		1148	pointerEqual
		1149	pointerNotEqual
		1150	pointerToInt32
		1151	pointerToInt64
		1152	popFloat32
		1153	popFloat64
		1154	popInt32
		1155	popInt64
		1156	popPointer
		1157	pushConstantUInt32
		1158	pushConstantUInt64
		1159	pushNullPointer
		1160	pushOne32
		1161	pushOne64
		1162	pushOneFloat32
		1163	pushOneFloat64
		1164	pushPhysicalFloat32
		1165	pushPhysicalFloat64
		1166	pushPhysicalInt32
		1167	pushPhysicalInt64
		1168	pushPhysicalPointer
		1169	pushSessionIdentifier
		1170	pushZero32
		1171	pushZero64
		1172	pushZeroFloat32
		1173	pushZeroFloat64
		1174	rem32
		1175	rem64
		1176	rightShift32
		1177	rightShift64
		1178	signExtend32From16
		1179	signExtend32From8
		1180	signExtend64From16
		1181	signExtend64From32
		1182	signExtend64From8
		1183	storeFloat32ToMemory
		1184	storeFloat64ToMemory
		1185	storeInt16ToMemory
		1186	storeInt32ToMemory
		1187	storeInt64ToMemory
		1188	storeInt8ToMemory
		1189	storeLocalFloat32
		1190	storeLocalFloat64
		1191	storeLocalInt16
		1192	storeLocalInt32
		1193	storeLocalInt64
		1194	storeLocalInt8
		1195	storeLocalPointer
		1196	storePointerToMemory
		1197	sub32
		1198	sub64
		1199	truncate32To16
		1200	truncate32To8
		1201	truncate64To16
		1202	truncate64To32
		1203	truncate64To8
		1204	udiv32
		1205	udiv64
		1206	uint32Great
		1207	uint32GreatEqual
		1208	uint32Less
		1209	uint32LessEqual
		1210	uint32ToFloat32
		1211	uint32ToFloat64
		1212	uint64Great
		1213	uint64GreatEqual
		1214	uint64Less
		1215	uint64LessEqual
		1216	uint64ToFloat32
		1217	uint64ToFloat64
		1218	umul32
		1219	umul64
		1220	unlockRegisters
		1221	unlockVM
		1222	urem32
		1223	urem64
		1224	xor32
		1225	xor64
		1226	zeroExtend32From16
		1227	zeroExtend32From8
		1228	zeroExtend64From16
		1229	zeroExtend64From32
		1230	zeroExtend64From8
		1231	instantiateIndexable32Oop
		1232	instantiateIndexableOop
		1233	instantiateOop
		1234	loadObjectAt
		1235	loadObjectField
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
	| tmp1 |
	tmp1 := opcode // 1000.
	^ (tmp1 >= 16
		ifTrue: [ tmp1 - 33 ]
		ifFalse: [ tmp1 ]) + 1
]
