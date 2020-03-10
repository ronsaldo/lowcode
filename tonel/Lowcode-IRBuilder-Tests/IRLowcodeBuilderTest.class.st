"
An IRLowcodeBuilderTest is a test class for testing the behavior of IRLowcodeBuilder
"
Class {
	#name : #IRLowcodeBuilderTest,
	#superclass : #TestCase,
	#classVars : [
		'DisassembleMethod'
	],
	#category : #'Lowcode-IRBuilder-Tests'
}

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest class >> disableAssemblyDebug [
	<script>
	DisassembleMethod := false
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest class >> enableAssemblyDebug [
	<script>
	DisassembleMethod := true
]

{ #category : #'initialize - event' }
IRLowcodeBuilderTest class >> initialize [
	DisassembleMethod := false
]

{ #category : #helper }
IRLowcodeBuilderTest >> assertMethod: method withArguments: arguments equals: expectedResult [
	| result |
	result := self runMethod: method withArguments: arguments.
	self assert: result equals: expectedResult
]

{ #category : #helper }
IRLowcodeBuilderTest >> assertNullaryMethodResultBuildWith: aBlock equals: expectedResult [
	^ self assertMethod: (self method: #nullary arguments: #() buildWith: aBlock)
		withArguments: #() equals: expectedResult
]

{ #category : #helper }
IRLowcodeBuilderTest >> binaryFloat32MethodWith: aBlock [
	^ self method: #binaryFloat32 arguments: #(left right) buildWith: [ :builder |
		builder
			pushTemp: #left;
			lowcodeOopToFloat32;
			pushTemp: #right;
			lowcodeOopToFloat32.

		aBlock value: builder.
		
		builder
			lowcodeFloat32ToOop;
			returnTop
	].
]

{ #category : #helper }
IRLowcodeBuilderTest >> binaryFloat64MethodWith: aBlock [
	^ self method: #binaryFloat64 arguments: #(left right) buildWith: [ :builder |
		builder
			pushTemp: #left;
			lowcodeOopToFloat64;
			pushTemp: #right;
			lowcodeOopToFloat64.

		aBlock value: builder.
		
		builder
			lowcodeFloat64ToOop;
			returnTop
	].
]

{ #category : #helper }
IRLowcodeBuilderTest >> binaryInt32MethodWith: aBlock [
	^ self method: #binaryFloat64 arguments: #(left right) buildWith: [ :builder |
		builder
			pushTemp: #left;
			lowcodeOopToInt32;
			pushTemp: #right;
			lowcodeOopToInt32.

		aBlock value: builder.
		
		builder
			lowcodeInt32ToOop;
			returnTop
	].
]

{ #category : #helper }
IRLowcodeBuilderTest >> binaryInt64MethodWith: aBlock [
	^ self method: #binaryFloat64 arguments: #(left right) buildWith: [ :builder |
		builder
			pushTemp: #left;
			lowcodeOopToInt64;
			pushTemp: #right;
			lowcodeOopToInt64.

		aBlock value: builder.
		
		builder
			lowcodeInt64ToOop;
			returnTop
	].
]

{ #category : #helper }
IRLowcodeBuilderTest >> byteArrayAtOffsetLoadMethodWith: aBlock [
	^ self method: #byteArrayLoadAt arguments: #(byteArray offset) buildWith: [ :builder |
		builder
			pushTemp: #byteArray;
			lowcodeFirstFieldPointer;
			pushTemp: #offset;
			lowcodeOopToUInt32;
			lowcodePointerAddOffset32.

		aBlock value: builder.
		
		builder
			returnTop
	].
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest >> disassemblyMethod: method [
	| cogit cogMethod |

	cogit := Smalltalk globals at: #StackToRegisterMappingCogit.
	cogMethod := cogit
	cog: method
	options: #(COGMTVM false
				ObjectMemory Spur64BitCoMemoryManager
				MULTIPLEBYTECODESETS true
				SistaVM true
				LowcodeVM true
				bytecodeTableInitializer initializeBytecodeTableForSqueakV3PlusClosuresSistaV1Hybrid).
	cogMethod third inspect
]

{ #category : #helper }
IRLowcodeBuilderTest >> externalAddressAtOffsetLoadMethodWith: aBlock [
	^ self method: #externalAddressLoadAt arguments: #(externalAddress offset) buildWith: [ :builder |
		builder
			pushTemp: #externalAddress;
			lowcodeOopToPointer;
			pushTemp: #offset;
			lowcodeOopToUInt32;
			lowcodePointerAddOffset32.

		aBlock value: builder.
		
		builder
			returnTop
	].
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest >> method: selector arguments: argumentNames buildWith: aBlock [
	| ir |
	ir := IRLowcodeBuilder buildIR: [ :builder |
		builder
			numArgs: argumentNames size;
			addTemps: argumentNames;
			addLowcodeRuntimeTemporaries.
		aBlock value: builder
	].
	ir compilationContext encoderClass: EncoderForSistaV1.
	"ir inspect. self halt."
	^ ir generate
		setSignFlag;
		setFrameBit: true; 
		yourself
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest >> nullaryMethodBuildAndRunWith: aBlock [
	| method |
	method := self method: #nullary arguments: #() buildWith: aBlock.
	^ self runMethod: method withArguments: #()
]

{ #category : #helper }
IRLowcodeBuilderTest >> runMethod: method withArguments: arguments [
	DisassembleMethod ifTrue: [
		self disassemblyMethod: method.
		self halt.
	].

	^ method valueWithReceiver: nil arguments: arguments
]

{ #category : #tests }
IRLowcodeBuilderTest >> testAddFloat32 [
	| method |
	method := self binaryFloat32MethodWith: [ :builder |
		builder lowcodeFloat32Add
	].

	self assertMethod: method withArguments: #(0.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(1.5 3.5) equals: 5.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testAddFloat64 [
	| method |
	method := self binaryFloat64MethodWith: [ :builder |
		builder lowcodeFloat64Add
	].

	self assertMethod: method withArguments: #(0.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(1.5 3.5) equals: 5.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testAddInt32 [
	| method |
	method := self binaryInt32MethodWith: [ :builder |
		builder lowcodeAdd32
	].
	self assertMethod: method withArguments: #(0 0) equals: 0.
	self assertMethod: method withArguments: #(1 3) equals: 4.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testAddInt64 [
	| method |
	method := self binaryInt64MethodWith: [ :builder |
		builder lowcodeAdd64
	].
	self assertMethod: method withArguments: #(0 0) equals: 0.
	self assertMethod: method withArguments: #(1 3) equals: 4.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadFloat32 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadFloat32FromMemory;
			lowcodeFloat32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0.0 1.5 2.0 -1.5 -2.0 -3.0) doWithIndex: [ :value :index |
		byteArray floatAt: (index -1)*4 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.0.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 1.5.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 2.0.
	self assertMethod: method withArguments: { byteArray . 12 } equals: -1.5.
	self assertMethod: method withArguments: { byteArray . 16 } equals: -2.0.
	self assertMethod: method withArguments: { byteArray . 20 } equals: -3.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadFloat64 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadFloat64FromMemory;
			lowcodeFloat64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0.0 1.5 2.0 -1.5 -2.0 -3.0) doWithIndex: [ :value :index |
		byteArray doubleAt: (index -1)*8 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.0.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 1.5.
	self assertMethod: method withArguments: { byteArray . 16 } equals: 2.0.
	self assertMethod: method withArguments: { byteArray . 24 } equals: -1.5.
	self assertMethod: method withArguments: { byteArray . 32 } equals: -2.0.
	self assertMethod: method withArguments: { byteArray . 40 } equals: -3.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadInt16 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt16FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 12.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedShortAt: (index -1)*2 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 2 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 6 } equals: -1.
	self assertMethod: method withArguments: { byteArray . 8 } equals: -2.
	self assertMethod: method withArguments: { byteArray . 10 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadInt32 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt32FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongAt: (index -1)*4 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 12 } equals: -1.
	self assertMethod: method withArguments: { byteArray . 16 } equals: -2.
	self assertMethod: method withArguments: { byteArray . 20 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadInt64 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt64FromMemory;
			lowcodeInt64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongLongAt: (index -1)*8 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 16 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 24 } equals: -1.
	self assertMethod: method withArguments: { byteArray . 32 } equals: -2.
	self assertMethod: method withArguments: { byteArray . 40 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadInt8 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt8FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := #[0 1 2 255 254 253].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 1 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 2 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 3 } equals: -1.
	self assertMethod: method withArguments: { byteArray . 4 } equals: -2.
	self assertMethod: method withArguments: { byteArray . 5 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadPointer [
	| method byteArray firstPointer secondPointer |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadPointerFromMemory;
			lowcodePointerToOop: ExternalAddress
	].

	self assert: ExternalAddress wordSize <= 8.
	byteArray := ByteArray new: 16.
	firstPointer := ExternalAddress fromAddress: 16rDEADC0DE.
	secondPointer := ExternalAddress fromAddress: 16rBEEFDEAD.
	byteArray
		pointerAt: 1 put: firstPointer;
		pointerAt: 9 put: secondPointer.
	
	self assertMethod: method withArguments: { byteArray . 0 } equals: firstPointer.
	self assertMethod: method withArguments: { byteArray . 8 } equals: secondPointer.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadUInt16 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt16FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 12.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedShortAt: (index -1)*2 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 2 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 6 } equals: 65535.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 65534.
	self assertMethod: method withArguments: { byteArray . 10 } equals: 65533.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadUInt32 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt32FromMemory;
			lowcodeUint32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongAt: (index -1)*4 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 12 } equals: 4294967295.
	self assertMethod: method withArguments: { byteArray . 16 } equals: 4294967294.
	self assertMethod: method withArguments: { byteArray . 20 } equals: 4294967293.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadUInt64 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt64FromMemory;
			lowcodeUint64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongLongAt: (index -1)*8 + 1 put: value
	].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 8 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 16 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 24 } equals: 18446744073709551615.
	self assertMethod: method withArguments: { byteArray . 32 } equals: 18446744073709551614.
	self assertMethod: method withArguments: { byteArray . 40 } equals: 18446744073709551613.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayLoadUInt8 [
	| method byteArray |
	method := self byteArrayAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt8FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := #[0 1 2 255 254 253].
	self assertMethod: method withArguments: { byteArray . 0 } equals: 0.
	self assertMethod: method withArguments: { byteArray . 1 } equals: 1.
	self assertMethod: method withArguments: { byteArray . 2 } equals: 2.
	self assertMethod: method withArguments: { byteArray . 3 } equals: 255.
	self assertMethod: method withArguments: { byteArray . 4 } equals: 254.
	self assertMethod: method withArguments: { byteArray . 5 } equals: 253.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreFloat32 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToFloat32] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreFloat32ToMemory].

	byteArray := (ByteArray new: 24) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0.0 }.
	self runMethod: method withArguments: { byteArray . 4 . 1.5 }.
	self runMethod: method withArguments: { byteArray . 8 . 2.0 }.
	self runMethod: method withArguments: { byteArray . 12 . -1.0 }.
	self runMethod: method withArguments: { byteArray . 16 . -2.5 }.
	self runMethod: method withArguments: { byteArray . 20 . -3.0 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		byteArray floatAt: (index-1)*4 + 1
	]) equals: #(0.0 1.5 2.0 -1.0 -2.5 -3.0)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreFloat64 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToFloat64] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreFloat64ToMemory].

	byteArray := (ByteArray new: 48) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0.0 }.
	self runMethod: method withArguments: { byteArray . 8 . 1.5 }.
	self runMethod: method withArguments: { byteArray . 16 . 2.0 }.
	self runMethod: method withArguments: { byteArray . 24 . -1.0 }.
	self runMethod: method withArguments: { byteArray . 32 . -2.5 }.
	self runMethod: method withArguments: { byteArray . 40 . -3.0 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		byteArray doubleAt: (index-1)*8 + 1
	]) equals: #(0.0 1.5 2.0 -1.0 -2.5 -3.0)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreInt16 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreInt16ToMemory].

	byteArray := (ByteArray new: 12) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0 }.
	self runMethod: method withArguments: { byteArray . 2 . 1 }.
	self runMethod: method withArguments: { byteArray . 4 . 2 }.
	self runMethod: method withArguments: { byteArray . 6 . -1 }.
	self runMethod: method withArguments: { byteArray . 8 . -2 }.
	self runMethod: method withArguments: { byteArray . 10 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		byteArray signedShortAt: (index-1)*2 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreInt32 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreInt32ToMemory].

	byteArray := (ByteArray new: 24) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0 }.
	self runMethod: method withArguments: { byteArray . 4 . 1 }.
	self runMethod: method withArguments: { byteArray . 8 . 2 }.
	self runMethod: method withArguments: { byteArray . 12 . -1 }.
	self runMethod: method withArguments: { byteArray . 16 . -2 }.
	self runMethod: method withArguments: { byteArray . 20 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		byteArray signedLongAt: (index-1)*4 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreInt64 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt64] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreInt64ToMemory].

	byteArray := (ByteArray new: 48) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0 }.
	self runMethod: method withArguments: { byteArray . 8 . 1 }.
	self runMethod: method withArguments: { byteArray . 16 . 2 }.
	self runMethod: method withArguments: { byteArray . 24 . -1 }.
	self runMethod: method withArguments: { byteArray . 32 . -2 }.
	self runMethod: method withArguments: { byteArray . 40 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		byteArray signedLongLongAt: (index-1)*8 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStoreInt8 [
	| method byteArray |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStoreInt8ToMemory].

	byteArray := (ByteArray new: 6) atAllPut: 80.
	self runMethod: method withArguments: { byteArray . 0 . 0 }.
	self runMethod: method withArguments: { byteArray . 1 . 1 }.
	self runMethod: method withArguments: { byteArray . 2 . 2 }.
	self runMethod: method withArguments: { byteArray . 3 . -1 }.
	self runMethod: method withArguments: { byteArray . 4 . -2 }.
	self runMethod: method withArguments: { byteArray . 5 . -3 }.
	
	self assert: byteArray equals: #[0 1 2 255 254 253].
]

