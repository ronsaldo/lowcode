Class {
	#name : #LoDisSistaInstruction,
	#superclass : #LoDisInstruction,
	#instVars : [
		'firstByte',
		'secondByte'
	],
	#classVars : [
		'InstructionKinds',
		'SistaIsBranchInstruction',
		'SistaIsJumpInstruction',
		'SistaIsTerminatorInstruction'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #'class initialization' }
LoDisSistaInstruction class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	self initializeInstructionKindMap
	
]

{ #category : #initialization }
LoDisSistaInstruction class >> initializeInstructionKindMap [
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
88 terminator
89 terminator
90 terminator
91 terminator
92 terminator
95 operation
119 operation
208 operation
209 operation
210 operation
211 operation
212 operation
213 operation
214 operation
215 operation
216 operation

	)
]

{ #category : #'instance creation' }
LoDisSistaInstruction class >> new: opcode [
	^ self new opcode: opcode
]

{ #category : #'instance creation' }
LoDisSistaInstruction class >> new: opcode with: firstByte [
	^ self new opcode: opcode; firstByte: firstByte
]

{ #category : #'instance creation' }
LoDisSistaInstruction class >> new: opcode with: firstByte with: secondByte [
	^ self new opcode: opcode; firstByte: firstByte; secondByte: secondByte
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> dupTopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisSistaInstruction >> firstByte [
	
	^ firstByte
]

{ #category : #accessing }
LoDisSistaInstruction >> firstByte: anObject [
	
	firstByte := anObject
]

{ #category : #accessing }
LoDisSistaInstruction >> instructionKind [
	^ InstructionKinds at: opcode ifAbsent: [ #operation ]
]

{ #category : #printing }
LoDisSistaInstruction >> mnemonic [
	^ LowcodeStreamElement sistaExtendedBytecodeMnemonicFor: opcode
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> nopValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> popAndStoreTempValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> popStackTopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushFalseValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushLiteralSmallIndexValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushLiteralVariableSmallIndexValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushNilValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushOneValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushReceiverValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushReceiverVariableSmallIndexValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushTempSmallIndex2Validate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushTempSmallIndexValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushThisContextValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushTrueValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> pushZeroValidate: stack forMethod: method [
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> returnFalseValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> returnNilValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> returnReceiverValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> returnTopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> returnTrueValidate: stack forMethod: method [
	^ true
]

{ #category : #accessing }
LoDisSistaInstruction >> secondByte [
	
	^ secondByte
]

{ #category : #accessing }
LoDisSistaInstruction >> secondByte: anObject [
	
	secondByte := anObject
]

{ #category : #'validation generated' }
LoDisSistaInstruction >> sendSpecialMessageClassValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]
