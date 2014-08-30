Class {
	#name : #LowcodeCogitGenerator,
	#superclass : #LowcodeGenerator,
	#instVars : [
		'destName',
		'out'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator class >> generateFromFileNamed: fileName to: destFileName [
	"
	self generateFromFileNamed: './lowcode.xml' to: 'LowcodeCog.st'
	"
	(self fromFileNamed: fileName) destName: destFileName; generate.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginCaseOf [
	out tab; nextPutAll:'prim'; cr;
		tab; tab; nextPutAll: 'caseOf: {'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> beginInstruction: instruction opcodeOffset: opcodeOffset. [
	out tab; tab; nextPutAll: '[' , (instruction opcode + opcodeOffset) printString , '] -> '; tab ;
		nextPutAll: '[ "', instruction opcode printString; tab; nextPutAll: instruction mnemonic , ' - ' , instruction name , '"'; cr.

]

{ #category : #accessing }
LowcodeCogitGenerator >> destName [
	
	^ destName
]

{ #category : #accessing }
LowcodeCogitGenerator >> destName: anObject [
	
	destName := anObject
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitBinary: instruction [
	self beginInstruction: instruction opcodeOffset: -2000.
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt' ]); cr.
	self endInstruction: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitNullary: instruction [
	self beginInstruction: instruction opcodeOffset: 0.
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt' ]); cr.
	self endInstruction: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitUnary: instruction [
	self beginInstruction: instruction opcodeOffset: -1000.
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt' ]); cr.
	self endInstruction: instruction.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endCaseOf [
	out tab; tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ EncounteredUnknownBytecode ]'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> endInstruction: instruction [
	out tab; tab; tab; tab; nextPutAll: '].'; cr
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generate [
	out := destName asFileReference delete; writeStream.
	[
		self generateNullaryInstructions;
			generateUnaryInstructions;
			generateBinaryInstructions;
			generateTernaryInstructions
	] ensure: [ out close ]

]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateBinaryInstructions [
	out nextPutAll: 'binaryInstructions'; cr.
	self beginCaseOf.
		
	spec instructions do: [ :ins | ins stackArguments size == 2 ifTrue: [ self emitBinary: ins ] ].
	
	self endCaseOf
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateNullaryInstructions [
	out nextPutAll: 'nullaryInstructions'; cr.
	self beginCaseOf.
		
	spec instructions do: [ :ins | ins stackArguments size == 0 ifTrue: [ self emitNullary: ins ] ].
	
	self endCaseOf
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateTernaryInstructions [
	out nextPutAll: 'ternaryInstructions'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateUnaryInstructions [
	out nextPutAll: 'unaryInstructions'; cr.
	self beginCaseOf.
		
	spec instructions do: [ :ins | ins stackArguments size == 1 ifTrue: [ self emitUnary: ins ] ].
	
	self endCaseOf
]