{ #category : #tests }
IRLowcodeBuilderTest >> testByteArrayStorePointer [
	| method byteArray firstPointer secondPointer |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToPointer] 		storeAtByteArrayOffsetMethodWith: [: builder | builder lowcodeStorePointerToMemory].

	self assert: ExternalAddress wordSize <= 8.
	byteArray := (ByteArray new: 16) atAllPut: 80.
	firstPointer := ExternalAddress fromAddress: 16rDEADC0DE.
	secondPointer := ExternalAddress fromAddress: 16rBEEFDEAD.
	
	self runMethod: method withArguments: { byteArray . 0 . firstPointer }.
	self runMethod: method withArguments: { byteArray . 8 . secondPointer }.
	
	self assert: (byteArray pointerAt: 1) equals: firstPointer.
	self assert: (byteArray pointerAt: 9) equals: secondPointer.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testDivFloat32 [
	| method |
	method := self binaryFloat32MethodWith: [ :builder |
		builder lowcodeFloat32Div
	].

	self assertMethod: method withArguments: #(1.0 0.0) equals: Float infinity.
	self assertMethod: method withArguments: #(2.0 4.0) equals: 0.5.
	self assertMethod: method withArguments: #(4.0 -2.0) equals: -2.0.
	self assertMethod: method withArguments: #(-6.0 2.0) equals: -3.0.
	self assertMethod: method withArguments: #(-7.0 -2.0) equals: 3.5.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testDivFloat64 [
	| method |
	method := self binaryFloat64MethodWith: [ :builder |
		builder lowcodeFloat64Div
	].

	self assertMethod: method withArguments: #(1.0 0.0) equals: Float infinity.
	self assertMethod: method withArguments: #(2.0 4.0) equals: 0.5.
	self assertMethod: method withArguments: #(4.0 -2.0) equals: -2.0.
	self assertMethod: method withArguments: #(-6.0 2.0) equals: -3.0.
	self assertMethod: method withArguments: #(-7.0 -2.0) equals: 3.5.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testDivInt32 [
	| method |
	method := self binaryInt32MethodWith: [ :builder |
		builder lowcodeDiv32
	].

	self assertMethod: method withArguments: #(2 4) equals: 0.
	self assertMethod: method withArguments: #(4 -2) equals: -2.
	self assertMethod: method withArguments: #(-6 3) equals: -2.
	self assertMethod: method withArguments: #(-7 -2) equals: 3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testDivInt64 [
	| method |
	method := self binaryInt64MethodWith: [ :builder |
		builder lowcodeDiv64
	].

	self assertMethod: method withArguments: #(2 4) equals: 0.
	self assertMethod: method withArguments: #(4 -2) equals: -2.
	self assertMethod: method withArguments: #(-6 3) equals: -2.
	self assertMethod: method withArguments: #(-7 -2) equals: 3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadFloat32 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadFloat32FromMemory;
			lowcodeFloat32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0.0 1.5 2.0 -1.5 -2.0 -3.0) doWithIndex: [ :value :index |
		byteArray floatAt: (index -1)*4 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.0.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 1.5.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 2.0.
	self assertMethod: method withArguments: { externalAddress . 12 } equals: -1.5.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: -2.0.
	self assertMethod: method withArguments: { externalAddress . 20 } equals: -3.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadFloat64 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadFloat64FromMemory;
			lowcodeFloat64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0.0 1.5 2.0 -1.5 -2.0 -3.0) doWithIndex: [ :value :index |
		byteArray doubleAt: (index -1)*8 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.0.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 1.5.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: 2.0.
	self assertMethod: method withArguments: { externalAddress . 24 } equals: -1.5.
	self assertMethod: method withArguments: { externalAddress . 32 } equals: -2.0.
	self assertMethod: method withArguments: { externalAddress . 40 } equals: -3.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadInt16 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt16FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 12.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedShortAt: (index -1)*2 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 2 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 6 } equals: -1.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: -2.
	self assertMethod: method withArguments: { externalAddress . 10 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadInt32 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt32FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongAt: (index -1)*4 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 12 } equals: -1.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: -2.
	self assertMethod: method withArguments: { externalAddress . 20 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadInt64 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt64FromMemory;
			lowcodeInt64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongLongAt: (index -1)*8 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 24 } equals: -1.
	self assertMethod: method withArguments: { externalAddress . 32 } equals: -2.
	self assertMethod: method withArguments: { externalAddress . 40 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadInt8 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadInt8FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := #[0 1 2 255 254 253].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 1 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 2 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 3 } equals: -1.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: -2.
	self assertMethod: method withArguments: { externalAddress . 5 } equals: -3.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadPointer [
	| method externalAddress firstPointer secondPointer |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadPointerFromMemory;
			lowcodePointerToOop: ExternalAddress
	].

	self assert: ExternalAddress wordSize <= 8.
	externalAddress := ExternalAddress gcallocate: 16.
	firstPointer := ExternalAddress fromAddress: 16rDEADC0DE.
	secondPointer := ExternalAddress fromAddress: 16rBEEFDEAD.
	externalAddress
		pointerAt: 1 put: firstPointer;
		pointerAt: 9 put: secondPointer.
	
	self assertMethod: method withArguments: { externalAddress . 0 } equals: firstPointer.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: secondPointer.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadUInt16 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt16FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := ByteArray new: 12.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedShortAt: (index -1)*2 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 2 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 6 } equals: 65535.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 65534.
	self assertMethod: method withArguments: { externalAddress . 10 } equals: 65533.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadUInt32 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt32FromMemory;
			lowcodeUint32ToOop
	].

	byteArray := ByteArray new: 24.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongAt: (index -1)*4 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 12 } equals: 4294967295.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: 4294967294.
	self assertMethod: method withArguments: { externalAddress . 20 } equals: 4294967293.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadUInt64 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt64FromMemory;
			lowcodeUint64ToOop
	].

	byteArray := ByteArray new: 48.
	#(0 1 2 -1 -2 -3) doWithIndex: [ :value :index |
		byteArray signedLongLongAt: (index -1)*8 + 1 put: value
	].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 8 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 16 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 24 } equals: 18446744073709551615.
	self assertMethod: method withArguments: { externalAddress . 32 } equals: 18446744073709551614.
	self assertMethod: method withArguments: { externalAddress . 40 } equals: 18446744073709551613.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressLoadUInt8 [
	| method byteArray externalAddress |
	method := self externalAddressAtOffsetLoadMethodWith: [ :builder |
		builder
			lowcodeLoadUInt8FromMemory;
			lowcodeInt32ToOop
	].

	byteArray := #[0 1 2 255 254 253].
	externalAddress := ExternalAddress gcallocate: byteArray size.
	LibC memCopy: byteArray to: externalAddress size: byteArray size.
	self assertMethod: method withArguments: { externalAddress . 0 } equals: 0.
	self assertMethod: method withArguments: { externalAddress . 1 } equals: 1.
	self assertMethod: method withArguments: { externalAddress . 2 } equals: 2.
	self assertMethod: method withArguments: { externalAddress . 3 } equals: 255.
	self assertMethod: method withArguments: { externalAddress . 4 } equals: 254.
	self assertMethod: method withArguments: { externalAddress . 5 } equals: 253.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreFloat32 [
	| method externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToFloat32] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreFloat32ToMemory].

	externalAddress := ExternalAddress gcallocate: 24.
	self runMethod: method withArguments: { externalAddress . 0 . 0.0 }.
	self runMethod: method withArguments: { externalAddress . 4 . 1.5 }.
	self runMethod: method withArguments: { externalAddress . 8 . 2.0 }.
	self runMethod: method withArguments: { externalAddress . 12 . -1.0 }.
	self runMethod: method withArguments: { externalAddress . 16 . -2.5 }.
	self runMethod: method withArguments: { externalAddress . 20 . -3.0 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		externalAddress floatAt: (index-1)*4 + 1
	]) equals: #(0.0 1.5 2.0 -1.0 -2.5 -3.0)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreFloat64 [
	| method externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToFloat64] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreFloat64ToMemory].

	externalAddress := ExternalAddress gcallocate: 48.
	self runMethod: method withArguments: { externalAddress . 0 . 0.0 }.
	self runMethod: method withArguments: { externalAddress . 8 . 1.5 }.
	self runMethod: method withArguments: { externalAddress . 16 . 2.0 }.
	self runMethod: method withArguments: { externalAddress . 24 . -1.0 }.
	self runMethod: method withArguments: { externalAddress . 32 . -2.5 }.
	self runMethod: method withArguments: { externalAddress . 40 . -3.0 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		externalAddress doubleAt: (index-1)*8 + 1
	]) equals: #(0.0 1.5 2.0 -1.0 -2.5 -3.0)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreInt16 [
	| method externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreInt16ToMemory].

	externalAddress := ExternalAddress gcallocate: 12.
	self runMethod: method withArguments: { externalAddress . 0 . 0 }.
	self runMethod: method withArguments: { externalAddress . 2 . 1 }.
	self runMethod: method withArguments: { externalAddress . 4 . 2 }.
	self runMethod: method withArguments: { externalAddress . 6 . -1 }.
	self runMethod: method withArguments: { externalAddress . 8 . -2 }.
	self runMethod: method withArguments: { externalAddress . 10 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		externalAddress signedShortAt: (index-1)*2 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreInt32 [
	| method externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreInt32ToMemory].

	externalAddress := ExternalAddress gcallocate: 24.
	self runMethod: method withArguments: { externalAddress . 0 . 0 }.
	self runMethod: method withArguments: { externalAddress . 4 . 1 }.
	self runMethod: method withArguments: { externalAddress . 8 . 2 }.
	self runMethod: method withArguments: { externalAddress . 12 . -1 }.
	self runMethod: method withArguments: { externalAddress . 16 . -2 }.
	self runMethod: method withArguments: { externalAddress . 20 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		externalAddress signedLongAt: (index-1)*4 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreInt64 [
	| method externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt64] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreInt64ToMemory].

	externalAddress := ExternalAddress gcallocate: 48.
	self runMethod: method withArguments: { externalAddress . 0 . 0 }.
	self runMethod: method withArguments: { externalAddress . 8 . 1 }.
	self runMethod: method withArguments: { externalAddress . 16 . 2 }.
	self runMethod: method withArguments: { externalAddress . 24 . -1 }.
	self runMethod: method withArguments: { externalAddress . 32 . -2 }.
	self runMethod: method withArguments: { externalAddress . 40 . -3 }.
	
	self assert: ((1 to: 6) collect: [ :index |
		externalAddress signedLongLongAt: (index-1)*8 + 1
	]) equals: #(0 1 2 -1 -2 -3)
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStoreInt8 [
	| method byteArray externalAddress |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToInt32] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStoreInt8ToMemory].

	externalAddress := ExternalAddress gcallocate: 6.
	self runMethod: method withArguments: { externalAddress . 0 . 0 }.
	self runMethod: method withArguments: { externalAddress . 1 . 1 }.
	self runMethod: method withArguments: { externalAddress . 2 . 2 }.
	self runMethod: method withArguments: { externalAddress . 3 . -1 }.
	self runMethod: method withArguments: { externalAddress . 4 . -2 }.
	self runMethod: method withArguments: { externalAddress . 5 . -3 }.
	
	byteArray := (ByteArray new: 6) atAllPut: 80.
	LibC memCopy: externalAddress to: byteArray size: 6.
	self assert: byteArray equals: #[0 1 2 255 254 253].
]

