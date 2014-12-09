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
			0 add32
			1 add64
			2 alloca32
			3 alloca64
			4 and32
			5 and64
			6 arithmeticRightShift32
			7 arithmeticRightShift64
			8 beginCall
			9 branchFalse32
			10 branchFalse64
			11 branchTrue32
			12 branchTrue64
			13 callArgumentFloat32
			14 callArgumentFloat64
			15 callArgumentInt32
			16 callArgumentInt64
			17 callArgumentPointer
			18 callArgumentStructure
			19 callInstruction
			20 callPhysical
			21 checkSessionIdentifier
			22 compareAndSwap32
			23 div32
			24 div64
			25 duplicateFloat32
			26 duplicateFloat64
			27 duplicateInt32
			28 duplicateInt64
			29 duplicatePointer
			30 effectiveAddress32
			31 effectiveAddress64
			32 endCall
			33 endCallNoCleanup
			34 fail
			35 failWithCode
			36 float32Add
			37 float32Div
			38 float32Equal
			39 float32Great
			40 float32GreatEqual
			41 float32Less
			42 float32LessEqual
			43 float32Mul
			44 float32NotEqual
			45 float32Sub
			46 float32ToFloat64
			47 float32ToInt32
			48 float32ToInt64
			49 float32ToUInt32
			50 float32ToUInt64
			51 float64Add
			52 float64Div
			53 float64Equal
			54 float64Great
			55 float64GreatEqual
			56 float64Less
			57 float64LessEqual
			58 float64Mul
			59 float64NotEqual
			60 float64Sub
			61 float64ToFloat32
			62 float64ToInt32
			63 float64ToInt64
			64 float64ToUInt32
			65 float64ToUInt64
			66 free
			67 int32Equal
			68 int32Great
			69 int32GreatEqual
			70 int32Less
			71 int32LessEqual
			72 int32NotEqual
			73 int32ToFloat32
			74 int32ToFloat64
			75 int32ToPointer
			76 int64Equal
			77 int64Great
			78 int64GreatEqual
			79 int64Less
			80 int64LessEqual
			81 int64NotEqual
			82 int64ToFloat32
			83 int64ToFloat64
			84 int64ToPointer
			85 jump
			86 leftShift32
			87 leftShift64
			88 loadFloat32FromMemory
			89 loadFloat64FromMemory
			90 loadInt16FromMemory
			91 loadInt32FromMemory
			92 loadInt64FromMemory
			93 loadInt8FromMemory
			94 loadLocalAddress
			95 loadLocalFloat32
			96 loadLocalFloat64
			97 loadLocalInt16
			98 loadLocalInt32
			99 loadLocalInt64
			100 loadLocalInt8
			101 loadLocalPointer
			102 loadLocalUInt16
			103 loadLocalUInt32
			104 loadLocalUInt64
			105 loadLocalUInt8
			106 loadPointerFromMemory
			107 loadUInt16FromMemory
			108 loadUInt32FromMemory
			109 loadUInt64FromMemory
			110 loadUInt8FromMemory
			111 localFrameSize
			112 lockRegisters
			113 lockVM
			114 malloc32
			115 malloc64
			116 memcpy32
			117 memcpy64
			118 memcpyFixed
			119 moveFloat32ToPhysical
			120 moveFloat64ToPhysical
			121 moveInt32ToPhysical
			122 moveInt64ToPhysical
			123 movePointerToPhysical
			124 mul32
			125 mul64
			126 neg32
			127 neg64
			128 not32
			129 not64
			130 or32
			131 or64
			132 performCallFloat32
			133 performCallFloat64
			134 performCallIndirectFloat32
			135 performCallIndirectFloat64
			136 performCallIndirectInt32
			137 performCallIndirectInt64
			138 performCallIndirectPointer
			139 performCallIndirectStructure
			140 performCallInt32
			141 performCallInt64
			142 performCallPointer
			143 performCallStructure
			144 plaftormCode
			145 pointerAddOffset32
			146 pointerAddOffset64
			147 pointerEqual
			148 pointerNotEqual
			149 pointerToInt32
			150 pointerToInt64
			151 popFloat32
			152 popFloat64
			153 popInt32
			154 popInt64
			155 popPointer
			156 pushConstantUInt32
			157 pushConstantUInt64
			158 pushNullPointer
			159 pushOne32
			160 pushOne64
			161 pushOneFloat32
			162 pushOneFloat64
			163 pushPhysicalFloat32
			164 pushPhysicalFloat64
			165 pushPhysicalInt32
			166 pushPhysicalInt64
			167 pushPhysicalPointer
			168 pushSessionIdentifier
			169 pushZero32
			170 pushZero64
			171 pushZeroFloat32
			172 pushZeroFloat64
			173 rem32
			174 rem64
			175 rightShift32
			176 rightShift64
			177 signExtend32From16
			178 signExtend32From8
			179 signExtend64From16
			180 signExtend64From32
			181 signExtend64From8
			182 storeFloat32ToMemory
			183 storeFloat64ToMemory
			184 storeInt16ToMemory
			185 storeInt32ToMemory
			186 storeInt64ToMemory
			187 storeInt8ToMemory
			188 storeLocalFloat32
			189 storeLocalFloat64
			190 storeLocalInt16
			191 storeLocalInt32
			192 storeLocalInt64
			193 storeLocalInt8
			194 storeLocalPointer
			195 storePointerToMemory
			196 sub32
			197 sub64
			198 truncate32To16
			199 truncate32To8
			200 truncate64To16
			201 truncate64To32
			202 truncate64To8
			203 udiv32
			204 udiv64
			205 uint32Great
			206 uint32GreatEqual
			207 uint32Less
			208 uint32LessEqual
			209 uint32ToFloat32
			210 uint32ToFloat64
			211 uint64Great
			212 uint64GreatEqual
			213 uint64Less
			214 uint64LessEqual
			215 uint64ToFloat32
			216 uint64ToFloat64
			217 umul32
			218 umul64
			219 unlockRegisters
			220 unlockVM
			221 urem32
			222 urem64
			223 xor32
			224 xor64
			225 zeroExtend32From16
			226 zeroExtend32From8
			227 zeroExtend64From16
			228 zeroExtend64From32
			229 zeroExtend64From8
			300 boolean32ToOop
			301 boolean64ToOop
			302 float32ToOop
			303 float64ToOop
			304 int32ToOop
			305 int64ToOop
			306 pointerToOop
			307 pointerToOopReinterprer
			308 smallInt32ToOop
			309 uint32ToOop
			310 uint64ToOop
			1000 byteSizeOf
			1001 firstFieldPointer
			1002 firstIndexableFieldPointer
			1003 isBytes
			1004 isFloatObject
			1005 isIndexable
			1006 isIntegerObject
			1007 isPointers
			1008 isWords
			1009 isWordsOrBytes
			1010 oopSmallIntegerToInt32
			1011 oopSmallIntegerToInt64
			1012 oopToBoolean32
			1013 oopToBoolean64
			1014 oopToFloat32
			1015 oopToFloat64
			1016 oopToInt32
			1017 oopToInt64
			1018 oopToPointer
			1019 oopToPointerReinterpret
			1020 oopToUInt32
			1021 oopToUInt64
			1022 pin
			1023 unpin
			1307 instantiateIndexable32Oop
			1308 instantiateIndexableOop
			1309 instantiateOop
			1310 loadObjectAt
			1311 loadObjectField
			2000 oopEqual
			2001 oopNotEqual
			2002 storeObjectField
			2003 storeObjectFieldAt
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

