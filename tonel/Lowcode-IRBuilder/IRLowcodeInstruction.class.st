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
		'LowcodeMnemonicTable',
		'LowcodeStackTransitionTable'
	],
	#category : #'Lowcode-IRBuilder'
}

{ #category : #'as yet unclassified' }
IRLowcodeInstruction class >> initialize [	
	LowcodeMnemonicTable := Dictionary new.
	LowcodeStackTransitionTable := Dictionary new.
	self lowcodeInstructionTable pairsDo: [ :opcode :description |
		|mnemonic stackArguments stackResults|
		mnemonic := description first.
		stackArguments := description second.
		stackResults := description third.
		LowcodeMnemonicTable at: opcode put: mnemonic.
		LowcodeStackTransitionTable at: opcode put: {stackArguments . stackResults}.
	].

]

{ #category : #'lowcode instructions' }
IRLowcodeInstruction class >> lowcodeInstructionTable [
	^ #(
		0	(boolean32ToOop (int32) (oop))
		1	(boolean64ToOop (int64) (oop))
		2	(float32ToOop (float32) (oop))
		3	(float64ToOop (float64) (oop))
		4	(int32ToOop (int32) (oop))
		5	(int64ToOop (int64) (oop))
		6	(pointerToOop (pointer) (oop))
		7	(pointerToOopReinterprer (pointer) (oop))
		8	(smallInt32ToOop (int32) (oop))
		9	(uint32ToOop (int32) (oop))
		10	(uint64ToOop (int64) (oop))
		1000	(add32 (int32 int32) (int32))
		1001	(add64 (int64 int64) (int64))
		1004	(and32 (int32 int32) (int32))
		1005	(and64 (int64 int64) (int64))
		1006	(arithmeticRightShift32 (int32 int32) (int32))
		1007	(arithmeticRightShift64 (int64 int64) (int64))
		1018	(checkSessionIdentifier () (int32))
		1019	(compareAndSwap32 (pointer int32 int32) (int32))
		1020	(div32 (int32 int32) (int32))
		1021	(div64 (int64 int64) (int64))
		1022	(duplicateFloat32 (float32) (float32 float32))
		1023	(duplicateFloat64 (float64) (float64 float64))
		1024	(duplicateInt32 (int32) (int32 int32))
		1025	(duplicateInt64 (int64) (int64 int64))
		1026	(duplicatePointer (pointer) (pointer pointer))
		1027	(effectiveAddress32 (pointer int32 int32 int32) (pointer))
		1028	(effectiveAddress64 (pointer int64 int64 int64) (pointer))
		1031	(float32Add (float32 float32) (float32))
		1032	(float32Div (float32 float32) (float32))
		1033	(float32Equal (float32 float32) (int32))
		1034	(float32Great (float32 float32) (int32))
		1035	(float32GreatEqual (float32 float32) (int32))
		1036	(float32Less (float32 float32) (int32))
		1037	(float32LessEqual (float32 float32) (int32))
		1038	(float32Mul (float32 float32) (float32))
		1039	(float32Neg (float32) (float32))
		1040	(float32NotEqual (float32 float32) (int32))
		1041	(float32Sqrt (float32) (float32))
		1042	(float32Sub (float32 float32) (float32))
		1043	(float32ToFloat64 (float32) (float64))
		1044	(float32ToInt32 (float32) (int32))
		1045	(float32ToInt64 (float32) (int64))
		1046	(float32ToUInt32 (float32) (int32))
		1047	(float32ToUInt64 (float32) (int64))
		1048	(float64Add (float64 float64) (float64))
		1049	(float64Div (float64 float64) (float64))
		1050	(float64Equal (float64 float64) (int32))
		1051	(float64Great (float64 float64) (int32))
		1052	(float64GreatEqual (float64 float64) (int32))
		1053	(float64Less (float64 float64) (int32))
		1054	(float64LessEqual (float64 float64) (int32))
		1055	(float64Mul (float64 float64) (float64))
		1056	(float64Neg (float64) (float64))
		1057	(float64NotEqual (float64 float64) (int32))
		1058	(float64Sqrt (float64) (float64))
		1059	(float64Sub (float64 float64) (float64))
		1060	(float64ToFloat32 (float64) (float32))
		1061	(float64ToInt32 (float64) (int32))
		1062	(float64ToInt64 (float64) (int64))
		1063	(float64ToUInt32 (float64) (int32))
		1064	(float64ToUInt64 (float64) (int64))
		1065	(free (pointer) ())
		1066	(instantiateIndexable32Oop (oop int32) (oop))
		1067	(instantiateIndexableOop (oop) (oop))
		1068	(instantiateOop (oop) (oop))
		1069	(int32Equal (int32 int32) (int32))
		1070	(int32Great (int32 int32) (int32))
		1071	(int32GreatEqual (int32 int32) (int32))
		1072	(int32Less (int32 int32) (int32))
		1073	(int32LessEqual (int32 int32) (int32))
		1074	(int32NotEqual (int32 int32) (int32))
		1075	(int32ToFloat32 (int32) (float32))
		1076	(int32ToFloat64 (int32) (float64))
		1077	(int32ToPointer (int32) (pointer))
		1078	(int64Equal (int64 int64) (int32))
		1079	(int64Great (int64 int64) (int32))
		1080	(int64GreatEqual (int64 int64) (int32))
		1081	(int64Less (int64 int64) (int32))
		1082	(int64LessEqual (int64 int64) (int32))
		1083	(int64NotEqual (int64 int64) (int32))
		1084	(int64ToFloat32 (int64) (float64))
		1085	(int64ToFloat64 (int64) (float64))
		1086	(int64ToPointer (int64) (pointer))
		1087	(leaveLocalFrame () ())
		1088	(leftShift32 (int32 int32) (int32))
		1089	(leftShift64 (int64 int64) (int64))
		1102	(loadFloat32FromMemory (pointer) (float32))
		1103	(loadFloat64FromMemory (pointer) (float64))
		1104	(loadInt16FromMemory (pointer) (int32))
		1105	(loadInt32FromMemory (pointer) (int32))
		1106	(loadInt64FromMemory (pointer) (int64))
		1107	(loadInt8FromMemory (pointer) (int32))
		1108	(loadLocalAddress () (pointer))
		1109	(loadLocalFloat32 () (float32))
		1110	(loadLocalFloat64 () (float64))
		1111	(loadLocalInt16 () (int32))
		1112	(loadLocalInt32 () (int32))
		1113	(loadLocalInt64 () (int64))
		1114	(loadLocalInt8 () (int32))
		1115	(loadLocalPointer () (pointer))
		1116	(loadLocalUInt16 () (int32))
		1117	(loadLocalUInt32 () (int32))
		1118	(loadLocalUInt64 () (int64))
		1119	(loadLocalUInt8 () (int32))
		1120	(loadObjectAt (oop int32) (oop))
		1121	(loadObjectField (oop) (oop))
		1122	(loadPointerFromMemory (pointer) (pointer))
		1123	(loadUInt16FromMemory (pointer) (int32))
		1124	(loadUInt32FromMemory (pointer) (int32))
		1125	(loadUInt64FromMemory (pointer) (int64))
		1126	(loadUInt8FromMemory (pointer) (int32))
		1127	(localFrameSize () ())
		1129	(lockVM () ())
		1130	(malloc32 (int32) (pointer))
		1131	(malloc64 (int64) (pointer))
		1132	(memcpy32 (pointer pointer int32) ())
		1133	(memcpy64 (pointer pointer int64) ())
		1134	(memcpyFixed (pointer pointer) ())
		1140	(mul32 (int32 int32) (int32))
		1141	(mul64 (int64 int64) (int64))
		1142	(neg32 (int32) (int32))
		1143	(neg64 (int64) (int64))
		1144	(not32 (int32) (int32))
		1145	(not64 (int64) (int64))
		1146	(or32 (int32 int32) (int32))
		1147	(or64 (int64 int64) (int64))
		1162	(plaftormCode () (int32))
		1163	(pointerAddConstantOffset (pointer) (pointer))
		1164	(pointerAddOffset32 (pointer int32) (pointer))
		1165	(pointerAddOffset64 (pointer int64) (pointer))
		1166	(pointerEqual (pointer pointer) (int32))
		1167	(pointerNotEqual (pointer pointer) (int32))
		1168	(pointerToInt32 (pointer) (int32))
		1169	(pointerToInt64 (pointer) (int64))
		1170	(popFloat32 (float32) ())
		1171	(popFloat64 (float64) ())
		1172	(popInt32 (int32) ())
		1173	(popInt64 (int64) ())
		1174	(popMultipleNative () ())
		1175	(popPointer (pointer) ())
		1176	(pushConstantUInt32 () (int32))
		1177	(pushConstantUInt64 () (int64))
		1178	(pushNullPointer () (pointer))
		1179	(pushOne32 () (int32))
		1180	(pushOne64 () (int64))
		1181	(pushOneFloat32 () (float32))
		1182	(pushOneFloat64 () (float64))
		1188	(pushSessionIdentifier () (int32))
		1189	(pushZero32 () (int32))
		1190	(pushZero64 () (int64))
		1191	(pushZeroFloat32 () (float32))
		1192	(pushZeroFloat64 () (float64))
		1193	(rem32 (int32 int32) (int32))
		1194	(rem64 (int64 int64) (int64))
		1195	(rightShift32 (int32 int32) (int32))
		1196	(rightShift64 (int64 int64) (int64))
		1197	(signExtend32From16 (int32) (int32))
		1198	(signExtend32From8 (int32) (int32))
		1199	(signExtend64From16 (int64) (int64))
		1200	(signExtend64From32 (int32) (int64))
		1201	(signExtend64From8 (int64) (int64))
		1202	(storeFloat32ToMemory (float32 pointer) ())
		1203	(storeFloat64ToMemory (float64 pointer) ())
		1204	(storeInt16ToMemory (int32 pointer) ())
		1205	(storeInt32ToMemory (int32 pointer) ())
		1206	(storeInt64ToMemory (int64 pointer) ())
		1207	(storeInt8ToMemory (int32 pointer) ())
		1208	(storeLocalFloat32 (float32) ())
		1209	(storeLocalFloat64 (float64) ())
		1210	(storeLocalInt16 (int32) ())
		1211	(storeLocalInt32 (int32) ())
		1212	(storeLocalInt64 (int64) ())
		1213	(storeLocalInt8 (int32) ())
		1214	(storeLocalPointer (pointer) ())
		1215	(storePointerToMemory (pointer pointer) ())
		1216	(sub32 (int32 int32) (int32))
		1217	(sub64 (int64 int64) (int64))
		1218	(truncate32To16 (int32) (int32))
		1219	(truncate32To8 (int32) (int32))
		1220	(truncate64To16 (int64) (int32))
		1221	(truncate64To32 (int64) (int32))
		1222	(truncate64To8 (int64) (int32))
		1223	(udiv32 (int32 int32) (int32))
		1224	(udiv64 (int64 int64) (int64))
		1225	(uint32Great (int32 int32) (int32))
		1226	(uint32GreatEqual (int32 int32) (int32))
		1227	(uint32Less (int32 int32) (int32))
		1228	(uint32LessEqual (int32 int32) (int32))
		1229	(uint32ToFloat32 (int32) (float32))
		1230	(uint32ToFloat64 (int32) (float64))
		1231	(uint64Great (int64 int64) (int32))
		1232	(uint64GreatEqual (int64 int64) (int32))
		1233	(uint64Less (int64 int64) (int32))
		1234	(uint64LessEqual (int64 int64) (int32))
		1235	(uint64ToFloat32 (int64) (float32))
		1236	(uint64ToFloat64 (int64) (float64))
		1237	(umul32 (int32 int32) (int32))
		1238	(umul64 (int64 int64) (int64))
		1240	(unlockVM () ())
		1241	(urem32 (int32 int32) (int32))
		1242	(urem64 (int64 int64) (int64))
		1243	(xor32 (int32 int32) (int32))
		1244	(xor64 (int64 int64) (int64))
		1245	(zeroExtend32From16 (int32) (int32))
		1246	(zeroExtend32From8 (int32) (int32))
		1247	(zeroExtend64From16 (int64) (int64))
		1248	(zeroExtend64From32 (int32) (int64))
		1249	(zeroExtend64From8 (int64) (int64))
		2000	(byteSizeOf (oop) (int32))
		2001	(firstFieldPointer (oop) (pointer))
		2002	(firstIndexableFieldPointer (oop) (pointer))
		2003	(isBytes (oop) (int32))
		2004	(isFloatObject (oop) (int32))
		2005	(isIndexable (oop) (int32))
		2006	(isIntegerObject (oop) (int32))
		2007	(isPointers (oop) (int32))
		2008	(isWords (oop) (int32))
		2009	(isWordsOrBytes (oop) (int32))
		2010	(oopSmallIntegerToInt32 (oop) (int32))
		2011	(oopSmallIntegerToInt64 (oop) (int64))
		2012	(oopToBoolean32 (oop) (int32))
		2013	(oopToBoolean64 (oop) (int64))
		2014	(oopToFloat32 (oop) (float32))
		2015	(oopToFloat64 (oop) (float64))
		2016	(oopToInt32 (oop) (int32))
		2017	(oopToInt64 (oop) (int64))
		2018	(oopToPointer (oop) (pointer))
		2019	(oopToPointerReinterpret (oop) (pointer))
		2020	(oopToUInt32 (oop) (int32))
		2021	(oopToUInt64 (oop) (int64))
		2022	(pin (oop) ())
		2023	(unpin (oop) ())
		3000	(oopEqual (oop oop) (int32))
		3001	(oopNotEqual (oop oop) (int32))
		3002	(storeObjectField (oop oop) ())
		3003	(storeObjectFieldAt (oop int32 oop) ())
	)

]

{ #category : #'as yet unclassified' }
IRLowcodeInstruction class >> lowcodeStackTransitionTable [
	^ LowcodeStackTransitionTable
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
