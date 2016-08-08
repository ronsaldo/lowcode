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
		1014	callArgumentStructure
		1015	callInstruction
		1016	callPhysical
		1017	checkSessionIdentifier
		1018	compareAndSwap32
		1019	div32
		1020	div64
		1021	duplicateFloat32
		1022	duplicateFloat64
		1023	duplicateInt32
		1024	duplicateInt64
		1025	duplicatePointer
		1026	effectiveAddress32
		1027	effectiveAddress64
		1028	endCall
		1029	endCallNoCleanup
		1030	float32Add
		1031	float32Div
		1032	float32Equal
		1033	float32Great
		1034	float32GreatEqual
		1035	float32Less
		1036	float32LessEqual
		1037	float32Mul
		1038	float32Neg
		1039	float32NotEqual
		1040	float32Sqrt
		1041	float32Sub
		1042	float32ToFloat64
		1043	float32ToInt32
		1044	float32ToInt64
		1045	float32ToUInt32
		1046	float32ToUInt64
		1047	float64Add
		1048	float64Div
		1049	float64Equal
		1050	float64Great
		1051	float64GreatEqual
		1052	float64Less
		1053	float64LessEqual
		1054	float64Mul
		1055	float64Neg
		1056	float64NotEqual
		1057	float64Sqrt
		1058	float64Sub
		1059	float64ToFloat32
		1060	float64ToInt32
		1061	float64ToInt64
		1062	float64ToUInt32
		1063	float64ToUInt64
		1064	free
		1065	instantiateIndexable32Oop
		1066	instantiateIndexableOop
		1067	instantiateOop
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
		1106	loadObjectAt
		1107	loadObjectField
		1108	loadPointerFromMemory
		1109	loadUInt16FromMemory
		1110	loadUInt32FromMemory
		1111	loadUInt64FromMemory
		1112	loadUInt8FromMemory
		1113	localFrameSize
		1114	lockRegisters
		1115	lockVM
		1116	malloc32
		1117	malloc64
		1118	memcpy32
		1119	memcpy64
		1120	memcpyFixed
		1121	moveFloat32ToPhysical
		1122	moveFloat64ToPhysical
		1123	moveInt32ToPhysical
		1124	moveInt64ToPhysical
		1125	movePointerToPhysical
		1126	mul32
		1127	mul64
		1128	neg32
		1129	neg64
		1130	not32
		1131	not64
		1132	or32
		1133	or64
		1134	performCallFloat32
		1135	performCallFloat64
		1136	performCallIndirectFloat32
		1137	performCallIndirectFloat64
		1138	performCallIndirectInt32
		1139	performCallIndirectInt64
		1140	performCallIndirectPointer
		1141	performCallIndirectStructure
		1142	performCallInt32
		1143	performCallInt64
		1144	performCallPointer
		1145	performCallStructure
		1146	plaftormCode
		1147	pointerAddConstantOffset
		1148	pointerAddOffset32
		1149	pointerAddOffset64
		1150	pointerEqual
		1151	pointerNotEqual
		1152	pointerToInt32
		1153	pointerToInt64
		1154	popFloat32
		1155	popFloat64
		1156	popInt32
		1157	popInt64
		1158	popPointer
		1159	pushConstantUInt32
		1160	pushConstantUInt64
		1161	pushNullPointer
		1162	pushOne32
		1163	pushOne64
		1164	pushOneFloat32
		1165	pushOneFloat64
		1166	pushPhysicalFloat32
		1167	pushPhysicalFloat64
		1168	pushPhysicalInt32
		1169	pushPhysicalInt64
		1170	pushPhysicalPointer
		1171	pushSessionIdentifier
		1172	pushZero32
		1173	pushZero64
		1174	pushZeroFloat32
		1175	pushZeroFloat64
		1176	rem32
		1177	rem64
		1178	rightShift32
		1179	rightShift64
		1180	signExtend32From16
		1181	signExtend32From8
		1182	signExtend64From16
		1183	signExtend64From32
		1184	signExtend64From8
		1185	storeFloat32ToMemory
		1186	storeFloat64ToMemory
		1187	storeInt16ToMemory
		1188	storeInt32ToMemory
		1189	storeInt64ToMemory
		1190	storeInt8ToMemory
		1191	storeLocalFloat32
		1192	storeLocalFloat64
		1193	storeLocalInt16
		1194	storeLocalInt32
		1195	storeLocalInt64
		1196	storeLocalInt8
		1197	storeLocalPointer
		1198	storePointerToMemory
		1199	sub32
		1200	sub64
		1201	truncate32To16
		1202	truncate32To8
		1203	truncate64To16
		1204	truncate64To32
		1205	truncate64To8
		1206	udiv32
		1207	udiv64
		1208	uint32Great
		1209	uint32GreatEqual
		1210	uint32Less
		1211	uint32LessEqual
		1212	uint32ToFloat32
		1213	uint32ToFloat64
		1214	uint64Great
		1215	uint64GreatEqual
		1216	uint64Less
		1217	uint64LessEqual
		1218	uint64ToFloat32
		1219	uint64ToFloat64
		1220	umul32
		1221	umul64
		1222	unlockRegisters
		1223	unlockVM
		1224	urem32
		1225	urem64
		1226	xor32
		1227	xor64
		1228	zeroExtend32From16
		1229	zeroExtend32From8
		1230	zeroExtend64From16
		1231	zeroExtend64From32
		1232	zeroExtend64From8
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
