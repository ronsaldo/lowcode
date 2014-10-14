Class {
	#name : #LowcodeOnContextTest,
	#superclass : #TestCase,
	#instVars : [
		'isdigitFunction',
		'strlen'
	],
	#category : #'Lowcode-Test'
}

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> add: a with: b [
	^ Lowcode here: [ :gen |
		gen pushTemp: 0;
			oopToInt32;
			pushTemp: 1;
			oopToInt32;
			add32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> byteSizeOf: object [
	^ Lowcode here: [ :gen |
		gen pushTemp: 0;
			byteSizeOf;
			uint32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> failWithLocal [
	| local |
	^ Lowcode here: [ :gen |
		local := gen allocateLocalInt32.
		gen pushConstantUInt32: 0;
			storeLocalInt32: local;
			fail;
			returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> ifTest:aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 2 ]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> inlinePrimitiveFail [
	^ Lowcode here: [ :gen |
		gen fail;
			returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> isDigit: character [
	^ Lowcode here: [ :gen |
		gen pushMyInstanceVariable: #isdigitFunction;
			oopToPointer;
			pushTemp: 0;
			oopToInt32;
			beginCall: 16;
			callArgumentInt32;
			performCallIndirectInt32;
			endCall;
			int32ToOop;
			returnTop
	]

]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnAdd32 [
	^ Lowcode here: [ :gen |
		gen pushOne32;
			pushOne32;
			add32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnBranchTrue32: bool [
	| cont trueLabel |
	^ Lowcode here: [ :gen |
		cont := gen makeLabel: 'cont'.
		trueLabel := gen makeLabel: 'true'.
		gen pushTemp: 0;
			oopSmallIntegerToInt32;
			branchTrue32: trueLabel;
			pushZero;
			jump: cont;
			putLabel: trueLabel;
			pushOne;
			putLabel: cont;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnFalse [
	^ Lowcode here: [ :gen |
		gen returnFalse
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnOne [
	^ Lowcode here: [ :gen |
		gen pushOne;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnOne32 [
	^ Lowcode here: [ :gen |
		gen pushOne32;
			int32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnSelf [
	^ Lowcode here: [ :gen |
		gen returnReceiver
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnUseLocalPointer: aPointer [
	| pointerTemp |
	^ Lowcode here: [ :gen |
		pointerTemp := gen allocateLocalPointer.
		gen pushTemp: 0;
			oopToPointer;
			storeLocalPointer: pointerTemp;
			loadLocalPointer: pointerTemp;
			pointerToInt32;
			smallInt32ToOop;
			returnTop
	]
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> returnZero32 [
	^ Lowcode here: [ :gen |
		gen pushZero32;
			int32ToOop;
			returnTop
	]
]

{ #category : #running }
LowcodeOnContextTest >> setUp [
	isdigitFunction := FFI loadSymbol: 'isdigit' fromModule: 0.
	strlen := FFI loadSymbol: 'strlen' fromModule: 0.
]

{ #category : #'as yet unclassified' }
LowcodeOnContextTest >> strlen: arg [
	^ Lowcode here: [ :gen |
		| doneConversion failedConversion sizeTemp sourcePointerTemp stringPointerTemp |
		doneConversion := gen makeLabel: 'doneConversion'.
		failedConversion := gen makeLabel: 'failedConversion'.
		sizeTemp := gen allocateLocalInt32. 
		sourcePointerTemp := gen allocateLocalPointer.
		stringPointerTemp := gen allocateLocalPointer.
		
		"Check for ByteString"
		gen argumentCount: 1;	
			emitSessionCheck;
			
			pushMyInstanceVariable: #strlen;
			oopToPointer;
			
			pushTemp: 0;
			duplicateStackTop;
			isBytes;
			branchFalse32: failedConversion;
			
			"Get the source pointer"
			duplicateStackTop;	
				
			firstIndexableFieldPointer;
			storeLocalPointer: sourcePointerTemp;

		"Get the string size"
		byteSizeOf;
	
		"Store the string size."
		duplicateInt32;
		storeLocalInt32: sizeTemp;

		"Allocate the C-string"
		pushOne32;
		add32;
		malloc32;
		duplicatePointer;
		storeLocalPointer: stringPointerTemp;
				
		"Copy the string"
		loadLocalPointer: sourcePointerTemp;
		loadLocalInt32: sizeTemp;
		memcpy32;
		
				"Put the trailing \0"
		loadLocalPointer: stringPointerTemp;
		loadLocalInt32: sizeTemp;
		pointerAddOffset32;
		pushZero32;
		storeInt8ToMemory;
		
				"Return the pointer"
		loadLocalPointer: stringPointerTemp;
		jump: doneConversion;
		
			putLabel: failedConversion;
			returnReceiver;
			
			putLabel: doneConversion;
			
			beginCall: 16;
			callArgumentPointer;
			performCallIndirectInt32;
			endCall;
		
			loadLocalPointer: stringPointerTemp;
			free;
					
			uint32ToOop;
			returnTop
			
	]
]

{ #category : #tests }
LowcodeOnContextTest >> testAdd [
	self assert: (self add: 1 with: 3) equals: 4
]

{ #category : #tests }
LowcodeOnContextTest >> testBranchTrue32 [
	self assert: (self returnBranchTrue32: 0) equals: 0.
	self assert: (self returnBranchTrue32: 1) equals: 1.
	self assert: (self returnBranchTrue32: 2) equals: 1.
]

{ #category : #tests }
LowcodeOnContextTest >> testByteSizeOf [
	self assert: (self byteSizeOf: '1') equals: 1.
	self assert: (self byteSizeOf: '') equals: 0.
	self assert: (self byteSizeOf: 'aa') equals: 2.
]

{ #category : #tests }
LowcodeOnContextTest >> testIsDigit [
	self assert: (self isDigit: $3 charCode) ~= 0.
	self assert: (self isDigit: $a charCode) equals: 0
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnAdd32 [
	self assert: self returnAdd32 = 2
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnFalse [
	self assert: self returnFalse = false
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnOne [
	self assert: self returnOne = 1
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnOne32 [
	self assert: self returnOne32 = 1
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnSelf [
	self assert: self returnSelf == self
]

{ #category : #'lowcode methods' }
LowcodeOnContextTest >> testReturnUseLocalPointer [
	self assert: (self returnUseLocalPointer: FFIExternalAddress null) value equals: 0.
	self assert: (self returnUseLocalPointer: (FFIExternalAddress value: 16)) value equals: 16.
]

{ #category : #tests }
LowcodeOnContextTest >> testReturnZero32 [
	self assert: self returnZero32 = 0
]

{ #category : #tests }
LowcodeOnContextTest >> testStrLen [
	self assert: (self strlen: 'ab') equals: 2
]
