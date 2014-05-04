"
A LowcodeAssemblerTest is a test class for testing the behavior of LowcodeAssembler
"
Class {
	#name : #LowcodeAssemblerTest,
	#superclass : #TestCase,
	#category : #'Lowcode-Test'
}

{ #category : #tests }
LowcodeAssemblerTest >> testInfinite [
	| gen data label |
	gen := LowcodeAssembler new.
	label := gen makeLabelHere.
	gen jmp: label.
	
	data := gen emit.
	self assert: data size = 5.
]

{ #category : #tests }
LowcodeAssemblerTest >> testInfinite2 [
	| gen data label |
	gen := LowcodeAssembler new.
	gen nop.
	label := gen makeLabelHere.
	gen jmp: label.
	
	data := gen emit.
	self assert: data size = 6.
	self assert: (data nbUInt16AtOffset: 4) == 1
]

{ #category : #tests }
LowcodeAssemblerTest >> testSimple [
	| gen data |
	gen := LowcodeAssembler new.
	gen ret.
	
	data := gen emit.
	self assert: data size = 3.
]
