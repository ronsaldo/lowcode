"
A FFIFunctionSpecParserTest is a test class for testing the behavior of FFIFunctionSpecParser
"
Class {
	#name : #FFIFunctionSpecParserTest,
	#superclass : #TestCase,
	#instVars : [
		'requestor',
		'parser'
	],
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #running }
FFIFunctionSpecParserTest >> dummyMethod: a b: b c: c [
]

{ #category : #running }
FFIFunctionSpecParserTest >> setUp [
	requestor := FFICalllout new.
	requestor requestor: self class;
				originalMethod: (self class >> #dummyMethod:b:c: ).
	parser := requestor newSpecParser

]

{ #category : #running }
FFIFunctionSpecParserTest >> testSimple [
	| spec |
	spec := parser parseNamedFunction: #( void dummy () ).
	self assert: spec returnType class equals:  FFIVoidType.
	self assert: spec functionName = #dummy.
	self assert: spec arguments size equals: 0
]

{ #category : #running }
FFIFunctionSpecParserTest >> testSimpleAnon [
	| spec |
	spec := parser parseAnonFunction: #( void () ).
	self assert: spec returnType class equals: FFIVoidType.
	self assert: spec functionName isNil.
	self assert: spec arguments size equals: 0
]

{ #category : #running }
FFIFunctionSpecParserTest >> testSimpleArgs [
	| spec |
	spec := parser parseNamedFunction: #( void dummy (self, int32 a, oop requestor) ).
	self assert: spec returnType class equals:  FFIVoidType.
	self assert: spec functionName = #dummy.
	self assert: spec arguments size equals: 3.
	self assert: spec arguments first isReceiverArgument.
	self assert: spec arguments second isMethodArgument.
	self assert: spec arguments second type class equals: FFIInt32Type.
	self assert: spec arguments third isInstanceVariableArgument.
	self assert: spec arguments third type class equals: FFIOopType
]
