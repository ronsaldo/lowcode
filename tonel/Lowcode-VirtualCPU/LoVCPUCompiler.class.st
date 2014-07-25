Class {
	#name : #LoVCPUCompiler,
	#superclass : #Object,
	#traits : 'TVCpuCompilerOption',
	#classTraits : 'TVCpuCompilerOption classTrait',
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
		'interpreterProxy',
		'nilObject',
		'methodOop',
		'falseObject',
		'trueObject'
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
LoVCPUCompiler >> compileBlocks [
	validatedMethod basicBlocks first compiledBlock compileBlock: LoVCPUStack new.
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
	self compileBlocks
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
		compiledBlock label: vcpu builder newLabel;
			compiler: self.

		bb compiledBlock:  compiledBlock
	]
]

{ #category : #'common objects' }
LoVCPUCompiler >> falseObject [
	^ falseObject
]

{ #category : #prologue }
LoVCPUCompiler >> fetchCommonObjects [
	nilObject := interpreterProxy nilObject.
	falseObject := interpreterProxy falseObject.
	trueObject := interpreterProxy trueObject.
]

{ #category : #prologue }
LoVCPUCompiler >> fetchInterpreterProxy [
	"The function has the following signature:
	sqInt procedure()
	"
	
	| pointerSize |
	pointerSize := FFI pointerSize.
	interpreterProxyPointer := vcpu word: NBInterpreterProxy interpreterProxyAddress value.
	interpreterProxy := LoVCPUInterpreterProxy new.
	interpreterProxy vcpu: vcpu;
		pointer: interpreterProxyPointer.

]

{ #category : #prologue }
LoVCPUCompiler >> fetchMethodArguments [
	"Fetch the arguments"
	| arrayIndex value |
	(1 to: validatedMethod numberOfArguments) do: [ :i |
		arrayIndex := validatedMethod numberOfArguments - i + 1.
		value := interpreterProxy stackValue: (vcpu word: i - 1).
		vcpu write: value to: (temporals at: arrayIndex put: i)
	].

	"Fetch the receiver"
	receiver := interpreterProxy stackValue: (vcpu word: validatedMethod numberOfArguments).
	
	"Fetch the compiled method.".
	methodOop := interpreterProxy primitiveMethod.
]

{ #category : #accessing }
LoVCPUCompiler >> interpreterProxy [
	^ interpreterProxy
]

{ #category : #'common objects' }
LoVCPUCompiler >> labelAt: index [
	| address basicBlock |
	address := validatedMethod literals at: index + 1.
	basicBlock := validatedMethod blockAtPC: address.
	^ basicBlock compiledBlock
]

{ #category : #'common objects' }
LoVCPUCompiler >> literalAt: index [
	^ interpreterProxy literal: index ofMethod: self methodOop.
]

{ #category : #'common objects' }
LoVCPUCompiler >> methodOop [
	^ methodOop
]

{ #category : #'common objects' }
LoVCPUCompiler >> nilObject [
	^ nilObject
]

{ #category : #'common objects' }
LoVCPUCompiler >> oneObject: value [
	^ self smallIntegerObject: 1
]

{ #category : #prologue }
LoVCPUCompiler >> prologue [
	self fetchInterpreterProxy.
	
	temporals := Array new: validatedMethod numberOfTemporals.
	self fetchCommonObjects.
	((validatedMethod numberOfArguments) + 1 to: temporals size) do: [ :i |
			temporals at: i put: vcpu word0.
			vcpu write: nilObject to: (temporals at: i)
	].
	self fetchMethodArguments.
]

{ #category : #'common operations' }
LoVCPUCompiler >> returnOop: oop [
	interpreterProxy pop: (vcpu word: validatedMethod numberOfArguments + 1) thenPush: oop.
	vcpu return: vcpu word0
]

{ #category : #'common objects' }
LoVCPUCompiler >> smallIntegerObject: value [
	^ vcpu word: (value<<1) | 1
]

{ #category : #'common objects' }
LoVCPUCompiler >> temporalAt: index [
	^ temporals at: index + 1
]

{ #category : #'common objects' }
LoVCPUCompiler >> trueObject [
	^ trueObject
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

{ #category : #'common objects' }
LoVCPUCompiler >> zeroObject [
	^ self smallIntegerObject: 0
]