{ #category : #tests }
IRLowcodeBuilderTest >> testExternalAddressStorePointer [
	| method externalAddress firstPointer secondPointer |
	method := self valueConvertedWith: [:builder | builder lowcodeOopToPointer] 		storeAtExternalAddressOffsetMethodWith: [: builder | builder lowcodeStorePointerToMemory].

	self assert: ExternalAddress wordSize <= 8.
	externalAddress := ExternalAddress gcallocate: 16.
	firstPointer := ExternalAddress fromAddress: 16rDEADC0DE.
	secondPointer := ExternalAddress fromAddress: 16rBEEFDEAD.
	
	self runMethod: method withArguments: { externalAddress . 0 . firstPointer }.
	self runMethod: method withArguments: { externalAddress . 8 . secondPointer }.
	
	self assert: (externalAddress pointerAt: 1) equals: firstPointer.
	self assert: (externalAddress pointerAt: 9) equals: secondPointer.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testMulFloat32 [
	| method |
	method := self binaryFloat32MethodWith: [ :builder |
		builder lowcodeFloat32Mul
	].

	self assertMethod: method withArguments: #(1.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(2.0 6.0) equals: 12.0.
	self assertMethod: method withArguments: #(4.0 -0.5) equals: -2.0.
	self assertMethod: method withArguments: #(-6.0 0.5) equals: -3.0.
	self assertMethod: method withArguments: #(-7.0 -0.5) equals: 3.5.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testMulFloat64 [
	| method |
	method := self binaryFloat64MethodWith: [ :builder |
		builder lowcodeFloat64Mul
	].

	self assertMethod: method withArguments: #(1.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(2.0 6.0) equals: 12.0.
	self assertMethod: method withArguments: #(4.0 -0.5) equals: -2.0.
	self assertMethod: method withArguments: #(-6.0 0.5) equals: -3.0.
	self assertMethod: method withArguments: #(-7.0 -0.5) equals: 3.5.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testMulInt32 [
	| method |
	method := self binaryInt32MethodWith: [ :builder |
		builder lowcodeMul32
	].

	self assertMethod: method withArguments: #(1 0) equals: 0.
	self assertMethod: method withArguments: #(2 6) equals: 12.
	self assertMethod: method withArguments: #(4 -3) equals: -12.
	self assertMethod: method withArguments: #(-6 3) equals: -18.
	self assertMethod: method withArguments: #(-7 -3) equals: 21.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testMulInt64 [
	| method |
	method := self binaryInt64MethodWith: [ :builder |
		builder lowcodeMul64
	].

	self assertMethod: method withArguments: #(1 0) equals: 0.
	self assertMethod: method withArguments: #(2 6) equals: 12.
	self assertMethod: method withArguments: #(4 -3) equals: -12.
	self assertMethod: method withArguments: #(-6 3) equals: -18.
	self assertMethod: method withArguments: #(-7 -3) equals: 21.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushConstantUInt32 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushConstantUInt32: 42;
			lowcodeInt32ToOop;
			returnTop
	] equals: 42
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushConstantUInt64 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushConstantUInt64: 42;
			lowcodeInt64ToOop;
			returnTop
	] equals: 42
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushOne32 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushOne32;
			lowcodeInt32ToOop;
			returnTop
	] equals: 1
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushOne64 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushOne64;
			lowcodeInt64ToOop;
			returnTop
	] equals: 1
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushOneFloat32 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushOneFloat32;
			lowcodeFloat32ToOop;
			returnTop
	] equals: 1.0
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushOneFloat64 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushOneFloat64;
			lowcodeFloat64ToOop;
			returnTop
	] equals: 1.0
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushZero32 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushZero32;
			lowcodeInt32ToOop;
			returnTop
	] equals: 0
]

