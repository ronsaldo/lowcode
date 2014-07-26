Class {
	#name : #LowcodeLLVMCompiledMethod,
	#superclass : #Object,
	#type : #bytes,
	#category : #'Lowcode-LLVM'
}

{ #category : #'instance creation' }
LowcodeLLVMCompiledMethod class >> for: lowcodeAssembledMethod [
	<primitive: #primitiveCompileLowcodeMethod module: #LowcodeLLVMPlugin error: errorCode>	
	self error: 'Failed to compile Lowcode method using the LLVM plugin.'
]

{ #category : #'calling method construction' }
LowcodeLLVMCompiledMethod >> addFailureCode: builder [
	builder pushLiteral: self;
		pushTemp: #errorCode;
		send: #callFailed:originalMethod:
]

{ #category : #calling }
LowcodeLLVMCompiledMethod >> callReplacing: originalMethod failedWithError: errorCode [
	self halt.
]

{ #category : #'calling method construction' }
LowcodeLLVMCompiledMethod >> createCaller [
	^ self createCallerWrapping: self class >> #dummyMethod
]

{ #category : #'calling method construction' }
LowcodeLLVMCompiledMethod >> createCallerWrapping: originalMethod [
	| compiledMethod builder pragma primitiveNode tempNames|
	builder := IRBuilder new.
	
	"Create the primitive"
	pragma := Pragma keyword: #primitive:module:error: arguments: #(primitiveLowcodeCall LowcodeLLVMPlugin errorCode).
	primitiveNode :=  IRPrimitive new
				num: 117;
				spec: {#LowcodeLLVMPlugin . #primitiveLowcodeCall. 0. 0};
				yourself.
	
	"Create the temp names"
	tempNames := Array new: originalMethod numArgs + 1.
	1 to: originalMethod numArgs do: [ :i |
		tempNames at: i put: ('arg' , i printString) asSymbol
	].
	tempNames at: originalMethod numArgs + 1 put: #errorCode.
	
	"Build the method wrapper"
	builder irPrimitive: primitiveNode;
		numArgs: originalMethod numArgs;
		addTemps: tempNames;
		addPragma: pragma;
		storeTemp: #errorCode;
		pushLiteral: self;
		pushLiteral: originalMethod;
		pushTemp: #errorCode;
		send: #callReplacing:failedWithError:;
		returnTop.
	
	compiledMethod := builder ir compiledMethodWith: originalMethod trailer.
	compiledMethod classBinding: originalMethod classBinding;
		selector: originalMethod selector.
	^ compiledMethod
]

{ #category : #'calling method construction' }
LowcodeLLVMCompiledMethod >> createPrologue [
	| builder pragma |
	
	builder := IRBuilder new.
	pragma := Pragma keyword: #primitive:module:error: arguments: #(primitiveLowcodeCall LowcodeLLVMPlugin errorCode).
	builder addPragma: pragma;
		storeTemp: #errorCode;
		addLiteral: self.
	^ pragma.
]

{ #category : #initialize }
LowcodeLLVMCompiledMethod >> destroy [
	<primitive: #primitiveDestroyCompiledMethod module: #LowcodeLLVMPlugin error: errorCode>
	self error: 'Failed to dump Lowcode LLVM compiled method'
]

{ #category : #'calling method construction' }
LowcodeLLVMCompiledMethod >> dummyMethod [
]

{ #category : #'as yet unclassified' }
LowcodeLLVMCompiledMethod >> dump [
	<primitive: #primitiveDumpCompiledMethod module: #LowcodeLLVMPlugin error: errorCode>
	self error: 'Failed to dump Lowcode LLVM compiled method'
]
