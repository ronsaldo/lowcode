Class {
	#name : #LowcodeCogitGenerator,
	#superclass : #LowcodeGenerator,
	#category : #'Lowcode-Generator'
}

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator class >> generateFromFileNamed: fileName [
	"
	self generateFromFileNamed: './lowcode.xml'
	"
	(self fromFileNamed: fileName) generate.
]

{ #category : #'as yet unclassified' }
LowcodeCogitGenerator >> generate [
	self generateNullaryInstructions;
		generateUnaryInstructions;
		generateBinaryInstructions;
		generateTernaryInstructions
]
