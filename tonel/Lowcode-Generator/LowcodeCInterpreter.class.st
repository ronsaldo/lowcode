Class {
	#name : #LowcodeCInterpreter,
	#superclass : #LowcodeGenerator,
	#instVars : [
		'destName',
		'out'
	],
	#classVars : [
		'PopForTypes',
		'PushForTypes',
		'TypeMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeCInterpreter class >> generateFromFileNamed: fileName to: destFileName [
	"
	self generateFromFileNamed: '../lowcode.xml' to: './LowcodeInterpreterGenerated.c'
	"
	(self fromFileNamed: fileName) destName: destFileName; generate.
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	TypeMap := Dictionary newFromPairs: #(
		int32 int32_t
		int64 int64_t
		pointer #'void*'
		oop sqInt
		float32 float
		float64 double
		label 'uint8_t*'
		literal sqInt
		'extend-a' uint32_t
		'extend-b' uint32_t
	).
	
	PopForTypes := Dictionary newFromPairs: #(
		int32 POP_INT32_TO
		int64 POP_INT64_TO
		pointer POP_POINTER_TO
		oop POP_OOP_TO
		float32 POP_FLOAT32_TO
		float64 POP_FLOAT64_TO
	).
	
	PushForTypes := Dictionary newFromPairs: #(
		int32 PUSH_INT32
		int64 PUSH_INT64
		pointer PUSH_POINTER
		oop PUSH_OOP
		float32 PUSH_FLOAT32
		float64 PUSH_FLOAT64
	).
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> declareArgument: argument [
	out nextPutAll: 
'				' , (self mapType: argument type) , ' ' , argument name , ';' ; lf
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> declareArguments: instruction [
	(instruction arguments , instruction stackArguments , instruction stackResults) do: [ :arg | self declareArgument: arg ]
]

{ #category : #accessing }
LowcodeCInterpreter >> destName [
	
	^ destName
]

{ #category : #accessing }
LowcodeCInterpreter >> destName: anObject [
	
	destName := anObject
]

{ #category : #accessing }
LowcodeCInterpreter >> emitCommon [
	out nextPutAll: '
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "LowcodeInterpreterPlugin.h"
#include "LowcodeInterpreterPluginFFI.h"

/* Sista bytecode decoding constants */
#define SISTA_OPCODE_ONE_BYTE_LAST 223
#define SISTA_OPCODE_TWO_BYTE_LAST 247
#define SISTA_OPCODE_EXT_A 224
#define SISTA_OPCODE_EXT_B 225

/* Primitive types stack. */
#define DEFAULT_PRIMITIVE_STACK_SIZE 256

#define FATAL_ERROR(message) {  \
		fprintf(stderr, "FATAL ERROR: " message " in %s at line %d\n", __FILE__, __LINE__); \
		abort(); \
}

#define STACK_CHECK_REMAINING_CAPACITY(size) {\
	if(primitiveStackCapacity - primitiveStackSize < size) \
		FATAL_ERROR("Lowcode Primitive Stack Overflow"); \
}

#define STACK_CHECK_MINIMAL_SIZE(size) {\
	if(primitiveStackSize < size)  \
		FATAL_ERROR("Lowcode Primitive Stack Underflow"); \
}

#define PUSH_VALUE_OF_TYPE(x, type) {\
	STACK_CHECK_REMAINING_CAPACITY(sizeof(type));\
	*((type*)(primitiveStack + primitiveStackSize) )= x;\
	primitiveStackSize += sizeof(type);\
}

#define PUSH_INT32(x) PUSH_VALUE_OF_TYPE(x, int32_t)
#define PUSH_INT64(x) PUSH_VALUE_OF_TYPE(x, int64_t)
#define PUSH_FLOAT32(x) PUSH_VALUE_OF_TYPE(x, float)
#define PUSH_FLOAT64(x) PUSH_VALUE_OF_TYPE(x, double)
#define PUSH_POINTER(x) PUSH_VALUE_OF_TYPE(x, void*)

#define POP_VALUE_OF_TYPE(dest, type) { \
	STACK_CHECK_MINIMAL_SIZE(sizeof(type)); \
	primitiveStackSize -= sizeof(type); \
	dest = *((type*)(primitiveStack + primitiveStackSize)); \
}

#define POP_INT32_TO(x) POP_VALUE_OF_TYPE(x, int32_t)
#define POP_INT64_TO(x) POP_VALUE_OF_TYPE(x, int64_t)
#define POP_FLOAT32_TO(x) POP_VALUE_OF_TYPE(x, float)
#define POP_FLOAT64_TO(x) POP_VALUE_OF_TYPE(x, double)
#define POP_POINTER_TO(x) POP_VALUE_OF_TYPE(x, void*)

