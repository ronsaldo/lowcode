Class {
	#name : #LowcodeLLVMGenerator,
	#superclass : #LowcodeGenerator,
	#instVars : [
		'destName',
		'out'
	],
	#classVars : [
		'InstructionKindMap',
		'PopForTypes',
		'PushForTypes'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeLLVMGenerator class >> generateFromFileNamed: fileName to: destFileName [
	"
	self generateFromFileNamed: '../lowcode.xml' to: './LowcodeLLVMGenerated.cpp'
	"
	(self fromFileNamed: fileName) destName: destFileName; generate.
]

{ #category : #'as yet unclassified' }
LowcodeLLVMGenerator class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	InstructionKindMap := Dictionary newFromPairs: #(
		'operation' 'InstructionKind::Operation'
		'branch' 'InstructionKind::Branch'
		'terminator' 'InstructionKind::Terminator'
		'jump' 'InstructionKind::Jump'
	).
	
	PopForTypes := Dictionary newFromPairs: #(
		int32 popInt32
		int64 popInt64
		pointer popPointer
		oop popOop
		float32 popFloat32
		float64 popFloat64
	).
	
	PushForTypes := Dictionary newFromPairs: #(
		int32 pushInt32
		int64 pushInt64
		pointer pushPointer
		oop pushOop
		float32 pushFloat32
		float64 pushFloat64
	).
]

