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

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest >> disassemblyMethod: method [
	self halt
]

{ #category : #'as yet unclassified' }
IRLowcodeBuilderTest >> method: selector arguments: argumentNames buildWith: aBlock [
	| ir |
	ir := IRLowcodeBuilder buildIR: [ :builder |
		builder
			numArgs: argumentNames size;
			addTemps: argumentNames.
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
