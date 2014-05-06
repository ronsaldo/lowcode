Class {
	#name : #LowcodeInstructionsTest,
	#superclass : #TestCase,
	#pools : [
		'LowcodeAssemblerConstants'
	],
	#category : #'Lowcode-Test'
}

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg1 with: arg2 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #'as yet unclassified' }
LowcodeInstructionsTest >> interpret: instructions with: arg1 with: arg2 with: arg3 [
	<primitive: #primitiveInterpretLowcode module: #LowcodeInterpreterPlugin error:errorCode>
	self error: 'Got a failure: ' , errorCode asString
]

{ #category : #tests }
LowcodeInstructionsTest >> testAddArgs [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 2 oopRegisters: 2 floatRegisters: 2;
		peekvm: OR1 arg: 1;
		peekvm: OR2 arg: 0;
		oop2int: IR1 source: OR1;
		oop2int: IR2 source: OR2;
		retif;
		add: IR1 first: IR1 second: IR2;
		int2oop: OR1 source: IR1;
		retvm: OR1.
	self assert: (self interpret: gen emit with: 1 with: 2) = 3
]

{ #category : #tests }
LowcodeInstructionsTest >> testAddFArgs [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 0 oopRegisters: 2 floatRegisters: 2;
		peekvm: OR1 arg: 1;
		peekvm: OR2 arg: 0;
		oop2fp: FR1 source: OR1;
		oop2fp: FR2 source: OR2;
		retif;
		fadd: FR1 first: FR1 second: FR2;
		fp2oop: OR1 source: FR1;
		retvm: OR1.
	self assert: (self interpret: gen emit with: 1.5 with: 2.5) = 4
]

{ #category : #tests }
LowcodeInstructionsTest >> testMemoryWrite [
	| gen data |
	gen := LowcodeAssembler new.
	data := ByteArray new: 3.
	gen enter: 2 oopRegisters: 1 floatRegisters: 0;
		peekvm: OR1 arg: 0;
		fstidx: IR1 source: OR1;
		retif;
		" First Byte"
		ldcu8: IR2 value: 1;
		sti8: IR1 source: IR2;
		
		"Second byte"
		addcs8: IR1 constant: 1;
		addcs8: IR2 constant: 1;
		sti8: IR1 source: IR2;

		"Third byte"
		addcs8: IR1 constant: 1;
		addcs8: IR2 constant: 1;
		sti8: IR1 source: IR2;
		
		"Return"
		retvms.
		
	self interpret: gen emit with: data.
	self assert: (data at: 1) = 1.
	self assert: (data at: 2) = 2.
	self assert: (data at: 3) = 3.
]

{ #category : #tests }
LowcodeInstructionsTest >> testMinValue [
	| gen returnFirst |
	gen := LowcodeAssembler new.
	returnFirst := gen makeLabel.
	gen enter: 2 oopRegisters: 2 floatRegisters: 0;
		peekvm: OR1 arg: 1;
		peekvm: OR2 arg: 0;
		oop2int: IR1 source: OR1;
		oop2int: IR2 source: OR2;
		retif;
		cmp: IR1 second: IR2;
		brlt: returnFirst;
		retvm: OR2;
	putLabel: returnFirst;
		retvm: OR1.
	self assert: (self interpret: gen emit with: 1 with: 2) = 1.
	self assert: (self interpret: gen emit with: 2 with: 1) = 1.
	self assert: (self interpret: gen emit with: 1 with: 1) = 1.

]

{ #category : #tests }
LowcodeInstructionsTest >> testReturn1 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcu8: IR1 value: 1;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = 1
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturn2 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcu16: IR1 value: 2;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = 2
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturn4 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcu32: IR1 value: 4;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = 4
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturn8 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcu64: IR1 value: 8;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = 8
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnF0 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 0 oopRegisters: 1 floatRegisters: 0;
		fp2oop: OR1 source: FR0;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = 0
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnF32 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 0 oopRegisters: 1 floatRegisters: 1;
		ldcf32: FR1 value: -8.5;
		fp2oop: OR1 source: FR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -8.5
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnF64 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 0 oopRegisters: 1 floatRegisters: 1;
		ldcf64: FR1 value: -8.5;
		fp2oop: OR1 source: FR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -8.5
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnM1 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcs8: IR1 value: -1;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -1
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnM2 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcs16: IR1 value: -2;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -2
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnM4 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcs32: IR1 value: -4;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -4
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnM8 [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 1 oopRegisters: 1 floatRegisters: 0;
		ldcs64: IR1 value: -8;
		int2oop: OR1 source: IR1;
		retif;
		retvm: OR1.
	self assert: (self interpret: gen emit) = -8
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnNil [
	| gen |
	gen := LowcodeAssembler new.
	gen retvm: OR0.
	self assert: (self interpret: gen emit) == nil
]

{ #category : #tests }
LowcodeInstructionsTest >> testReturnSelf [
	| gen |
	gen := LowcodeAssembler new.
	gen retvms.
	self assert: (self interpret: gen emit) == self
]

{ #category : #tests }
LowcodeInstructionsTest >> testSubArgs [
	| gen |
	gen := LowcodeAssembler new.
	gen enter: 2 oopRegisters: 2 floatRegisters: 0;
		peekvm: OR1 arg: 1;
		peekvm: OR2 arg: 0;
		oop2int: IR1 source: OR1;
		oop2int: IR2 source: OR2;
		retif;
		sub: IR1 first: IR1 second: IR2;
		int2oop: OR1 source: IR1;
		retvm: OR1.
	self assert: (self interpret: gen emit with: 1 with: 2) = -1
]