{ #category : #tests }
IRLowcodeBuilderTest >> testPushZero64 [
	self assertNullaryMethodResultBuildWith: [ :builder |
		builder
			lowcodePushZero64;
			lowcodeInt64ToOop;
			returnTop
	] equals: 0
]

{ #category : #tests }
IRLowcodeBuilderTest >> testSubFloat32 [
	| method |
	method := self binaryFloat32MethodWith: [ :builder |
		builder lowcodeFloat32Sub
	].

	self assertMethod: method withArguments: #(0.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(1.5 3.5) equals: -2.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testSubFloat64 [
	| method |
	method := self binaryFloat64MethodWith: [ :builder |
		builder lowcodeFloat64Sub
	].

	self assertMethod: method withArguments: #(0.0 0.0) equals: 0.0.
	self assertMethod: method withArguments: #(1.5 3.5) equals: -2.0.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testSubInt32 [
	| method |
	method := self binaryInt32MethodWith: [ :builder |
		builder lowcodeSub32
	].
	self assertMethod: method withArguments: #(0 0) equals: 0.
	self assertMethod: method withArguments: #(1 3) equals: -2.
]

{ #category : #tests }
IRLowcodeBuilderTest >> testSubInt64 [
	| method |
	method := self binaryInt64MethodWith: [ :builder |
		builder lowcodeSub64
	].
	self assertMethod: method withArguments: #(0 0) equals: 0.
	self assertMethod: method withArguments: #(1 3) equals: -2.
]

{ #category : #helper }
IRLowcodeBuilderTest >> valueConvertedWith: valueConversionBlock storeAtByteArrayOffsetMethodWith: valueStoreBlock [
	^ self method: #byteArrayStoreValueAt arguments: #(byteArray offset value) buildWith: [ :builder |
		builder pushTemp: #value.
		valueConversionBlock value: builder.
		
		builder
			pushTemp: #byteArray;
			lowcodeFirstFieldPointer;
			pushTemp: #offset;
			lowcodeOopToUInt32;
			lowcodePointerAddOffset32.

		valueStoreBlock value: builder.
		
		builder
			pushReceiver;
			returnTop
	].
]

{ #category : #helper }
IRLowcodeBuilderTest >> valueConvertedWith: valueConversionBlock storeAtExternalAddressOffsetMethodWith: valueStoreBlock [
	^ self method: #externalAddressStoreValueAt arguments: #(externalAddress offset value) buildWith: [ :builder |
		builder pushTemp: #value.
		valueConversionBlock value: builder.
		
		builder
			pushTemp: #externalAddress;
			lowcodeOopToPointer;
			pushTemp: #offset;
			lowcodeOopToUInt32;
			lowcodePointerAddOffset32.

		valueStoreBlock value: builder.
		
		builder
			pushReceiver;
			returnTop
	].
]
