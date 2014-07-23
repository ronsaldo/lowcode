Class {
	#name : #LoVCPUCompiler,
	#superclass : #Object,
	#instVars : [
		'vcpuClass',
		'vcpuCompilerClass',
		'vcpu',
		'validatedMethod',
		'temporals',
		'receiver',
		'compiledCode',
		'machineCode',
		'interpreterProxyPointer',
		'interpreterProxy'
	],
	#category : #'Lowcode-VirtualCPU'
}

{ #category : #'as yet unclassified' }
LoVCPUCompiler class >> default [
	^ self vcpuClass: VCpuGeneratingCPU vcpuCompilerClass: VCpuX86Compiler
]

{ #category : #'as yet unclassified' }
LoVCPUCompiler class >> vcpuClass: aVCPUClass vcpuCompilerClass: aVCPUCompilerClass [
	^ self new vcpuClass: aVCPUClass; vcpuCompilerClass: aVCPUCompilerClass; yourself
]

{ #category : #compilation }
LoVCPUCompiler >> compileAssembledMethod: lowcodeMethod [
	| dis |
	dis := LowcodeDisassembler forAssembledMethod: lowcodeMethod.
	self compileDisassembledMethod: dis disassemble
]

{ #category : #compilation }
LoVCPUCompiler >> compileDisassembledMethod: disassembledMethod [
	validatedMethod := disassembledMethod.
	validatedMethod isValid ifFalse: [ self error: 'Cannot compile an invalid lowcode method' ].
	self compileLowcode;
		compileToMachineCode
]

{ #category : #compilation }
LoVCPUCompiler >> compileLowcode [
	vcpu := vcpuClass new.
	self prologue.
	self createBlocks.
]

{ #category : #compilation }
LoVCPUCompiler >> compileToMachineCode [
	| compiler |
	compiler := vcpuCompilerClass new.
	compiledCode := compiler compileRoutine: vcpu.
	machineCode := compiledCode bytes.
	self halt.
]

{ #category : #compilation }
LoVCPUCompiler >> createBlocks [
	| compiledBlock |
	validatedMethod basicBlocks do: [ :bb |
		compiledBlock := LoVCPUCompiledBlock for: bb.
		compiledBlock label: vcpu builder newLabel.
		bb compiledBlock:  compiledBlock
	]
]

{ #category : #prologue }
LoVCPUCompiler >> fetchArguments [
	"TODO"
]

{ #category : #prologue }
LoVCPUCompiler >> fetchMethodArguments [
	"The function has the following signature:
	sqInt procedure(InterpreterProxy *proxy, sqInt temporals)
	"
	| pointerSize |
	pointerSize := FFI pointerSize.
	interpreterProxyPointer := (vcpu framePointer + (vcpu word: pointerSize)) readWord.
	interpreterProxy := LoVCPUInterpreterProxy new.
	interpreterProxy vcpu: vcpu;
		pointer: interpreterProxyPointer
]

{ #category : #prologue }
LoVCPUCompiler >> fetchReceiver [
	"TODO"
]

{ #category : #prologue }
LoVCPUCompiler >> prologue [
	self fetchMethodArguments.
	receiver := vcpu word0.
	temporals := Array new: validatedMethod numberOfTemporals.
	(1 to: temporals size) do: [ :i | temporals at: i put: vcpu word0].
	
	self fetchReceiver.
	(1 to: validatedMethod numberOfArguments) do: [ :i |self fetchArgument: i ].
]

{ #category : #accessing }
LoVCPUCompiler >> validatedMethod [
	
	^ validatedMethod
]

{ #category : #accessing }
LoVCPUCompiler >> validatedMethod: anObject [
	
	validatedMethod := anObject
]

{ #category : #accessing }
LoVCPUCompiler >> vcpu [
	
	^ vcpu
]

{ #category : #accessing }
LoVCPUCompiler >> vcpu: anObject [
	
	vcpu := anObject
]

{ #category : #accessing }
LoVCPUCompiler >> vcpuClass [
	
	^ vcpuClass
]

{ #category : #accessing }
LoVCPUCompiler >> vcpuClass: anObject [
	
	vcpuClass := anObject
]

{ #category : #accessing }
LoVCPUCompiler >> vcpuCompilerClass [	
	^ vcpuCompilerClass
]

{ #category : #accessing }
LoVCPUCompiler >> vcpuCompilerClass: anObject [
	
	vcpuCompilerClass := anObject
]
