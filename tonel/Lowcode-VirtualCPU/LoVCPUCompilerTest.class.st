"
A LoVCPUCompilerTest is a test class for testing the behavior of LoVCPUCompiler
"
Class {
	#name : #LoVCPUCompilerTest,
	#superclass : #TestCase,
	#category : #'Lowcode-VirtualCPU-Tests'
}

{ #category : #'as yet unclassified' }
LoVCPUCompilerTest >> generate: aBlock [
	| gen lowcodeMethod dis |
	gen := LowcodeAssembler new.
	aBlock value: gen.
	lowcodeMethod := gen emit.

	"Disassemble and validate the method"
	dis := LowcodeDisassembler forAssembledMethod: lowcodeMethod.
	^ dis disassemble.

]

{ #category : #'as yet unclassified' }
LoVCPUCompilerTest >> testLowcodeLoop [
	| method start done compiler|
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
			smallInt32ToOop;
			returnTop.
	].

	compiler := LoVCPUCompiler default.
	compiler compileDisassembledMethod: method
]

{ #category : #'as yet unclassified' }
LoVCPUCompilerTest >> testSimple [
	| method compiler |
	method := self generate: [ :gen |
		gen pushNil;
			returnTop. ].
	compiler := LoVCPUCompiler default.
	compiler compileDisassembledMethod: method
]
