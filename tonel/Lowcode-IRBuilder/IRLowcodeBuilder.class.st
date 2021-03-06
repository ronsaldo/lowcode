"
I am a IR builder with support for native local variables.
"
Class {
	#name : #IRLowcodeBuilder,
	#superclass : #IRBuilder,
	#instVars : [
		'localFrameInstruction',
		'gensymCount',
		'leaveFrameInstructions'
	],
	#category : #'Lowcode-IRBuilder'
}

{ #category : #'as yet unclassified' }
IRLowcodeBuilder class >> here: aBlock [
	| argumentNames |
	argumentNames := thisContext sender arguments.
	^ self buildIR: [ :builder |
		builder
			numArgs: argumentNames size;
			addTemps: argumentNames.
		aBlock value: builder
	]
]

{ #category : #adding }
IRLowcodeBuilder >> addNativeTemp: aNativeTempName [
	self addNativeTemps: { aNativeTempName }
]

{ #category : #adding }
IRLowcodeBuilder >> addNativeTemps: aNativeTempNamesWithSizes [
	self currentScope addNativeTemps: aNativeTempNamesWithSizes.
	localFrameInstruction extendA: (localFrameInstruction extendA max: self currentScope totalLocalFrameSize).
]

{ #category : #temporaries }
IRLowcodeBuilder >> generateNativeTemp: size [
	| tempSymbol |
	tempSymbol := self generateSymbol.
	self addNativeTemp: tempSymbol -> size.
	^ tempSymbol
]

{ #category : #temporaries }
IRLowcodeBuilder >> generateOopTemp [
	| tempSymbol |
	tempSymbol := self generateSymbol.
	self addTemp: tempSymbol.
	^ tempSymbol
]

{ #category : #temporaries }
IRLowcodeBuilder >> generateSymbol [
	gensymCount := gensymCount + 1.
	^ ('gensym:' , gensymCount printString) asSymbol
]

{ #category : #initialization }
IRLowcodeBuilder >> initialize [
	super initialize.
	self lowcodeLocalFrameSize: 0 maxDepth: 20.
	localFrameInstruction := currentSequence last.
	leaveFrameInstructions := OrderedCollection new.
	gensymCount := 0.
]

{ #category : #accessing }
IRLowcodeBuilder >> ir [
	| hasLowcodeInstructions |
	hasLowcodeInstructions := false.
	ir allInstructions do: [ :ins |
		(ins ~~ localFrameInstruction and: [ ins isLowcodeInstruction ]) ifTrue: [ hasLowcodeInstructions := true ].
	].
	hasLowcodeInstructions ifTrue: [
		| implicitTempCount |
		implicitTempCount := self lowcodeRequiredTemporaries .
		ir tempMap keysAndValuesDo: [ :key :value |
			value > ir numArgs ifTrue: [ 
				ir tempMap at: key put: value + implicitTempCount.
			].
		].
		1 to: implicitTempCount do: [ :i |
			ir tempMap at: {#lowcodeStorage . i} put: i + ir numArgs
		].
	] ifFalse: [
		self removeLowcodeStuff.
	].
	^ super ir
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeAdd32 [
	self add: (IRInstruction lowcodeInstruction: 1000)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeAdd64 [
	self add: (IRInstruction lowcodeInstruction: 1001)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeAnd32 [
	self add: (IRInstruction lowcodeInstruction: 1004)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeAnd64 [
	self add: (IRInstruction lowcodeInstruction: 1005)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeArithmeticRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 1006)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeArithmeticRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 1007)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeBoolean32ToOop [
	self add: (IRInstruction lowcodeInstruction: 0)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeBoolean64ToOop [
	self add: (IRInstruction lowcodeInstruction: 1)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeByteSizeOf [
	self add: (IRInstruction lowcodeInstruction: 2000)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeCheckSessionIdentifier: a1NexpectedSession [
	self add: (IRInstruction lowcodeInstruction: 1018 extendA: a1NexpectedSession)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeCompareAndSwap32 [
	self add: (IRInstruction lowcodeInstruction: 1019)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDiv32 [
	self add: (IRInstruction lowcodeInstruction: 1020)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDiv64 [
	self add: (IRInstruction lowcodeInstruction: 1021)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDuplicateFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1022)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDuplicateFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1023)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDuplicateInt32 [
	self add: (IRInstruction lowcodeInstruction: 1024)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDuplicateInt64 [
	self add: (IRInstruction lowcodeInstruction: 1025)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeDuplicatePointer [
	self add: (IRInstruction lowcodeInstruction: 1026)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeEffectiveAddress32 [
	self add: (IRInstruction lowcodeInstruction: 1027)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeEffectiveAddress64 [
	self add: (IRInstruction lowcodeInstruction: 1028)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFirstFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 2001)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFirstIndexableFieldPointer [
	self add: (IRInstruction lowcodeInstruction: 2002)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Add [
	self add: (IRInstruction lowcodeInstruction: 1031)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Div [
	self add: (IRInstruction lowcodeInstruction: 1032)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Equal [
	self add: (IRInstruction lowcodeInstruction: 1033)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Great [
	self add: (IRInstruction lowcodeInstruction: 1034)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1035)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Less [
	self add: (IRInstruction lowcodeInstruction: 1036)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1037)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Mul [
	self add: (IRInstruction lowcodeInstruction: 1038)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Neg [
	self add: (IRInstruction lowcodeInstruction: 1039)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1040)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Sqrt [
	self add: (IRInstruction lowcodeInstruction: 1041)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32Sub [
	self add: (IRInstruction lowcodeInstruction: 1042)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1043)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1044)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1045)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToOop [
	self add: (IRInstruction lowcodeInstruction: 2)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 1046)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat32ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 1047)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Add [
	self add: (IRInstruction lowcodeInstruction: 1048)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Div [
	self add: (IRInstruction lowcodeInstruction: 1049)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Equal [
	self add: (IRInstruction lowcodeInstruction: 1050)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Great [
	self add: (IRInstruction lowcodeInstruction: 1051)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1052)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Less [
	self add: (IRInstruction lowcodeInstruction: 1053)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1054)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Mul [
	self add: (IRInstruction lowcodeInstruction: 1055)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Neg [
	self add: (IRInstruction lowcodeInstruction: 1056)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1057)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Sqrt [
	self add: (IRInstruction lowcodeInstruction: 1058)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64Sub [
	self add: (IRInstruction lowcodeInstruction: 1059)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1060)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1061)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1062)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToOop [
	self add: (IRInstruction lowcodeInstruction: 3)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 1063)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFloat64ToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 1064)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeFree [
	self add: (IRInstruction lowcodeInstruction: 1065)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInstantiateIndexable32Oop [
	self add: (IRInstruction lowcodeInstruction: 1066)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInstantiateIndexableOop: a1NindexableSize [
	self add: (IRInstruction lowcodeInstruction: 1067 extendA: a1NindexableSize)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInstantiateOop [
	self add: (IRInstruction lowcodeInstruction: 1068)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32Equal [
	self add: (IRInstruction lowcodeInstruction: 1069)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32Great [
	self add: (IRInstruction lowcodeInstruction: 1070)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1071)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32Less [
	self add: (IRInstruction lowcodeInstruction: 1072)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1073)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1074)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1075)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1076)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 4)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt32ToPointer [
	self add: (IRInstruction lowcodeInstruction: 1077)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64Equal [
	self add: (IRInstruction lowcodeInstruction: 1078)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64Great [
	self add: (IRInstruction lowcodeInstruction: 1079)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1080)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64Less [
	self add: (IRInstruction lowcodeInstruction: 1081)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1082)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64NotEqual [
	self add: (IRInstruction lowcodeInstruction: 1083)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1084)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1085)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64ToOop [
	self add: (IRInstruction lowcodeInstruction: 5)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeInt64ToPointer [
	self add: (IRInstruction lowcodeInstruction: 1086)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsBytes [
	self add: (IRInstruction lowcodeInstruction: 2003)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsFloatObject [
	self add: (IRInstruction lowcodeInstruction: 2004)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsIndexable [
	self add: (IRInstruction lowcodeInstruction: 2005)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsIntegerObject [
	self add: (IRInstruction lowcodeInstruction: 2006)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsPointers [
	self add: (IRInstruction lowcodeInstruction: 2007)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsWords [
	self add: (IRInstruction lowcodeInstruction: 2008)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeIsWordsOrBytes [
	self add: (IRInstruction lowcodeInstruction: 2009)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLeaveLocalFrame [
	self add: (IRInstruction lowcodeInstruction: 1087)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLeftShift32 [
	self add: (IRInstruction lowcodeInstruction: 1088)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLeftShift64 [
	self add: (IRInstruction lowcodeInstruction: 1089)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadFloat32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1102)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadFloat64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1103)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1104)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1105)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1106)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1107)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalAddress: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1108 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1109 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1110 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1111 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1112 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1113 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1114 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1115 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalUInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1116 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalUInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1117 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalUInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1118 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadLocalUInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1119 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadObjectAt [
	self add: (IRInstruction lowcodeInstruction: 1120)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 1121 extendA: a1NfieldIndex)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadPointerFromMemory [
	self add: (IRInstruction lowcodeInstruction: 1122)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadUInt16FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1123)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadUInt32FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1124)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadUInt64FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1125)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLoadUInt8FromMemory [
	self add: (IRInstruction lowcodeInstruction: 1126)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLocalFrameSize: a1Nsize maxDepth: a2NmaxDepth [
	self add: (IRInstruction lowcodeInstruction: 1127 extendA: a1Nsize extendB: a2NmaxDepth)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeLockVM [
	self add: (IRInstruction lowcodeInstruction: 1129)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMalloc32 [
	self add: (IRInstruction lowcodeInstruction: 1130)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMalloc64 [
	self add: (IRInstruction lowcodeInstruction: 1131)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMemcpy32 [
	self add: (IRInstruction lowcodeInstruction: 1132)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMemcpy64 [
	self add: (IRInstruction lowcodeInstruction: 1133)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMemcpyFixed: a1Nsize [
	self add: (IRInstruction lowcodeInstruction: 1134 extendA: a1Nsize)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMul32 [
	self add: (IRInstruction lowcodeInstruction: 1140)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeMul64 [
	self add: (IRInstruction lowcodeInstruction: 1141)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeNeg32 [
	self add: (IRInstruction lowcodeInstruction: 1142)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeNeg64 [
	self add: (IRInstruction lowcodeInstruction: 1143)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeNot32 [
	self add: (IRInstruction lowcodeInstruction: 1144)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeNot64 [
	self add: (IRInstruction lowcodeInstruction: 1145)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopEqual [
	self add: (IRInstruction lowcodeInstruction: 3000)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopNotEqual [
	self add: (IRInstruction lowcodeInstruction: 3001)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopSmallIntegerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 2010)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopSmallIntegerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 2011)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToBoolean32 [
	self add: (IRInstruction lowcodeInstruction: 2012)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToBoolean64 [
	self add: (IRInstruction lowcodeInstruction: 2013)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 2014)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 2015)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToInt32 [
	self add: (IRInstruction lowcodeInstruction: 2016)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToInt64 [
	self add: (IRInstruction lowcodeInstruction: 2017)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToPointer [
	self add: (IRInstruction lowcodeInstruction: 2018)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToPointerReinterpret [
	self add: (IRInstruction lowcodeInstruction: 2019)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToUInt32 [
	self add: (IRInstruction lowcodeInstruction: 2020)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOopToUInt64 [
	self add: (IRInstruction lowcodeInstruction: 2021)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOr32 [
	self add: (IRInstruction lowcodeInstruction: 1146)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeOr64 [
	self add: (IRInstruction lowcodeInstruction: 1147)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePin [
	self add: (IRInstruction lowcodeInstruction: 2022)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePlaftormCode [
	self add: (IRInstruction lowcodeInstruction: 1162)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerAddConstantOffset: a1Noffset [
	self add: (IRInstruction lowcodeInstruction: 1163 extendB: a1Noffset)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerAddOffset32 [
	self add: (IRInstruction lowcodeInstruction: 1164)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerAddOffset64 [
	self add: (IRInstruction lowcodeInstruction: 1165)
]

{ #category : #'lowcode abstract instruction' }
IRLowcodeBuilder >> lowcodePointerAddOopIndex [
	Smalltalk wordSize = 4 ifTrue: [
		self
			lowcodeOopToInt32;
			lowcodePushOne32;
			lowcodeSub32;
			lowcodePointerAddOffset32
	] ifFalse: [
		self
			lowcodeOopToInt64;
			lowcodePushOne64;
			lowcodeSub64;
			lowcodePointerAddOffset64
	]
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerEqual [
	self add: (IRInstruction lowcodeInstruction: 1166)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerNotEqual [
	self add: (IRInstruction lowcodeInstruction: 1167)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerToInt32 [
	self add: (IRInstruction lowcodeInstruction: 1168)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerToInt64 [
	self add: (IRInstruction lowcodeInstruction: 1169)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerToOop: a1NpointerClassLiteral [
	self add: (IRInstruction lowcodeInstruction: 6 literal: a1NpointerClassLiteral)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePointerToOopReinterprer [
	self add: (IRInstruction lowcodeInstruction: 7)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1170)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1171)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopInt32 [
	self add: (IRInstruction lowcodeInstruction: 1172)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopInt64 [
	self add: (IRInstruction lowcodeInstruction: 1173)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopMultipleNative: a1NpopSize [
	self add: (IRInstruction lowcodeInstruction: 1174 extendA: a1NpopSize)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePopPointer [
	self add: (IRInstruction lowcodeInstruction: 1175)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushConstantUInt32: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 1176 extendA: a1Nconstant)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushConstantUInt64: a1Nconstant [
	self add: (IRInstruction lowcodeInstruction: 1177 extendA: a1Nconstant)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushNullPointer [
	self add: (IRInstruction lowcodeInstruction: 1178)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushOne32 [
	self add: (IRInstruction lowcodeInstruction: 1179)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushOne64 [
	self add: (IRInstruction lowcodeInstruction: 1180)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushOneFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1181)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushOneFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1182)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushSessionIdentifier [
	self add: (IRInstruction lowcodeInstruction: 1188)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushZero32 [
	self add: (IRInstruction lowcodeInstruction: 1189)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushZero64 [
	self add: (IRInstruction lowcodeInstruction: 1190)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushZeroFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1191)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodePushZeroFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1192)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeRem32 [
	self add: (IRInstruction lowcodeInstruction: 1193)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeRem64 [
	self add: (IRInstruction lowcodeInstruction: 1194)
]

{ #category : #accessing }
IRLowcodeBuilder >> lowcodeRequiredTemporaries [
	| requirementeFinder |
	requirementeFinder := IRLowcodeStackRequirementFinder new.
	requirementeFinder visitNode: ir.
	localFrameInstruction extendB: requirementeFinder requiredLowcodeStackTemporaries.
	
	^ "contextMark stackSize stackPointer" 3 + localFrameInstruction extendB
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeRightShift32 [
	self add: (IRInstruction lowcodeInstruction: 1195)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeRightShift64 [
	self add: (IRInstruction lowcodeInstruction: 1196)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSignExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 1197)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSignExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 1198)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSignExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 1199)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSignExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 1200)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSignExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 1201)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSmallInt32ToOop [
	self add: (IRInstruction lowcodeInstruction: 8)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreFloat32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1202)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreFloat64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1203)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreInt16ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1204)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreInt32ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1205)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreInt64ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1206)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreInt8ToMemory [
	self add: (IRInstruction lowcodeInstruction: 1207)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalFloat32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1208 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalFloat64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1209 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalInt16: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1210 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalInt32: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1211 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalInt64: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1212 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalInt8: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1213 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreLocalPointer: a1NbaseOffset [
	self add: (IRInstruction lowcodeInstruction: 1214 extendA: (self nativeLocalOffsetOf: a1NbaseOffset))
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreObjectField: a1NfieldIndex [
	self add: (IRInstruction lowcodeInstruction: 3002 extendA: a1NfieldIndex)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStoreObjectFieldAt [
	self add: (IRInstruction lowcodeInstruction: 3003)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeStorePointerToMemory [
	self add: (IRInstruction lowcodeInstruction: 1215)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSub32 [
	self add: (IRInstruction lowcodeInstruction: 1216)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeSub64 [
	self add: (IRInstruction lowcodeInstruction: 1217)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeTruncate32To16 [
	self add: (IRInstruction lowcodeInstruction: 1218)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeTruncate32To8 [
	self add: (IRInstruction lowcodeInstruction: 1219)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeTruncate64To16 [
	self add: (IRInstruction lowcodeInstruction: 1220)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeTruncate64To32 [
	self add: (IRInstruction lowcodeInstruction: 1221)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeTruncate64To8 [
	self add: (IRInstruction lowcodeInstruction: 1222)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUdiv32 [
	self add: (IRInstruction lowcodeInstruction: 1223)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUdiv64 [
	self add: (IRInstruction lowcodeInstruction: 1224)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32Great [
	self add: (IRInstruction lowcodeInstruction: 1225)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1226)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32Less [
	self add: (IRInstruction lowcodeInstruction: 1227)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1228)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1229)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1230)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint32ToOop [
	self add: (IRInstruction lowcodeInstruction: 9)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64Great [
	self add: (IRInstruction lowcodeInstruction: 1231)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64GreatEqual [
	self add: (IRInstruction lowcodeInstruction: 1232)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64Less [
	self add: (IRInstruction lowcodeInstruction: 1233)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64LessEqual [
	self add: (IRInstruction lowcodeInstruction: 1234)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64ToFloat32 [
	self add: (IRInstruction lowcodeInstruction: 1235)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64ToFloat64 [
	self add: (IRInstruction lowcodeInstruction: 1236)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUint64ToOop [
	self add: (IRInstruction lowcodeInstruction: 10)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUmul32 [
	self add: (IRInstruction lowcodeInstruction: 1237)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUmul64 [
	self add: (IRInstruction lowcodeInstruction: 1238)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUnlockVM [
	self add: (IRInstruction lowcodeInstruction: 1240)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUnpin [
	self add: (IRInstruction lowcodeInstruction: 2023)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUrem32 [
	self add: (IRInstruction lowcodeInstruction: 1241)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeUrem64 [
	self add: (IRInstruction lowcodeInstruction: 1242)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeXor32 [
	self add: (IRInstruction lowcodeInstruction: 1243)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeXor64 [
	self add: (IRInstruction lowcodeInstruction: 1244)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeZeroExtend32From16 [
	self add: (IRInstruction lowcodeInstruction: 1245)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeZeroExtend32From8 [
	self add: (IRInstruction lowcodeInstruction: 1246)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeZeroExtend64From16 [
	self add: (IRInstruction lowcodeInstruction: 1247)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeZeroExtend64From32 [
	self add: (IRInstruction lowcodeInstruction: 1248)
]

{ #category : #'lowcode instructions' }
IRLowcodeBuilder >> lowcodeZeroExtend64From8 [
	self add: (IRInstruction lowcodeInstruction: 1249)
]

{ #category : #accessing }
IRLowcodeBuilder >> nativeLocalOffsetOf: nativeTempName [
	^ self currentScope nativeLocalOffsetOf: nativeTempName
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilder >> popTop [
	currentSequence ifNotEmpty: [ 
		currentSequence last isJustPushing ifTrue: [
			currentSequence removeLast.
			^ self.
		]
	].

	super popTop
]

{ #category : #scopes }
IRLowcodeBuilder >> pushScope: aScope [
	| nativeScope |
	nativeScope := (IRLowcodeScope on: aScope builder: self).
	currentScope ifNotEmpty: [ nativeScope parentLowcodeScope: self currentScope ].
	^ super pushScope: nativeScope.
]

{ #category : #accessing }
IRLowcodeBuilder >> removeLowcodeStuff [
	| lowcodeTempNames |
	localFrameInstruction sequence remove: localFrameInstruction.
	leaveFrameInstructions do: [ :each |
		each sequence remove: each
	].

	lowcodeTempNames := self currentScope tempMap keys select: [:key | key beginsWith: #__lowcode].
	lowcodeTempNames size == self currentScope tempMap size ifTrue: [
		self currentScope tempMap removeAll.
	].
]

{ #category : #instructions }
IRLowcodeBuilder >> returnTop [
	self lowcodeLeaveLocalFrame.
	leaveFrameInstructions add: currentSequence last.
	^ super returnTop.
]

{ #category : #accessing }
IRLowcodeBuilder >> visitSequence: node [
	self halt
]
