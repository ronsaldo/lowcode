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
0 operation
1 operation
2 operation
3 operation
4 operation
5 operation
6 operation
7 operation
8 operation
9 branch
10 branch
11 branch
12 branch
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
34 terminator
35 terminator
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
55 operation
56 operation
57 operation
58 operation
59 operation
60 operation
61 operation
62 operation
63 operation
64 operation
65 operation
66 operation
67 operation
68 operation
69 operation
70 operation
71 operation
72 operation
73 operation
74 operation
75 operation
76 operation
77 operation
78 operation
79 operation
80 operation
81 operation
82 operation
83 operation
84 operation
85 jump
86 operation
87 operation
88 operation
89 operation
90 operation
91 operation
92 operation
93 operation
94 operation
95 operation
96 operation
97 operation
98 operation
99 operation
100 operation
101 operation
102 operation
103 operation
104 operation
105 operation
106 operation
107 operation
108 operation
109 operation
110 operation
111 metadata
112 operation
113 operation
114 operation
115 operation
116 operation
117 operation
118 operation
119 operation
120 operation
121 operation
122 operation
123 operation
124 operation
125 operation
126 operation
127 operation
128 operation
129 operation
130 operation
131 operation
132 operation
133 operation
134 operation
135 operation
136 operation
137 operation
138 operation
139 operation
140 operation
141 operation
142 operation
143 operation
144 operation
145 operation
146 operation
147 operation
148 operation
149 operation
150 operation
151 operation
152 operation
153 operation
154 operation
155 operation
156 operation
157 operation
158 operation
159 operation
160 operation
161 operation
162 operation
163 operation
164 operation
165 operation
166 operation
167 operation
168 operation
169 operation
170 operation
171 operation
172 operation
173 operation
174 operation
175 operation
176 operation
177 operation
178 operation
179 operation
180 operation
181 operation
182 operation
183 operation
184 operation
185 operation
186 operation
187 operation
188 operation
189 operation
190 operation
191 operation
192 operation
193 operation
194 operation
195 operation
196 operation
197 operation
198 operation
199 operation
200 operation
201 operation
202 operation
203 operation
204 operation
205 operation
206 operation
207 operation
208 operation
209 operation
210 operation
211 operation
212 operation
213 operation
214 operation
215 operation
216 operation
217 operation
218 operation
219 operation
220 operation
221 operation
222 operation
223 operation
224 operation
225 operation
226 operation
227 operation
228 operation
229 operation
300 operation
301 operation
302 operation
303 operation
304 operation
305 operation
306 operation
307 operation
308 operation
309 operation
310 operation
1000 operation
1001 operation
1002 operation
1003 operation
1004 operation
1005 operation
1006 operation
1007 operation
1008 operation
1009 operation
1010 operation
1011 operation
1012 operation
1013 operation
1014 operation
1015 operation
1016 operation
1017 operation
1018 operation
1019 operation
1020 operation
1021 operation
1022 operation
1023 operation
1307 operation
1308 operation
1309 operation
1310 operation
1311 operation
2000 operation
2001 operation
2002 operation
2003 operation

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
LoDisLowcodeInstruction >> branchAddress [
	^ nextPC + extendB
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
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
	stack popInt64 ifFalse: [^ false ].
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
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
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
LoDisLowcodeInstruction >> jumpAddress [
	^ nextPC + extendB
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
LoDisLowcodeInstruction >> localFrameSizeValidate: stack forMethod: method [
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