/* Oop macros */
#define POP_OOP_TO(x) { \
	x = interpreterProxy->stackValue(0); \
	interpreterProxy->pop(1);  \
	oopStackSize--; \
}
#define PUSH_OOP(x) { \
	interpreterProxy->push(x); \
	oopStackSize++; \
}
#define PUSH_OOP_INTEGER(x) { \
	interpreterProxy->pushInteger(x); \
	oopStackSize++; \
}

/* Special macros */
#define LITERAL_AT_TO(id, dest) { \
	dest = interpreterProxy->fetchPointerofObject(id, literals); \
	CHECK_FAILED(); \
}

#define LABEL_AT_TO(id, dest) { \
	sqInt literalOop; \
	LITERAL_AT_TO(id, literalOop); \
	dest = instructionStream + interpreterProxy->integerValueOf(literalOop); \
}

/* Utility macros */
#define UNIMPLEMENTED() { \
	fprintf(stderr, "Unimplemented Lowcode instruction at %s line %d\n", __FILE__, __LINE__); \
	abort(); \
}

#define UNSUPPORTED() { \
	fprintf(stderr, "Unimplemented Lowcode instruction at %s line %d\n", __FILE__, __LINE__); \
	abort(); \
}

#define CHECK_FAILED() { \
	if(interpreterProxy->failed()) \
		return interpreterProxy->primitiveFail(); \
}

#define RETURN_OOP(oop) return interpreterProxy->popthenPush(oopStackSize, oop);

'
]

