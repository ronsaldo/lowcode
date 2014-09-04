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
	gen jump: label.
	
	data := gen emit.
	self assert: data instructions size = 14.
]

{ #category : #tests }
LowcodeAssemblerTest >> testInfinite2 [
	| gen data label |
	gen := LowcodeAssembler new.
	gen nop.
	label := gen makeLabelHere.
	gen jump: label.
	
	data := gen emit.
	self assert: data instructions size = 15.
]

{ #category : #tests }
LowcodeAssemblerTest >> testLocal [
	| gen data |
	gen := LowcodeAssembler new.
	gen allocateLocalInt32.
	gen returnFalse.
	
	data := gen emit.
	self assert: data instructions size = 6.
	self assert: (data instructions at: 2) = 4.
]

{ #category : #tests }
LowcodeAssemblerTest >> testReturnOne [
	| gen data |
	gen := LowcodeAssembler new.
	gen pushOne32;
		int32ToOop;
		returnTop.
	
	data := gen emit.
	self assert: data instructions size = 12.
]

{ #category : #tests }
LowcodeAssemblerTest >> testSimple [
	| gen data |
	gen := LowcodeAssembler new.
	gen returnFalse.
	
	data := gen emit.
	self assert: data instructions size = 6.
]
