Class {
	#name : #LowcodeLLVMEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-LLVM'
}

{ #category : #testing }
LowcodeLLVMEngine class >> isSuitable [
	^ self isSupported 
]

{ #category : #testing }
LowcodeLLVMEngine class >> isSupported [
	<primitive: #primitiveIsSupported module: #LowcodeLLVMPlugin error:errorCode>
	^ false
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngine >> emit: aBlock on: aContext [
	self emit: aBlock onMethod: aContext method.
	^ Lowcode retryContext: aContext
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngine >> emit: aBlock onMethod: aCompiledMethod [
	| assembler |
	assembler := LowcodeAssembler new.
	assembler argumentCount: aCompiledMethod numArgs.
	aBlock value: assembler.
	
	self install: assembler emit inMethod: aCompiledMethod.
]

{ #category : #'as yet unclassified' }
LowcodeLLVMEngine >> install: code inMethod: aCompiledMethod [
	| llvmCompiledMethod wrapperMethod |
	
	"Compile using LLVM"
	llvmCompiledMethod := LowcodeLLVMCompiledMethod for: code.
	
	"Create the method wrapper."
	wrapperMethod := llvmCompiledMethod createCallerWrapping: aCompiledMethod.
	
	"Install the method wrapper."
	"Transcript show: 'Install method ' , wrapperMethod selector ;cr.
	llvmCompiledMethod dump."
	wrapperMethod methodClass methodDict at: wrapperMethod selector put: wrapperMethod.
]