{ #category : #accessing }
LowcodeCInterpreter >> emitDisclaimer [
	out nextPutAll: '/**
 * WARNING: This file was automatically generated. DO NOT MODIFY.
 */
'
]

{ #category : #accessing }
LowcodeCInterpreter >> emitInitialization [
	out nextPutAll: '
static int Lowcode_sessionInitialized = 0;
static uint32_t Lowcode_sessionIdentifier; /* Must be keep uninitialized for more randomness */

static void Lowcode_initializeSession() { 
	uint32_t *p = (uint32_t*)malloc(4);
	/* Produce a random value for the session identifier */
	Lowcode_sessionIdentifier ^= ((uint32_t)((size_t)p)) ^ (uint32_t)time(NULL) ^ *p;
	free(p);
	Lowcode_sessionInitialized = 1;
}
	'
]

{ #category : #accessing }
LowcodeCInterpreter >> emitInstruction: instruction [
	| semantic |
	semantic := instruction semanticFor: 'C/Interpreter' ifAbsent: [ ^ self ].
	out nextPutAll: '
			case OPCODE_' , instruction mnemonicUnderscored , ':
			{'; lf.
			self declareArguments: instruction.
			self fetchArguments: instruction.
			out nextPutAll: semantic; lf.
			self pushStackResults: instruction.
			out nextPutAll: '
			}
				break;'
]

{ #category : #accessing }
LowcodeCInterpreter >> emitInstructions [
	spec instructions do: [ :instr | self emitInstruction: instr ]
]

{ #category : #accessing }
LowcodeCInterpreter >> emitInterpreter [
	out nextPutAll: '
sqInt LowcodePlugin_InterpretCodeLiteralsReceiverTemporalsStackFrame(VirtualMachine *interpreterProxy, uint8_t *instructionStream, sqInt literals, sqInt receiver, sqInt temporals, int stackFrameSize)
{
	/* Allocate space for the primitive stack */
	char* primitiveStack = (char*)alloca(DEFAULT_PRIMITIVE_STACK_SIZE);
	size_t primitiveStackCapacity = DEFAULT_PRIMITIVE_STACK_SIZE;
	size_t primitiveStackSize = 0;
	
	/* Allocate space for the stack frame base. */
	char* basePointer = (char*)alloca(stackFrameSize);

	/* Oop stack tracking */
	size_t oopStackSize = interpreterProxy->methodArgumentCount() + 1;
	
	/* Some counts */
	size_t numberLiterals = interpreterProxy->stSizeOf(literals);
	size_t numberOfTemporals = interpreterProxy->stSizeOf(temporals);

	/* The current program counter. */
	uint8_t *pc = instructionStream;
	uint32_t extA = 0;
	uint32_t extB = 0;
	
	/* For calling*/
	LOWCODE_FFI_COMMON();
	
	/* Execute all the instructions without verification */
	for(;;)
	{
		/* Fetch the first Sista extended bytecode opcode. */
		uint8_t sistaOpcode = *(pc++);

		/* Sista instructions are variable sized */
		if(sistaOpcode <= SISTA_OPCODE_ONE_BYTE_LAST)
		{
			switch(sistaOpcode)
			{'; lf.
				self emitSistaInstructions.
				out nextPutAll:  '
			default:
				return interpreterProxy->primitiveFail();
			}
		}
		else if(sistaOpcode <= SISTA_OPCODE_TWO_BYTE_LAST)
		{
			/* Read the extension values. */
			if(sistaOpcode == SISTA_OPCODE_EXT_A)
			{
				extA  = extA*256 + (*(pc++));
			}
			else if(sistaOpcode == SISTA_OPCODE_EXT_B)
			{
				extB  = extB*256 + (*(pc++)); 
			}
			else
			{ 
				/* TODO: Wait for Christmas */ 
				return interpreterProxy->primitiveFail(); /* Unsupported here. */
			}
		}
		else
		{
			/* Only interested in line primitives */ 
			if(sistaOpcode != 248)
				return interpreterProxy->primitiveFail(); /* Unsupported here. */

			/* Decode the inline primitive opcode. */
			uint16_t opcode = (*pc++);
			opcode |=(*pc++) << 8;

			/* Ensure it is a inline primitive. */
			if((opcode & (1<<15)) == 0)
				return interpreterProxy->primitiveFail(); /* Unsupported here. */
			opcode &= ~(1<<15);

			/* Fetch the instruction OpCode */
			switch(opcode)
			{'; lf.
			self emitInstructions.
			out nextPutAll: '
			default:
				/* Unsupported inline primitive. */
				return interpreterProxy->primitiveFail();
			}
		}
	}

	/* Should never reach here. */
	abort();
	return 0;
}
'
]

{ #category : #accessing }
LowcodeCInterpreter >> emitOpcodeConstants [

	| opcode mnemonic |

	out lf.
	out nextPutAll: '/* Lowcode instructions opcode constants */'; lf.
	
	spec instructions do: [ :instruction |
		opcode := instruction opcode.
		mnemonic := instruction mnemonicUnderscored.
		 out nextPutAll: '#define OPCODE_' , mnemonic , ' ' , opcode asString; lf.
	]
]

{ #category : #accessing }
LowcodeCInterpreter >> emitSistaInstruction: instruction [
	| semantic |
	semantic := instruction semanticFor: 'C/Interpreter' ifAbsent: [ ^ self ].
	
	out nextPutAll: 
'			/* ' , instruction mnemonic printString , '*/';lf.
	instruction opcodes do: [ :op |
		out nextPutAll: 
'			case ', op printString , ':';  lf
	].
	
	out nextPutAll:
'			{'; lf.
			out nextPutAll: semantic. 
			out lf; nextPutAll: 
'			}
				break;'; lf
				
]

{ #category : #accessing }
LowcodeCInterpreter >> emitSistaInstructions [
	spec sistaInstructions do: [ :instr | self emitSistaInstruction: instr ]
]

{ #category : #accessing }
LowcodeCInterpreter >> fetchArguments: instruction [
	self fetchExtendedArguments: instruction.
	self fetchStackArguments: instruction.
]

{ #category : #accessing }
LowcodeCInterpreter >> fetchExtendedArgument: arg [
	| value |
	arg type = 'label' ifTrue: [
		out nextPutAll:
'				LABEL_AT_TO(extA, ' , arg name , ');
				extA = 0;' ; lf.
		^ self
	].
	arg type = 'literal' ifTrue: [
		out nextPutAll:
'				LITERAL_AT_TO(extA, ' , arg name , ');
				extA = 0;' ; lf.
		^ self
	].

	arg type = 'extend-a' ifTrue: [ value := 'extA' ].
	arg type = 'extend-b' ifTrue: [ value := 'extB' ].
	out nextPutAll: 
'				' , arg name , ' = ' , value, ';' ; lf; nextPutAll: 
'				' , value , ' = 0;'; lf
]

{ #category : #accessing }
LowcodeCInterpreter >> fetchExtendedArguments: instruction [
	instruction arguments do: [ :arg | self fetchExtendedArgument: arg ]
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> fetchStackArgument: arg [
	out nextPutAll: (
'				' , (self popForType: arg type), '(', arg name , ');'); lf
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> fetchStackArguments: instruction [
	instruction stackArguments reverseDo: [ :arg | self fetchStackArgument: arg ]
]

{ #category : #accessing }
LowcodeCInterpreter >> generate. [
	out := destName asFileReference delete; writeStream.
	[
		self emitDisclaimer;
			emitCommon;
			emitOpcodeConstants;
			emitInitialization;
			emitInterpreter
	] ensure: [ out close ]
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> mapType: type [
	^ TypeMap at: type

]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> popForType: type [
	^ PopForTypes at: type
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> pushForType: type [
	^ PushForTypes at: type
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> pushStackResult: result [
	out nextPutAll: (
'				' , (self pushForType: result type) , '(' , result name , ');'); lf
]

{ #category : #'as yet unclassified' }
LowcodeCInterpreter >> pushStackResults: instruction [
	instruction stackResults do: [ :res | self pushStackResult: res ]
]
