Class {
	#name : #LoDisLowcodeInstruction,
	#superclass : #LoDisInstruction,
	#classVars : [
		'InstructionKinds'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #'class initialization' }
LoDisLowcodeInstruction class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	self initializeInstructionKindMap
	
]

{ #category : #initialization }
LoDisLowcodeInstruction class >> initializeInstructionKindMap [
	InstructionKinds := IdentityDictionary newFromPairs: #(
7 operation
8 operation
9 operation
10 operation
11 operation
12 operation
13 operation
14 operation
15 operation
16 operation
17 operation
18 operation
19 operation
20 operation
21 operation
22 operation
23 operation
24 operation
25 operation
26 operation
27 operation
28 operation
29 operation
30 operation
31 operation
32 operation
33 operation
34 operation
35 operation
36 operation
37 operation
38 operation
39 operation
40 operation
41 operation
42 operation
43 operation
44 operation
45 operation
46 operation
47 operation
48 operation
49 operation
50 operation
51 operation
52 operation
53 operation
54 operation
1069 operation
1070 operation
1071 operation
1072 operation
1073 operation
1074 operation
1075 operation
1076 operation
1077 operation
1078 operation
1079 operation
1080 operation
1081 operation
1082 operation
1083 operation
1084 operation
1085 operation
1086 operation
1087 operation
1088 operation
1089 operation
1090 operation
1091 operation
1092 operation
1093 operation
1094 operation
1095 operation
1096 operation
1097 operation
1098 operation
1099 operation
1100 operation
1101 operation
1102 operation
1103 operation
1104 operation
1105 operation
1106 operation
1107 operation
1108 operation
1109 operation
1110 operation
1111 operation
1112 operation
1113 operation
1114 operation
1115 operation
1116 operation
1117 operation
1118 operation
1119 operation
1120 operation
1121 operation
1122 operation
1123 operation
1124 operation
1125 operation
1126 operation
1127 operation
1128 operation
1129 operation
1130 operation
1131 operation
1132 operation
1133 operation
1134 operation
1135 operation
1136 operation
1137 operation
1138 operation
1139 operation
1140 operation
1141 operation
1142 operation
1143 operation
1144 operation
1145 operation
1146 operation
1147 operation
1148 operation
1149 operation
1150 operation
1151 operation
1152 operation
1153 operation
1154 operation
1155 operation
1156 operation
1157 operation
1158 operation
1159 operation
1160 operation
1161 operation
1162 operation
1163 operation
1164 operation
1165 operation
1166 operation
1167 operation
1168 operation
1169 operation
1170 operation
1171 operation
1172 operation
1173 operation
1174 operation
1175 operation
1176 operation
1177 operation
1178 operation
1179 operation
1180 operation
1181 operation
1182 operation
1183 operation
1184 operation
1185 operation
1186 operation
1187 operation
1188 operation
1189 operation
1190 operation
1191 operation
1192 operation
1193 operation
1194 operation
1195 operation
1196 operation
1197 operation
1198 operation
1199 operation
1200 operation
1201 operation
2005 operation
2006 operation
2007 operation
2008 operation
2009 operation
2010 operation
2011 operation
2012 operation
2013 operation
2014 operation
2015 operation
2016 operation
2017 operation
2018 operation
2019 operation
2020 operation
2021 operation
2022 operation
2023 operation
2024 operation
2025 operation
2026 operation
2027 operation
2028 operation
2029 operation
2030 operation
2031 operation
2032 operation
2033 operation
2034 operation
2035 operation
2036 operation
2037 operation
2038 operation
2039 operation
2040 operation
2041 operation
2042 operation
2043 operation
2044 operation
2045 operation
2046 operation
2047 operation
2048 operation
2049 operation
2050 operation
2051 operation
2052 operation
2053 operation
2054 operation
2055 operation
2056 operation
2057 operation
2058 operation
2059 operation
2060 operation
2061 operation
2062 operation
2063 operation
2064 operation
2065 operation
2066 operation
2067 operation
2068 operation
2069 operation
2070 operation
2071 operation
2072 operation
2073 operation
2074 operation
2075 operation
2076 operation
2077 operation
2078 operation
2079 operation
2080 operation
2081 operation
2082 operation
2083 operation
2084 operation
2085 operation
2086 operation
2087 operation
2088 operation
2089 operation
2090 operation
3000 operation
3001 operation
3002 operation
3003 operation
4000 operation
4001 operation

	)
]

{ #category : #'instance creation' }
LoDisLowcodeInstruction class >> new: opcode [
	^ self new opcode: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> beginCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> branchAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> byteSizeOfValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callInstructionValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callPhysicalValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> checkSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> compareAndSwap32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicatePointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallNoCleanupValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failWithCodeValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstIndexableFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32AddValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32DivValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32EqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32MulValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32NotEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32SubValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToFloat64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToOopValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToUInt32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToUInt64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64AddValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64DivValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64EqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64MulValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64NotEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64SubValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToFloat32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToOopValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToUInt32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToUInt64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> freeValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexable32OopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexableOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> instructionKind [
	^ InstructionKinds at: opcode ifAbsent: [ #operation ]
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32EqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToPointerValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64EqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToPointerValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isFloatObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIndexableValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIntegerObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isPointersValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsOrBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> jumpAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> jumpValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalAddressValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectAtValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadPointerFromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpyFixedValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #printing }
LoDisLowcodeInstruction >> mnemonic [
	^ LowcodeStreamElement lowcodeMnemonicFor: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat32ToPhysicalValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat64ToPhysicalValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt32ToPhysicalValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt64ToPhysicalValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> movePointerToPhysicalValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopNotEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerReinterpretValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> plaftormCodeValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerAddOffset32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerAddOffset64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerNotEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopReinterprerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushNullPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> smallInt32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat32ToMemoryValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat64ToMemoryValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt16ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt32ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt64ToMemoryValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt8ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldAtValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storePointerToMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unpinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]
