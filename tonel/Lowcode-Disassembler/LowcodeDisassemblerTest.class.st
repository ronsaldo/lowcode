"
A LowcodeDisassemblerTest is a test class for testing the behavior of LowcodeDisassembler
"
Class {
	#name : #LowcodeDisassemblerTest,
	#superclass : #TestCase,
	#category : #'Lowcode-Disassembler-Tests'
}

{ #category : #tests }
LowcodeDisassemblerTest >> generate: aBlock [
	| gen lowcodeMethod dis |
	gen := LowcodeAssembler new.
	aBlock value: gen.
	lowcodeMethod := gen emit.

	"Disassemble and validate the method"
	dis := LowcodeDisassembler forAssembledMethod: lowcodeMethod.
	^ dis disassemble.

]

{ #category : #tests }
LowcodeDisassemblerTest >> testLowcodeLoop [
	| method start done|
	method := self generate: [ :gen |
		start := gen makeLabel: 'start'.
		done := gen makeLabel: 'done'.
		gen pushZero32;

			"Compare with 10"
			putLabel: start;
			duplicateInt32;
			pushConstantUInt32: 10;
			int32Equal;
			branchTrue32: done;
			
			"Increment"
			pushOne32;
			add32;
			jump: start;
			
			"Return 10"
			putLabel: done;
			returnInt32AsOop.
	].

	self assert: method basicBlocks size equals: 4.
	self assert: method isValid.
	self halt.
]

{ #category : #tests }
LowcodeDisassemblerTest >> testLowcodeLoopInvalid [
	| method start done|
	method := self generate: [ :gen |
		start := gen makeLabel: 'start'.
		done := gen makeLabel: 'done'.
		gen pushZero32;

			"Compare with 10"
			putLabel: start;
			"duplicateInt32;"
			pushConstantUInt32: 10;
			int32Equal;
			branchTrue32: done;
			
			"Increment"
			pushOne32;
			add32;
			jump: start;
			
			"Return 10"
			putLabel: done;
			returnInt32AsOop.
	].

	self assert: method basicBlocks size equals: 4.
	self assert: method isValid not.
]

{ #category : #tests }
LowcodeDisassemblerTest >> testSimple [
	| method |
	method := self generate: [ :gen |
		gen pushNil;
			returnTop. ].

	self assert: method basicBlocks size equals: 1.
	self assert: method basicBlocks first instructions size equals: 2.
	self assert: method isValid.
]

{ #category : #tests }
LowcodeDisassemblerTest >> testSimpleInvalid [
	| method |
	method := self generate: [ :gen |
		gen returnTop. ].

	self assert: method basicBlocks size equals: 1.
	self assert: method basicBlocks first instructions size equals: 1.
	self assert: method isValid not.
]

{ #category : #tests }
LowcodeDisassemblerTest >> testSimpleLowcode [
	| method |
	method := self generate: [ :gen |
		gen pushZero32;
			returnInt32AsOop. ].

	self assert: method basicBlocks size equals: 1.
	self assert: method basicBlocks first instructions size equals: 2.
	self assert: method isValid.
]

{ #category : #tests }
LowcodeDisassemblerTest >> testSimpleLowcodeInvalid [
	| method |
	method := self generate: [ :gen |
		gen pushZero;
			returnInt32AsOop. ].

	self assert: method basicBlocks size equals: 1.
	self assert: method basicBlocks first instructions size equals: 2.
	self assert: method isValid not.
]
