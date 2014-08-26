Class {
	#name : #LoVCPUCompiledBlock,
	#superclass : #Object,
	#traits : 'TVCpuCompilerOption',
	#classTraits : 'TVCpuCompilerOption classTrait',
	#instVars : [
		'basicBlock',
		'label',
		'compiler',
		'compilationState',
		'stackVariables',
		'vcpu'
	],
	#category : #'Lowcode-VirtualCPU'
}

{ #category : #'instance creation' }
LoVCPUCompiledBlock class >> for: aBasicBlock [
	^ self new basicBlock: aBasicBlock
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> add32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first + second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> add64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #compilation }
LoVCPUCompiledBlock >> addPredecessor: predecessorStack [
	| stackVariableValues |
	self numberOfPredecessors <= 1 ifTrue: [ ^ self ].
	stackVariableValues := predecessorStack variables.
	1 to: stackVariableValues size do: [ :i |
		(stackVariables at: i) value: (stackVariableValues at: i)
	] 
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> alloca32Compilation: instruction withStack: stack [
	|size pointer  |
	size := stack popInt32.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> alloca64Compilation: instruction withStack: stack [
	|size pointer  |
	size := stack popInt64.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> and32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> and64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> arithmeticRightShift32Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt32.
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> arithmeticRightShift64Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt64.
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #accessing }
LoVCPUCompiledBlock >> basicBlock [
	
	^ basicBlock
]

{ #category : #accessing }
LoVCPUCompiledBlock >> basicBlock: anObject [
	
	basicBlock := anObject
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> beginCallCompilation: instruction withStack: stack [
	|alignment  |
	alignment := instruction extendA.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> boolean32ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> boolean64ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> branchFalse32Compilation: instruction withStack: stack [
	|dest cond  |
	dest := compiler labelAt: instruction extendA.
	cond := stack popInt32.

            (cond = vcpu word0) ifTrue: [
                instruction branchBlock compiledBlock compileBlock: stack copy
            ] ifFalse: [
                instruction nextBlock compiledBlock compileBlock: stack copy
            ].
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> branchFalse64Compilation: instruction withStack: stack [
	|dest cond  |
	dest := compiler labelAt: instruction extendA.
	cond := stack popInt32.

            (cond = vcpu word0) ifTrue: [
                instruction branchBlock compiledBlock compileBlock: stack copy
            ] ifFalse: [
                instruction nextBlock compiledBlock compileBlock: stack copy
            ].
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> branchTrue32Compilation: instruction withStack: stack [
	|dest cond  |
	dest := compiler labelAt: instruction extendA.
	cond := stack popInt32.

            (cond = vcpu word0) ifFalse: [
                instruction branchBlock compiledBlock compileBlock: stack copy
            ] ifTrue: [
                instruction nextBlock compiledBlock compileBlock: stack copy
            ].
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> branchTrue64Compilation: instruction withStack: stack [
	|dest cond  |
	dest := compiler labelAt: instruction extendA.
	cond := stack popInt64.

            (cond = vcpu word0) ifFalse: [
                instruction branchBlock compiledBlock compileBlock: stack copy
            ] ifTrue: [
                instruction nextBlock compiledBlock compileBlock: stack copy
            ].
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> byteSizeOfCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentFloat32Compilation: instruction withStack: stack [
	|value  |
	value := stack popFloat32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentFloat64Compilation: instruction withStack: stack [
	|value  |
	value := stack popFloat64.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentInt32Compilation: instruction withStack: stack [
	|value  |
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentInt64Compilation: instruction withStack: stack [
	|value  |
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentPointerCompilation: instruction withStack: stack [
	|value  |
	value := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callArgumentStructureCompilation: instruction withStack: stack [
	|structureSize structurePointer  |
	structureSize := instruction extendA.
	structurePointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callInstructionCompilation: instruction withStack: stack [
	|function  |
	function := instruction extendA.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> callPhysicalCompilation: instruction withStack: stack [
	|registerID  |
	registerID := instruction extendA.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> checkSessionIdentifierCompilation: instruction withStack: stack [
	|expectedSession value  |
	expectedSession := instruction extendA.

            value := expectedSession = (self sessionIdentifier).
        
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> compareAndSwap32Compilation: instruction withStack: stack [
	|check oldValue newValue value  |
	newValue := stack popInt32.
	oldValue := stack popInt32.
	check := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #compilation }
LoVCPUCompiledBlock >> compileBlock: stack [
	
	compilationState ~~ #notCompiled ifTrue: [ ^ self addPredecessor: stack. ].

	"Start compiling"
	compilationState := #compiling.
	self startCompiling: stack.

	"Compile the instructions"	
	self compileInstructions: stack.
	
	"Finish compilation"
	compilationState := #compiled.
]

{ #category : #compilation }
LoVCPUCompiledBlock >> compileInstruction: ins stack: stack [
	self perform: (ins mnemonic , 'Compilation:withStack:') asSymbol with: ins with: stack
]

{ #category : #compilation }
LoVCPUCompiledBlock >> compileInstructions: stack [
	basicBlock instructions do: [ :ins | self compileInstruction: ins stack: stack ]
]

{ #category : #accessing }
LoVCPUCompiledBlock >> compiler [
	
	^ compiler
]

{ #category : #accessing }
LoVCPUCompiledBlock >> compiler: anObject [
	
	compiler := anObject.
	vcpu := compiler vcpu.
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> div32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first / second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> div64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> dupTopCompilation: instruction withStack: stack [
	|object dup1 dup2  |
	object := stack popOop.

            dup1 := object.
            dup2 := object.
        
	stack pushOop: dup1.
	stack pushOop: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> duplicateFloat32Compilation: instruction withStack: stack [
	|value dup1 dup2  |
	value := stack popFloat32.

            dup1 := value.
            dup2 := value.
        
	stack pushFloat32: dup1.
	stack pushFloat32: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> duplicateFloat64Compilation: instruction withStack: stack [
	|value dup1 dup2  |
	value := stack popFloat64.

            dup1 := value.
            dup2 := value.
        
	stack pushFloat64: dup1.
	stack pushFloat64: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> duplicateInt32Compilation: instruction withStack: stack [
	|value dup1 dup2  |
	value := stack popInt32.

            dup1 := value.
            dup2 := value.
        
	stack pushInt32: dup1.
	stack pushInt32: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> duplicateInt64Compilation: instruction withStack: stack [
	|value dup1 dup2  |
	value := stack popInt64.

            dup1 := value.
            dup2 := value.
        
	stack pushInt64: dup1.
	stack pushInt64: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> duplicatePointerCompilation: instruction withStack: stack [
	|value dup1 dup2  |
	value := stack popPointer.

            dup1 := value.
            dup2 := value.
        
	stack pushPointer: dup1.
	stack pushPointer: dup2.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> effectiveAddress32Compilation: instruction withStack: stack [
	|base index scale offset result  |
	offset := stack popInt32.
	scale := stack popInt32.
	index := stack popInt32.
	base := stack popPointer.

            result := base + (index*scale) + offset.
        
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> effectiveAddress64Compilation: instruction withStack: stack [
	|base index scale offset result  |
	offset := stack popInt64.
	scale := stack popInt64.
	index := stack popInt64.
	base := stack popPointer.

            result := base + (index*scale) + offset.
        
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> endCallCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> endCallNoCleanupCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> failCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> failWithCodeCompilation: instruction withStack: stack [
	|errorCode  |
	errorCode := instruction extendA.
self shouldBeImplemented.

]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> falseObject [
	^ compiler falseObject
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> firstFieldPointerCompilation: instruction withStack: stack [
	|object pointer  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> firstIndexableFieldPointerCompilation: instruction withStack: stack [
	|object pointer  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32AddCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32DivCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32EqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32MulCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32NotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32SubCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat32.
	first := stack popFloat32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToFloat64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToInt32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToInt64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToUInt32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float32ToUInt64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat32.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64AddCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64DivCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64EqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64MulCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64NotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64SubCompilation: instruction withStack: stack [
	|first second result  |
	second := stack popFloat64.
	first := stack popFloat64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToFloat32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToInt32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToInt64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToUInt32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> float64ToUInt64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popFloat64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> freeCompilation: instruction withStack: stack [
	|pointer  |
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #initialization }
LoVCPUCompiledBlock >> initialize [
	compilationState := #notCompiled
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> instantiateIndexable32OopCompilation: instruction withStack: stack [
	|classOop indexableSize object  |
	indexableSize := stack popInt32.
	classOop := stack popOop.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> instantiateIndexableOopCompilation: instruction withStack: stack [
	|indexableSize classOop object  |
	indexableSize := instruction extendA.
	classOop := stack popOop.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> instantiateOopCompilation: instruction withStack: stack [
	|classOop object  |
	classOop := stack popOop.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32EqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.

            value := vcpu word0.
            (first = second) ifTrue: [value value: 1].
        
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32NotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.

            value := vcpu word0.
            (first = second) ifFalse: [value value: 1].
        
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32ToFloat32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32ToFloat64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int32ToPointerCompilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64EqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64NotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64ToFloat32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64ToFloat64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> int64ToPointerCompilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushPointer: result.

]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> interpreterProxy [
	^ compiler interpreterProxy
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isBytesCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isFloatObjectCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isIndexableCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isIntegerObjectCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isPointersCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isWordsCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> isWordsOrBytesCompilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> jumpCompilation: instruction withStack: stack [
	|dest  |
	dest := compiler labelAt: instruction extendA.

            instruction jumpBlock compiledBlock compileBlock: stack copy.
        

]

{ #category : #accessing }
LoVCPUCompiledBlock >> label [
	
	^ label
]

{ #category : #accessing }
LoVCPUCompiledBlock >> label: anObject [
	
	label := anObject
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> leftShift32Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt32.
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> leftShift64Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt64.
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> literalAt: index [
	^ compiler literalAt: index
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadFloat32FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushFloat32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadFloat64FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushFloat64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadInt16FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadInt32FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadInt64FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadInt8FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalAddressCompilation: instruction withStack: stack [
	|baseOffset pointer  |
	baseOffset := instruction extendA.

            pointer := self basePointer + baseOffset.
        
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalFloat32Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushFloat32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalFloat64Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushFloat64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalInt16Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalInt32Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalInt64Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalInt8Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalPointerCompilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushPointer: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalUInt16Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalUInt32Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalUInt64Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadLocalUInt8Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadObjectAtCompilation: instruction withStack: stack [
	|object fieldIndex field  |
	fieldIndex := stack popInt32.
	object := stack popOop.
self shouldBeImplemented.
	stack pushOop: field.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadObjectFieldCompilation: instruction withStack: stack [
	|fieldIndex object field  |
	fieldIndex := instruction extendA.
	object := stack popOop.
self shouldBeImplemented.
	stack pushOop: field.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadPointerFromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.

            value := pointer readWord.
        
	stack pushPointer: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadUInt16FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadUInt32FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.

            value := pointer readWord.
        
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadUInt64FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> loadUInt8FromMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> lockRegistersCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> lockVMCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> malloc32Compilation: instruction withStack: stack [
	|size pointer  |
	size := stack popInt32.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> malloc64Compilation: instruction withStack: stack [
	|size pointer  |
	size := stack popInt64.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> memcpy32Compilation: instruction withStack: stack [
	|dest source size  |
	size := stack popInt32.
	source := stack popPointer.
	dest := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> memcpy64Compilation: instruction withStack: stack [
	|dest source size  |
	size := stack popInt64.
	source := stack popPointer.
	dest := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> memcpyFixedCompilation: instruction withStack: stack [
	|size dest source  |
	size := instruction extendA.
	source := stack popPointer.
	dest := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> moveFloat32ToPhysicalCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
	value := stack popFloat32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> moveFloat64ToPhysicalCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
	value := stack popFloat64.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> moveInt32ToPhysicalCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> moveInt64ToPhysicalCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
	value := stack popInt64.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> movePointerToPhysicalCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
	value := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> mul32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first * second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> mul64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> neg32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> neg64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'pseudo instructions' }
LoVCPUCompiledBlock >> nextBlockCompilation: instruction withStack: stack [
	instruction jumpBlock compiledBlock compileBlock: stack
]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> nilObject [
	^ compiler nilObject
]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> nopCompilation: instruction withStack: stack [
	| |

            " Do nothing "
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> not32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> not64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #compilation }
LoVCPUCompiledBlock >> numberOfPredecessors [
	^ basicBlock predecessors size
]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> oneObject [
	^ compiler oneObject
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popOop.
	first := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopNotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popOop.
	first := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopSmallIntegerToInt32Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopSmallIntegerToInt64Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToBoolean32Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToBoolean64Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToFloat32Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushFloat32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToFloat64Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushFloat64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToInt32Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToInt64Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToPointerCompilation: instruction withStack: stack [
	|object pointer  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToPointerReinterpretCompilation: instruction withStack: stack [
	|object pointer  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushPointer: pointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToUInt32Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> oopToUInt64Compilation: instruction withStack: stack [
	|object value  |
	object := stack popOop.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> or32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> or64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallFloat32Compilation: instruction withStack: stack [
	|function result  |
	function := instruction extendA.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallFloat64Compilation: instruction withStack: stack [
	|function result  |
	function := instruction extendA.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectFloat32Compilation: instruction withStack: stack [
	|function result  |
	function := stack popPointer.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectFloat64Compilation: instruction withStack: stack [
	|function result  |
	function := stack popPointer.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectInt32Compilation: instruction withStack: stack [
	|function result  |
	function := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectInt64Compilation: instruction withStack: stack [
	|function result  |
	function := stack popPointer.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectPointerCompilation: instruction withStack: stack [
	|function result  |
	function := stack popPointer.
self shouldBeImplemented.
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallIndirectStructureCompilation: instruction withStack: stack [
	|structureSize function result resultPointer  |
	structureSize := instruction extendA.
	result := stack popPointer.
	function := stack popPointer.
self shouldBeImplemented.
	stack pushPointer: resultPointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallInt32Compilation: instruction withStack: stack [
	|function result  |
	function := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallInt64Compilation: instruction withStack: stack [
	|function result  |
	function := instruction extendA.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallPointerCompilation: instruction withStack: stack [
	|function result  |
	function := instruction extendA.
self shouldBeImplemented.
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> performCallStructureCompilation: instruction withStack: stack [
	|function structureSize result resultPointer  |
	function := instruction extendA.
	structureSize := instruction extendB.
	result := stack popPointer.
self shouldBeImplemented.
	stack pushPointer: resultPointer.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pinCompilation: instruction withStack: stack [
	|object  |
	object := stack popOop.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> plaftormCodeCompilation: instruction withStack: stack [
	|code  |
self shouldBeImplemented.
	stack pushInt32: code.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerAddOffset32Compilation: instruction withStack: stack [
	|base offset result  |
	offset := stack popInt32.
	base := stack popPointer.

            result := base + offset.
        
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerAddOffset64Compilation: instruction withStack: stack [
	|base offset result  |
	offset := stack popInt64.
	base := stack popPointer.

            result := base + offset.
        
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popPointer.
	first := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerNotEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popPointer.
	first := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerToInt32Compilation: instruction withStack: stack [
	|pointer result  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerToInt64Compilation: instruction withStack: stack [
	|pointer result  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerToOopCompilation: instruction withStack: stack [
	|pointerClassLiteral pointer object  |
	pointerClassLiteral := compiler literalAt: instruction extendA.
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pointerToOopReinterprerCompilation: instruction withStack: stack [
	|pointer object  |
	pointer := stack popPointer.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> popAndStoreTempCompilation: instruction withStack: stack [
	|object  |
	object := stack popOop.

            (self temporalsAt: instruction opcode & 7) value: object.
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> popFloat32Compilation: instruction withStack: stack [
	|value  |
	value := stack popFloat32.


]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> popFloat64Compilation: instruction withStack: stack [
	|value  |
	value := stack popFloat64.


]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> popInt32Compilation: instruction withStack: stack [
	|value  |
	value := stack popInt32.


]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> popInt64Compilation: instruction withStack: stack [
	|value  |
	value := stack popInt64.


]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> popPointerCompilation: instruction withStack: stack [
	|value  |
	value := stack popPointer.


]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> popStackTopCompilation: instruction withStack: stack [
	|object  |
	object := stack popOop.

            " Do Nothing "
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushConstantUInt32Compilation: instruction withStack: stack [
	|constant result  |
	constant := instruction extendA.

            result := vcpu word: constant.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushConstantUInt64Compilation: instruction withStack: stack [
	|constant result  |
	constant := instruction extendA.

            result := vcpu word: constant.
        
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushFalseCompilation: instruction withStack: stack [
	|object  |

            object := self falseObject.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushLiteralSmallIndexCompilation: instruction withStack: stack [
	|object  |

            object := self literalAt: instruction opcode & 31.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushLiteralVariableSmallIndexCompilation: instruction withStack: stack [
	|object  |

            self shouldBeImplemented.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushNilCompilation: instruction withStack: stack [
	|object  |

            object := self nilObject.
        
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushNullPointerCompilation: instruction withStack: stack [
	|result  |

            result := vcpu word0.
        
	stack pushPointer: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushOne32Compilation: instruction withStack: stack [
	|result  |

            result := vcpu word: 1.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushOne64Compilation: instruction withStack: stack [
	|result  |

            result := vcpu word: 1.
        
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushOneCompilation: instruction withStack: stack [
	|object  |

            object := self oneObject.
        
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushOneFloat32Compilation: instruction withStack: stack [
	|result  |
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushOneFloat64Compilation: instruction withStack: stack [
	|result  |
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushPhysicalFloat32Compilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
self shouldBeImplemented.
	stack pushFloat32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushPhysicalFloat64Compilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
self shouldBeImplemented.
	stack pushFloat64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushPhysicalInt32Compilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushPhysicalInt64Compilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
self shouldBeImplemented.
	stack pushInt64: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushPhysicalPointerCompilation: instruction withStack: stack [
	|registerID value  |
	registerID := instruction extendA.
self shouldBeImplemented.
	stack pushPointer: value.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushReceiverCompilation: instruction withStack: stack [
	|object  |

            object := self receiver.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushReceiverVariableSmallIndexCompilation: instruction withStack: stack [
	|object  |

            object := self interpreterProxy fetchPointer: instruction opcode sistaOpcode & 15 ofObject: receiver.
        
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushSessionIdentifierCompilation: instruction withStack: stack [
	|value  |

            value := self sessionIdentifier.
        
	stack pushInt32: value.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushTempSmallIndex2Compilation: instruction withStack: stack [
	|object  |

            object := self temporalAt: instructions opcode & 7 + 8.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushTempSmallIndexCompilation: instruction withStack: stack [
	|object  |

            object := self temporalAt: instructions opcode & 7.
        
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushThisContextCompilation: instruction withStack: stack [
	|object  |
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushTrueCompilation: instruction withStack: stack [
	|object  |

            object := self trueObject.
        
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushZero32Compilation: instruction withStack: stack [
	|result  |

            result := vcpu word0.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushZero64Compilation: instruction withStack: stack [
	|result  |

            result := vcpu word0.
        
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> pushZeroCompilation: instruction withStack: stack [
	|object  |

            object := self zeroObject.
        
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushZeroFloat32Compilation: instruction withStack: stack [
	|result  |

            result := vcpu word0.
        
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> pushZeroFloat64Compilation: instruction withStack: stack [
	|result  |
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> rem32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> rem64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> returnFalseCompilation: instruction withStack: stack [
	| |

            self returnOop: self falseObject.
        

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> returnNilCompilation: instruction withStack: stack [
	| |

            self returnOop: self nilObject.
        

]

{ #category : #'common operations' }
LoVCPUCompiledBlock >> returnOop: word [
	^ compiler returnOop: word
]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> returnReceiverCompilation: instruction withStack: stack [
	| |

            self returnOop: self receiver.
        

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> returnTopCompilation: instruction withStack: stack [
	|object  |
	object := stack popOop.

            self returnOop: object.
        

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> returnTrueCompilation: instruction withStack: stack [
	| |

            self returnOop: self trueObject.
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> rightShift32Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt32.
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> rightShift64Compilation: instruction withStack: stack [
	|value shiftAmount result  |
	shiftAmount := stack popInt64.
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'sista extended bytecode instructions' }
LoVCPUCompiledBlock >> sendSpecialMessageClassCompilation: instruction withStack: stack [
	|object objectClass  |
	object := stack popOop.

            objectClass := self interpreterProxy fetchClassOf: object.
            self checkFailed.
        
	stack pushOop: objectClass.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> signExtend32From16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> signExtend32From8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> signExtend64From16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> signExtend64From32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> signExtend64From8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> smallInt32ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #compilation }
LoVCPUCompiledBlock >> startCompiling: stack [
	| stackVariableValues |
	
	vcpu builder << label.
	
	self numberOfPredecessors <= 1 ifTrue: [ ^ self ].
	stackVariableValues := stack variables.
	stackVariables := Array new: stackVariableValues size.
	1 to: stackVariableValues size do: [ :i |
		stackVariables at: i put: vcpu word0.
	].

	self addPredecessor: stack
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeFloat32ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popFloat32.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeFloat64ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popFloat64.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeInt16ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popInt32.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeInt32ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popInt32.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeInt64ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popInt64.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeInt8ToMemoryCompilation: instruction withStack: stack [
	|pointer value  |
	value := stack popInt32.
	pointer := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalFloat32Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popFloat32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalFloat64Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popFloat64.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalInt16Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalInt32Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalInt64Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popInt64.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalInt8Compilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popInt32.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeLocalPointerCompilation: instruction withStack: stack [
	|baseOffset value  |
	baseOffset := instruction extendA.
	value := stack popPointer.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeObjectFieldAtCompilation: instruction withStack: stack [
	|object fieldIndex value  |
	value := stack popOop.
	fieldIndex := stack popInt32.
	object := stack popOop.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storeObjectFieldCompilation: instruction withStack: stack [
	|fieldIndex object value  |
	fieldIndex := instruction extendA.
	value := stack popOop.
	object := stack popOop.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> storePointerToMemoryCompilation: instruction withStack: stack [
	|memoryPointer value  |
	value := stack popPointer.
	memoryPointer := stack popPointer.

            memoryPointer writeWord: value.
        

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> sub32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first - second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> sub64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> temporalAt: index [
	^ compiler temporalAt: index
]

{ #category : #'common objects' }
LoVCPUCompiledBlock >> trueObject [
	^ compiler trueObject
]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> truncate32To16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> truncate32To8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> truncate64To16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> truncate64To32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> truncate64To8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> udiv32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first / second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> udiv64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32ToFloat32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32ToFloat64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint32ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64GreatCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64GreatEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64LessCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64LessEqualCompilation: instruction withStack: stack [
	|first second value  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt32: value.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64ToFloat32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushFloat32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64ToFloat64Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushFloat64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> uint64ToOopCompilation: instruction withStack: stack [
	|value object  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushOop: object.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> umul32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.

            result := first * second.
        
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> umul64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> unlockRegistersCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> unlockVMCompilation: instruction withStack: stack [
	| |
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> unpinCompilation: instruction withStack: stack [
	|object  |
	object := stack popOop.
self shouldBeImplemented.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> urem32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> urem64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> xor32Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt32.
	first := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> xor64Compilation: instruction withStack: stack [
	|first second result  |
	second := stack popInt64.
	first := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> zeroExtend32From16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> zeroExtend32From8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt32: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> zeroExtend64From16Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> zeroExtend64From32Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt32.
self shouldBeImplemented.
	stack pushInt64: result.

]

{ #category : #'lowcode instructions' }
LoVCPUCompiledBlock >> zeroExtend64From8Compilation: instruction withStack: stack [
	|value result  |
	value := stack popInt64.
self shouldBeImplemented.
	stack pushInt64: result.

]
