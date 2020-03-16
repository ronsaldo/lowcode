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
		1004	and32
		1005	and64
		1006	arithmeticRightShift32
		1007	arithmeticRightShift64
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
		1087	leaveLocalFrame
		1088	leftShift32
		1089	leftShift64
		1102	loadFloat32FromMemory
		1103	loadFloat64FromMemory
		1104	loadInt16FromMemory
		1105	loadInt32FromMemory
		1106	loadInt64FromMemory
		1107	loadInt8FromMemory
		1108	loadLocalAddress
		1109	loadLocalFloat32
		1110	loadLocalFloat64
		1111	loadLocalInt16
		1112	loadLocalInt32
		1113	loadLocalInt64
		1114	loadLocalInt8
		1115	loadLocalPointer
		1116	loadLocalUInt16
		1117	loadLocalUInt32
		1118	loadLocalUInt64
		1119	loadLocalUInt8
		1120	loadObjectAt
		1121	loadObjectField
		1122	loadPointerFromMemory
		1123	loadUInt16FromMemory
		1124	loadUInt32FromMemory
		1125	loadUInt64FromMemory
		1126	loadUInt8FromMemory
		1127	localFrameSize
		1129	lockVM
		1130	malloc32
		1131	malloc64
		1132	memcpy32
		1133	memcpy64
		1134	memcpyFixed
		1140	mul32
		1141	mul64
		1142	neg32
		1143	neg64
		1144	not32
		1145	not64
		1146	or32
		1147	or64
		1162	plaftormCode
		1163	pointerAddConstantOffset
		1164	pointerAddOffset32
		1165	pointerAddOffset64
		1166	pointerEqual
		1167	pointerNotEqual
		1168	pointerToInt32
		1169	pointerToInt64
		1170	popFloat32
		1171	popFloat64
		1172	popInt32
		1173	popInt64
		1174	popMultipleNative
		1175	popPointer
		1176	pushConstantUInt32
		1177	pushConstantUInt64
		1178	pushNullPointer
		1179	pushOne32
		1180	pushOne64
		1181	pushOneFloat32
		1182	pushOneFloat64
		1188	pushSessionIdentifier
		1189	pushZero32
		1190	pushZero64
		1191	pushZeroFloat32
		1192	pushZeroFloat64
		1193	rem32
		1194	rem64
		1195	rightShift32
		1196	rightShift64
		1197	signExtend32From16
		1198	signExtend32From8
		1199	signExtend64From16
		1200	signExtend64From32
		1201	signExtend64From8
		1202	storeFloat32ToMemory
		1203	storeFloat64ToMemory
		1204	storeInt16ToMemory
		1205	storeInt32ToMemory
		1206	storeInt64ToMemory
		1207	storeInt8ToMemory
		1208	storeLocalFloat32
		1209	storeLocalFloat64
		1210	storeLocalInt16
		1211	storeLocalInt32
		1212	storeLocalInt64
		1213	storeLocalInt8
		1214	storeLocalPointer
		1215	storePointerToMemory
		1216	sub32
		1217	sub64
		1218	truncate32To16
		1219	truncate32To8
		1220	truncate64To16
		1221	truncate64To32
		1222	truncate64To8
		1223	udiv32
		1224	udiv64
		1225	uint32Great
		1226	uint32GreatEqual
		1227	uint32Less
		1228	uint32LessEqual
		1229	uint32ToFloat32
		1230	uint32ToFloat64
		1231	uint64Great
		1232	uint64GreatEqual
		1233	uint64Less
		1234	uint64LessEqual
		1235	uint64ToFloat32
		1236	uint64ToFloat64
		1237	umul32
		1238	umul64
		1240	unlockVM
		1241	urem32
		1242	urem64
		1243	xor32
		1244	xor64
		1245	zeroExtend32From16
		1246	zeroExtend32From8
		1247	zeroExtend64From16
		1248	zeroExtend64From32
		1249	zeroExtend64From8
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

{ #category : #'as yet unclassified' }
IRLowcodeInstruction class >> mnemonicForPrimitiveIndex: primitiveIndex [
	^ LowcodeMnemonicTable at: primitiveIndex ifAbsent: [ 'lowcode' , primitiveIndex asString ]
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