{ #category : #accessing }
LowcodeLLVMGenerator >> destName [
	
	^ destName
]

{ #category : #accessing }
LowcodeLLVMGenerator >> destName: anObject [
	
	destName := anObject
]

{ #category : #generation }
LowcodeLLVMGenerator >> emitCommon [
	out nextPutAll: '
#include "LowcodeLLVM.hpp"

namespace Lowcode
{
'
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitCompilation [
	self emitSistaCompilation;
		emitLowcodeCompilation
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitCompilationDeclareStackResults: instruction [
	instruction stackResults do: [ :res |
		out tab; tab; tab; nextPutAll: 'llvm::Value *' , res name , ' = NULL;'; lf
	]
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitCompilationExtendedArguments: instruction [
	instruction arguments do: [ :arg |
		arg type = 'extend-a' ifTrue: [ out tab; tab; tab; nextPutAll: 'uint64_t ' , arg name , ' = getExtendA();'; lf  ].
		arg type = 'extend-b' ifTrue: [ out tab; tab; tab; nextPutAll: 'uint64_t ' , arg name , ' = getExtendB();'; lf ].
		arg type = 'literal' ifTrue: [ out tab; tab; tab; nextPutAll: 'llvm::Value *' , arg name , ' = getLiteralAt(getExtendA());'; lf ].
	]
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitCompilationFetchStackArguments: instruction [
	instruction stackArguments reverseDo: [ :arg |
		out tab; tab; tab; nextPutAll: 'llvm::Value *' , arg name , ' = stack.' , (PopForTypes at: arg type), '();'; lf
	]
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitCompilationPushStackResults: instruction [
	instruction stackResults do: [ :res |
		out tab; tab; tab; nextPutAll: 'stack.' , (PushForTypes at: res type), '(', res name ,');'; lf
	]
]

{ #category : #generation }
LowcodeLLVMGenerator >> emitDisclaimer [
	out nextPutAll: '
// LowcodeLLVMGenerated.cpp - WARNING THIS FILE WAS AUTOMATICALLY GENERATED. DO NOT MODIFY	
'
]

{ #category : #generation }
LowcodeLLVMGenerator >> emitEnd [
	out nextPutAll: '
} // namespace Lowcode
'
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitInstructionCompilation: instruction [
	out tab; tab; nextPutAll: '{'; lf.
	
	self emitCompilationExtendedArguments: instruction.
	self emitCompilationFetchStackArguments: instruction.
	self emitCompilationDeclareStackResults: instruction.
	out nextPutAll: (instruction semanticFor: 'C++/LLVM' ifAbsent: [ 'abort();' ]); lf.
	self emitCompilationPushStackResults: instruction.
	
	out tab; tab; nextPutAll: '}'; lf.
	out tab; tab; nextPutAll: 'break;'; lf.
]

{ #category : #'instruction kinds' }
LowcodeLLVMGenerator >> emitInstructionKinds [
	self emitSistaInstructionKinds;
		emitLowcodeInstructionKinds
]

{ #category : #validation }
LowcodeLLVMGenerator >> emitInstructionValidation: instruction [
	instruction stackArguments reverseDo: [ :arg | self validationPopArgument: arg ].
	instruction stackResults do: [ :res | self validationPushResult: res ].
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitLowcodeCompilation [
	out nextPutAll: '
// Lowcode instruction compilation.
void LowcodeInstruction::compile(LowcodeValueStack &stack, llvm::IRBuilder<> &builder)
{ 
	switch(getOpcode())
	{
'.
	spec instructions do: [ :ins |
		out tab; nextPutAll: 'case ' , ins opcode printString,': /* ' , ins mnemonic , ' */'; lf.
		self emitInstructionCompilation: ins
	].

out nextPutAll: '
	default:
		abort();
	}
}

'
]

{ #category : #'instruction kinds' }
LowcodeLLVMGenerator >> emitLowcodeInstructionKinds [
	out nextPutAll: '
// Lowcode instruction kinds.
InstructionKind::Type LowcodeInstruction::getKind() const
{ 
	switch(getOpcode())
	{
'.
	spec instructions do: [ :ins |
		out tab; tab; nextPutAll: 'case ' , ins opcode printString, ': /* ' , ins mnemonic , ' */'; lf. 
		out tab; tab; tab; nextPutAll: 'return ' , (InstructionKindMap at: ins kind) , ';'; lf.
	].

	out nextPutAll: '
	default:
		return InstructionKind::Operation;
	}
}
'
]

{ #category : #validation }
LowcodeLLVMGenerator >> emitLowcodeValidation [
	out nextPutAll: '
// Lowcode instruction validation
bool LowcodeInstruction::validate(LowcodeValidationStack &stack)
{
	switch(getOpcode())
	{
'.
	spec instructions do: [ :ins |
		out tab; nextPutAll: 'case ' , ins opcode printString,': /* ' , ins mnemonic , ' */'; lf.
		self emitInstructionValidation: ins.
		out tab; tab; nextPutAll: 'return true;'; lf.
	].

out nextPutAll: '
	}
}
'
]

{ #category : #compilation }
LowcodeLLVMGenerator >> emitSistaCompilation [
	out nextPutAll: '
// Sista extended bytecode set compilation.
void SistaExtendedInstruction::compile(LowcodeValueStack &stack, llvm::IRBuilder<> &builder)
{ 
	switch(getOpcode())
	{
'.
	spec sistaInstructions do: [ :ins |
		out tab; nextPutAll: '/* ' , ins mnemonic , ' */'; lf.
		ins firstOpcode to: ins lastOpcode do: [ :op |
			out tab; nextPutAll: 'case ' , op printString,':'; lf.
		].
		self emitInstructionCompilation: ins
	].

out nextPutAll: '
	default:
		abort();
	}
}

'
]

{ #category : #'instruction kinds' }
LowcodeLLVMGenerator >> emitSistaInstructionKinds [
	out nextPutAll: '
// Sista extended byte instruction kinds.
InstructionKind::Type SistaExtendedInstruction::getKind() const
{ 
	switch(getOpcode())
	{
'.
	spec sistaInstructions do: [ :ins |
		out tab; nextPutAll: '/* ' , ins mnemonic , ' */'; lf.
		ins firstOpcode to: ins lastOpcode do: [ :op |
			out tab; nextPutAll: 'case ' , op printString, ':'; lf. 
		].
		out tab; tab; nextPutAll: 'return ' , (InstructionKindMap at: ins kind) , ';'; lf.
	].

	out nextPutAll: '
	default:
		return InstructionKind::Operation;
	}
}
'
]

{ #category : #validation }
LowcodeLLVMGenerator >> emitSistaValidation [
	out nextPutAll: '
// Sista extended byte code validation
bool SistaExtendedInstruction::validate(LowcodeValidationStack &stack)
{
	switch(getOpcode())
	{
'.
	spec sistaInstructions do: [ :ins |
		out tab; nextPutAll: '/* ' , ins mnemonic , ' */'; lf.
		ins firstOpcode to: ins lastOpcode do: [ :op |
			out tab; nextPutAll: 'case ' , op printString,':'; lf.
		].
		self emitInstructionValidation: ins.
		out tab; tab; nextPutAll: 'return true;'; lf.
	].

out nextPutAll: '
	}
}
'
]

{ #category : #validation }
LowcodeLLVMGenerator >> emitValidation [
	self emitSistaValidation;
		emitLowcodeValidation
]

{ #category : #generation }
LowcodeLLVMGenerator >> generate. [
	out := destName asFileReference delete; writeStream.
	[
		self emitDisclaimer;
			emitCommon;
			emitInstructionKinds;
			emitValidation;
			emitCompilation;
			emitEnd
	] ensure: [ out close ]
]

{ #category : #validation }
LowcodeLLVMGenerator >> validationPopArgument: arg [
	out tab; tab; nextPutAll: 'if(!stack.' , (PopForTypes at: arg type) , '()) return false;'; lf
]

{ #category : #validation }
LowcodeLLVMGenerator >> validationPushResult: result [
	out tab; tab; nextPutAll: 'stack.' , (PushForTypes at:  result type) , '();'; lf
]
