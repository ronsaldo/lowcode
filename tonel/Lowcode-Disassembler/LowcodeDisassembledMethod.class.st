Class {
	#name : #LowcodeDisassembledMethod,
	#superclass : #Object,
	#instVars : [
		'basicBlocks',
		'literals',
		'hasBeenValidated',
		'isValid'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #accessing }
LowcodeDisassembledMethod >> addBasicBlock: aBasicBlock [
	basicBlocks add: aBasicBlock.
	aBasicBlock index: basicBlocks size;
		method: self.
		
]

{ #category : #accessing }
LowcodeDisassembledMethod >> basicBlocks [
	^ basicBlocks
]

{ #category : #initialization }
LowcodeDisassembledMethod >> initialize [
	basicBlocks := OrderedCollection new.
	hasBeenValidated := false
]

{ #category : #validation }
LowcodeDisassembledMethod >> isValid [
	hasBeenValidated ifTrue: [ ^ isValid ].
	isValid := basicBlocks first validate: LoDisValidationStack new.
	^ isValid
]

{ #category : #accessing }
LowcodeDisassembledMethod >> literals [
	^ literals
]

{ #category : #accessing }
LowcodeDisassembledMethod >> literals: anArrayWithLiterals [
	literals := anArrayWithLiterals
]
