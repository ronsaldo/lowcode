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
		1000	add32
		1001	add64
		1002	alloca32
		1003	alloca64
		1004	and32
		1005	and64
		1006	arithmeticRightShift32
		1007	arithmeticRightShift64
		1008	beginCall
		1009	callArgumentFloat32
		1010	callArgumentFloat64
		1011	callArgumentInt32
		1012	callArgumentInt64
		1013	callArgumentPointer
		1014	callArgumentSpace
		1015	callArgumentStructure
		1016	callInstruction
		1017	callPhysical
		1018	checkSessionIdentifier
		1019	compareAndSwap32
		1020	div32
		1021	div64
		1022	duplicateFloat32
		1023	duplicateFloat64
		1024	duplicateInt32
		1025	duplicateInt64
		1026	duplicatePointer
		1027	effectiveAddress32
		1028	effectiveAddress64
		1029	endCall
		1030	endCallNoCleanup
		1031	float32Add
		1032	float32Div
		1033	float32Equal
		1034	float32Great
		1035	float32GreatEqual
		1036	float32Less
		1037	float32LessEqual
		1038	float32Mul
		1039	float32Neg
		1040	float32NotEqual
		1041	float32Sqrt
		1042	float32Sub
		1043	float32ToFloat64
		1044	float32ToInt32
		1045	float32ToInt64
		1046	float32ToUInt32
		1047	float32ToUInt64
		1048	float64Add
		1049	float64Div
		1050	float64Equal
		1051	float64Great
		1052	float64GreatEqual
		1053	float64Less
		1054	float64LessEqual
		1055	float64Mul
		1056	float64Neg
		1057	float64NotEqual
		1058	float64Sqrt
		1059	float64Sub
		1060	float64ToFloat32
		1061	float64ToInt32
		1062	float64ToInt64
		1063	float64ToUInt32
		1064	float64ToUInt64
		1065	free
		1066	instantiateIndexable32Oop
		1067	instantiateIndexableOop
		1068	instantiateOop
		1069	int32Equal
		1070	int32Great
		1071	int32GreatEqual
		1072	int32Less
		1073	int32LessEqual
		1074	int32NotEqual
		1075	int32ToFloat32
		1076	int32ToFloat64
		1077	int32ToPointer
		1078	int64Equal
		1079	int64Great
		1080	int64GreatEqual
		1081	int64Less
		1082	int64LessEqual
		1083	int64NotEqual
		1084	int64ToFloat32
		1085	int64ToFloat64
		1086	int64ToPointer
		1087	leftShift32
		1088	leftShift64
		1089	loadArgumentAddress
		1090	loadArgumentFloat32
		1091	loadArgumentFloat64
		1092	loadArgumentInt16
		1093	loadArgumentInt32
		1094	loadArgumentInt64
		1095	loadArgumentInt8
		1096	loadArgumentPointer
		1097	loadArgumentUInt16
		1098	loadArgumentUInt32
		1099	loadArgumentUInt64
		1100	loadArgumentUInt8
		1101	loadFloat32FromMemory
		1102	loadFloat64FromMemory
		1103	loadInt16FromMemory
		1104	loadInt32FromMemory
		1105	loadInt64FromMemory
		1106	loadInt8FromMemory
		1107	loadLocalAddress
		1108	loadLocalFloat32
		1109	loadLocalFloat64
		1110	loadLocalInt16
		1111	loadLocalInt32
		1112	loadLocalInt64
		1113	loadLocalInt8
		1114	loadLocalPointer
		1115	loadLocalUInt16
		1116	loadLocalUInt32
		1117	loadLocalUInt64
		1118	loadLocalUInt8
		1119	loadObjectAt
		1120	loadObjectField
		1121	loadPointerFromMemory
		1122	loadUInt16FromMemory
		1123	loadUInt32FromMemory
		1124	loadUInt64FromMemory
		1125	loadUInt8FromMemory
		1126	localFrameSize
		1127	lockRegisters
		1128	lockVM
		1129	malloc32
		1130	malloc64
		1131	memcpy32
		1132	memcpy64
		1133	memcpyFixed
		1134	moveFloat32ToPhysical
		1135	moveFloat64ToPhysical
		1136	moveInt32ToPhysical
		1137	moveInt64ToPhysical
		1138	movePointerToPhysical
		1139	mul32
		1140	mul64
		1141	neg32
		1142	neg64
		1143	not32
		1144	not64
		1145	or32
		1146	or64
		1147	performCallout
		1148	performCalloutIndirect
		1149	pushCalloutResultFloat32
		1150	pushCalloutResultFloat64
		1151	pushCalloutResultInt32
		1152	pushCalloutResultInt64
		1153	pushCalloutResultPointer
		1161	plaftormCode
		1162	pointerAddConstantOffset
		1163	pointerAddOffset32
		1164	pointerAddOffset64
		1165	pointerEqual
		1166	pointerNotEqual
		1167	pointerToInt32
		1168	pointerToInt64
		1169	popFloat32
		1170	popFloat64
		1171	popInt32
		1172	popInt64
		1173	popMultipleNative
		1174	popPointer
		1175	pushConstantUInt32
		1176	pushConstantUInt64
		1177	pushNullPointer
		1178	pushOne32
		1179	pushOne64
		1180	pushOneFloat32
		1181	pushOneFloat64
		1182	pushPhysicalFloat32
		1183	pushPhysicalFloat64
		1184	pushPhysicalInt32
		1185	pushPhysicalInt64
		1186	pushPhysicalPointer
		1187	pushSessionIdentifier
		1188	pushZero32
		1189	pushZero64
		1190	pushZeroFloat32
		1191	pushZeroFloat64
		1192	rem32
		1193	rem64
		1194	rightShift32
		1195	rightShift64
		1196	signExtend32From16
		1197	signExtend32From8
		1198	signExtend64From16
		1199	signExtend64From32
		1200	signExtend64From8
		1201	storeFloat32ToMemory
		1202	storeFloat64ToMemory
		1203	storeInt16ToMemory
		1204	storeInt32ToMemory
		1205	storeInt64ToMemory
		1206	storeInt8ToMemory
		1207	storeLocalFloat32
		1208	storeLocalFloat64
		1209	storeLocalInt16
		1210	storeLocalInt32
		1211	storeLocalInt64
		1212	storeLocalInt8
		1213	storeLocalPointer
		1214	storePointerToMemory
		1215	sub32
		1216	sub64
		1217	truncate32To16
		1218	truncate32To8
		1219	truncate64To16
		1220	truncate64To32
		1221	truncate64To8
		1222	udiv32
		1223	udiv64
		1224	uint32Great
		1225	uint32GreatEqual
		1226	uint32Less
		1227	uint32LessEqual
		1228	uint32ToFloat32
		1229	uint32ToFloat64
		1230	uint64Great
		1231	uint64GreatEqual
		1232	uint64Less
		1233	uint64LessEqual
		1234	uint64ToFloat32
		1235	uint64ToFloat64
		1236	umul32
		1237	umul64
		1238	unlockRegisters
		1239	unlockVM
		1240	urem32
		1241	urem64
		1242	xor32
		1243	xor64
		1244	zeroExtend32From16
		1245	zeroExtend32From8
		1246	zeroExtend64From16
		1247	zeroExtend64From32
		1248	zeroExtend64From8
		2000	byteSizeOf
		2001	firstFieldPointer
		2002	firstIndexableFieldPointer
		2003	isBytes
		2004	isFloatObject
		2005	isIndexable
		2006	isIntegerObject
		2007	isPointers
		2008	isWords
		2009	isWordsOrBytes
		2010	oopSmallIntegerToInt32
		2011	oopSmallIntegerToInt64
		2012	oopToBoolean32
		2013	oopToBoolean64
		2014	oopToFloat32
		2015	oopToFloat64
		2016	oopToInt32
		2017	oopToInt64
		2018	oopToPointer
		2019	oopToPointerReinterpret
		2020	oopToUInt32
		2021	oopToUInt64
		2022	pin
		2023	unpin
		3000	oopEqual
		3001	oopNotEqual
		3002	storeObjectField
		3003	storeObjectFieldAt
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
	^ true
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
	^ 1 - stackDelta
]
