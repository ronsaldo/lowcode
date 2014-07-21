"
A FFIFunctionSpecParser takes care of parsing a FFI function specification.

The function specifications can be provided as string or literal arrays. They conform to the following grammar:


<anonFunctionSpecification> ::= <type> '(' <arguments ')'
<namedFunctionSpecification> ::= <type> <name> '(' <arguments ')'

<arguments> ::= ( <argument> ( ',' <argument>) *)?

<argument> ::= <specialVariable>
				| <integerLiteral>
				| <type> <variable>

<type> ::= 'const'? <basicType> '*'*

<variable> ::= aSymbol 

<specialVariable> ::= 'self'
					| 'nil'

This parser is heavily based in the one implemented in NativeBoost by Igor Stasenko.
"
Class {
	#name : #FFIFunctionSpecParser,
	#superclass : #FFISpecParser,
	#instVars : [
		'functionSpec'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #parsing }
FFIFunctionSpecParser >> isArgumentEnd [
	| ch |
	ch := stream peek.
	^ ch = $, or: [ ch = $) ]
]

{ #category : #public }
FFIFunctionSpecParser >> parseAnonFunction: aFunctionDefinition [

"
Parse a function definition in a form of:

#( returnType (arguments) )
or
'returnType (arguments)'

Answer an instance of FFIFunctionSpec class
"
	"Setup."
	functionSpec := FFIFunctionSpec new.
	self setUpScanner: aFunctionDefinition.
	
	self parseReturnType;
		parseArguments.

	^ functionSpec
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseArgument [
	self isNextNumber ifTrue: [ self parseNumberArgument ].
	self isNextSymbol ifTrue: [ self parseTypedOrSpecialArgument]
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseArguments [
	self matchCharacter: $(.
	stream peek ~= $) ifTrue: [
		self parseArgument.
		[ stream peek = $, ] whileTrue: [ 
			self matchCharacter: $,.
			self parseArgument 
		]
	].
	
	self matchCharacter: $)
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseFunctionName [
	| functionName |
	functionName := self parseSymbol.
	functionSpec functionName: functionName.

]

{ #category : #public }
FFIFunctionSpecParser >> parseNamedFunction: aFunctionDefinition [

"
Parse a function definition in a form of:

#( returnType functionName (arguments) )
or
'returnType functionName (arguments)'

Answer an instance of FFIFunctionSpec class
"
	"Setup."
	functionSpec := FFIFunctionSpec new.
	self setUpScanner: aFunctionDefinition.
	
	self parseReturnType;
		parseFunctionName;
		parseArguments.

	^ functionSpec
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseNumberArgument [
	self shouldBeImplemented 
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseReturnType [
	functionSpec returnType: (requestor returnType: self parseType).

]

{ #category : #parsing }
FFIFunctionSpecParser >> parseTypedOrSpecialArgument [
	| name type |
	type := self parseType.
	self isArgumentEnd ifTrue: [
		type second ~= 0 ifTrue: [ self error: 'argument name expected' ].
		^ functionSpec addArgument: (requestor variableArgument: type first)
	].

	name := self parseSymbol.
	functionSpec addArgument: (requestor argument: name type: type first pointerArity: type second)
]
