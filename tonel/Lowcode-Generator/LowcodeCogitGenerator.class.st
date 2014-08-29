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

{ #category : #accessing }
LowcodeCogitGenerator >> destName [
	
	^ destName
]

{ #category : #accessing }
LowcodeCogitGenerator >> destName: anObject [
	
	destName := anObject
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> emitNullary: instruction [
	out tab; tab; nextPutAll: '[' , instruction opcode printString , '] -> '; tab ;
		nextPutAll: '[ "', instruction opcode printString; tab; nextPutAll: instruction mnemonic , ' - ' , instruction name , '"'; cr.
	out nextPutAll: (instruction semanticFor: 'Smalltalk/Cog' ifAbsent: [ 'self halt' ]); cr.
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
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateNullaryInstructions [
	out nextPutAll: 'nullaryInstructions'; cr.
	out tab; nextPutAll:'prim'; cr;
		tab; tab; nextPutAll: 'caseOf: {'; cr.
		
	spec instructions do: [ :ins | ins stackArguments size == 0 ifTrue: [ self emitNullary: ins ] ].
	
	out tab; tab; tab; nextPutAll: '}'; cr;
		tab; tab; nextPutAll: 'otherwise: [ ^ EncounteredUnknownBytecode ]'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateTernaryInstructions [
	out nextPutAll: 'ternaryInstructions'; cr.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generateUnaryInstructions [
	out nextPutAll: 'unaryInstructions'; cr.
]
