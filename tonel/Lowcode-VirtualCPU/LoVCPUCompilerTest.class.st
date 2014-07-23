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
LoVCPUCompilerTest >> testSimple [
	| method compiler |
	method := self generate: [ :gen |
		gen pushNil;
			returnTop. ].
	compiler := LoVCPUCompiler default.
	compiler compileDisassembledMethod: method
]
