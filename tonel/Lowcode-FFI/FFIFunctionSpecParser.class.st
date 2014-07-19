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
	#superclass : #Object,
	#instVars : [
		'functionSpec',
		'requestor',
		'stream'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #parsing }
FFIFunctionSpecParser >> consumeWhite [
	| ch |
	[ 
		ch := stream peek.
		ch ifNil: [ ^ self ].
		ch isSeparator ] whileTrue: [ stream next
	]
]

{ #category : #parsing }
FFIFunctionSpecParser >> expected: what [
	self error: 'expected ' , what , ' in function specification'
]

{ #category : #parsing }
FFIFunctionSpecParser >> isArgumentEnd [
	| ch |
	ch := stream peek.
	^ ch = $, or: [ ch = $) ]
]

{ #category : #'character testing' }
FFIFunctionSpecParser >> isDigitCharacter: character [
	^ character isDigit
]

{ #category : #'character testing' }
FFIFunctionSpecParser >> isNextNumber [
	^ self isDigitCharacter: stream peek
]

{ #category : #'character testing' }
FFIFunctionSpecParser >> isNextSymbol [
	^ self isSymbolStartCharacter: stream peek
]

{ #category : #'character testing' }
FFIFunctionSpecParser >> isSymbolInnerCharacter: character [
	^ (character isLetter or: [ character isDigit  ]) or: [ character = $_ ]
]

{ #category : #'character testing' }
FFIFunctionSpecParser >> isSymbolStartCharacter: character [
	^ character isLetter or: [ character = $_ ]
]

{ #category : #parsing }
FFIFunctionSpecParser >> literalArrayToString: literalArray [
	^ ByteString streamContents: [ :outStream | self literalArrayToString: literalArray stream: outStream ]
]

{ #category : #parsing }
FFIFunctionSpecParser >> literalArrayToString: literalArray stream:outStream [
	literalArray do: [ :el |
		el isArray ifTrue: [ 
			outStream nextPut: $( .
			self literalArrayToString: el stream: outStream.
			outStream nextPut: $); nextPut: $ .
		]
		ifFalse: [ 
			outStream nextPutAll: el; nextPut: $ .
		]
	]
]

{ #category : #parsing }
FFIFunctionSpecParser >> matchCharacter: aCharacter [
	stream next ~= aCharacter ifTrue: [ self expected: '"' , aCharacter asString, '"'  ].
	self consumeWhite
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

{ #category : #parsing }
FFIFunctionSpecParser >> parseMatching: aBlock [
	| ch result |
	result := ByteString streamContents: [ :out |
		ch  := stream next.
		[aBlock value: ch] whileTrue: [ 
			out nextPut: ch. 
			ch := stream next
		]
	].
	self consumeWhite.
	^ result
	
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
FFIFunctionSpecParser >> parseSymbol [
	self isNextSymbol ifFalse: [ self expected: 'symbol' ].
	^ self parseMatching: [ :c | self isSymbolInnerCharacter: c ].
	
]

{ #category : #parsing }
FFIFunctionSpecParser >> parseType [
	| typeName pointerArity |
	typeName := self parseSymbol.
	typeName = 'const' ifTrue: [
		"Ignore const for now."
		typeName := self parseSymbol.
	].
	
	pointerArity := 0.
	
	[ stream peek = $* ] whileTrue: [
		pointerArity := pointerArity + 1.
		self matchCharacter: $*.
	].

	^ Array with: typeName with: pointerArity
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

{ #category : #accessing }
FFIFunctionSpecParser >> requestor: calloutObject [
	"The requestor is used to resolve types."
	requestor := calloutObject
]

{ #category : #parsing }
FFIFunctionSpecParser >> setUpScanner: aFunctionDefinition [
	| wholeSpec |
	aFunctionDefinition isString ifTrue: [
		wholeSpec := aFunctionDefinition.
	] ifFalse: [
		wholeSpec := self literalArrayToString: aFunctionDefinition.
	].
	stream := wholeSpec readStream.
	self consumeWhite

]
