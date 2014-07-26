"
A LowcodeLLVMEngineTest is a test class for testing the behavior of LowcodeLLVMEngine
"
Class {
	#name : #LowcodeLLVMEngineTest,
	#superclass : #TestCase,
	#category : #'Lowcode-LLVM-Tests'
}

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> generate: aBlock [
	| gen   |
	gen := LowcodeAssembler new.
	aBlock value: gen.
	^ gen emit.
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testLowcodeLoop [
	| method start done compiledMethod |
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

	compiledMethod := LowcodeLLVMCompiledMethod for: method.
	compiledMethod destroy
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testLowcodeLoopCalling [
	| method start done lowcodeCompiledMethod compiledMethod |
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

	lowcodeCompiledMethod := LowcodeLLVMCompiledMethod for: method.
	[
		compiledMethod := lowcodeCompiledMethod createCaller.
		self assert: (compiledMethod isKindOf: CompiledMethod).
		self assert: (compiledMethod valueWithReceiver: nil arguments: #()) == 10.
	] ensure: [lowcodeCompiledMethod destroy]
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testLowcodeLoopInvalid [
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

	self should: [ LowcodeLLVMCompiledMethod for: method ] raise: Error.
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testSimple [
	| method compiledMethod |
	method := self generate: [ :gen |
		gen pushNil;
			returnTop. ].

	compiledMethod := LowcodeLLVMCompiledMethod for: method.
	compiledMethod destroy
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testSimple2 [
	| method compiledMethod |
	method := self generate: [ :gen |
		gen pushOne32;
			pushOne32;
			add32;
			returnInt32AsOop. ].
		
	compiledMethod := LowcodeLLVMCompiledMethod for: method.
	compiledMethod destroy
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testSimpleCalling [
	| method lowcodeCompiledMethod compiledMethod |
	method := self generate: [ :gen |
		gen pushNil;
			returnTop. ].

	lowcodeCompiledMethod := LowcodeLLVMCompiledMethod for: method.
	[
		compiledMethod := lowcodeCompiledMethod createCaller.
		self assert: (compiledMethod isKindOf: CompiledMethod).
		self assert: (compiledMethod valueWithReceiver: nil arguments: #()) == nil.
	] ensure: [ lowcodeCompiledMethod destroy ]
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngineTest >> testSimpleInvalid [
	| method |
	method := self generate: [ :gen |
		gen returnTop. ].

	self should: [ LowcodeLLVMCompiledMethod for: method ] raise: Error
]