{ #category : #'as yet unclassified' }
LowcodeStreamElement class >> initialize [
	super initialize.
	self initMnemonicTables.
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement class >> lowcodeMnemonicFor: opcode [
	^ LowcodeMnemonics at: opcode
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement class >> sistaExtendedBytecodeMnemonicFor: opcode [
	^ SistaExtendedBytecodeMnemonics at: opcode
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
	numBytes >= 4 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 24 bitAnd: 16rFF) ].
	numBytes >= 3 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 16 bitAnd: 16rFF) ].
	numBytes >= 2 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 8 bitAnd: 16rFF) ].
	numBytes >= 1 ifTrue: [ stream nextPut: opcode; nextPut: (value bitAnd: 16rFF) ].
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
LowcodeStreamElement >> emitExtendLabel: relativeOffset toStream: stream [
	| numBytes opcode value |
	opcode := 225.
	value := relativeOffset.
	numBytes := self labelSize.
	numBytes >= 4 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 24 bitAnd: 16rFF) ].
	numBytes >= 3 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 16 bitAnd: 16rFF) ].
	numBytes >= 2 ifTrue: [ stream nextPut: opcode; nextPut: (value >> 8 bitAnd: 16rFF) ].
	numBytes >= 1 ifTrue: [ stream nextPut: opcode; nextPut: (value bitAnd: 16rFF) ].
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitToStream: stream [
	self subclassResponsibility
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> labelSize [
	^ 3
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement >> lowcodeMnemonicFor: opcode [
	^ LowcodeMnemonics at: opcode
]

{ #category : #'as yet unclassified' }
LowcodeStreamElement >> sistaExtendedBytecodeMnemonicFor: opcode [
	^ SistaExtendedBytecodeMnemonics at: opcode
]
