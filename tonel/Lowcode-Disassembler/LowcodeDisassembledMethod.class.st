Class {
	#name : #LowcodeDisassembledMethod,
	#superclass : #Object,
	#instVars : [
		'basicBlocks',
		'literals',
		'hasBeenValidated',
		'isValid',
		'numberOfArguments',
		'numberOfTemporals',
		'stackFrameSize',
		'blockPCMap'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #accessing }
LowcodeDisassembledMethod >> addBasicBlock: aBasicBlock [
	basicBlocks add: aBasicBlock.
	aBasicBlock index: basicBlocks size;
		method: self.
	blockPCMap at: aBasicBlock pc put: aBasicBlock
]

{ #category : #accessing }
LowcodeDisassembledMethod >> basicBlocks [
	^ basicBlocks
]

{ #category : #accessing }
LowcodeDisassembledMethod >> blockAtPC: pc [
	^ blockPCMap at: pc
]

{ #category : #initialization }
LowcodeDisassembledMethod >> initialize [
	basicBlocks := OrderedCollection new.
	hasBeenValidated := false.
	blockPCMap := IdentityDictionary new.
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

{ #category : #accessing }
LowcodeDisassembledMethod >> numberOfArguments [
	
	^ numberOfArguments
]

{ #category : #accessing }
LowcodeDisassembledMethod >> numberOfArguments: anObject [
	
	numberOfArguments := anObject
]

{ #category : #accessing }
LowcodeDisassembledMethod >> numberOfTemporals [
	
	^ numberOfTemporals
]

{ #category : #accessing }
LowcodeDisassembledMethod >> numberOfTemporals: anObject [
	
	numberOfTemporals := anObject
]

{ #category : #accessing }
LowcodeDisassembledMethod >> stackFrameSize [
	
	^ stackFrameSize
]

{ #category : #accessing }
LowcodeDisassembledMethod >> stackFrameSize: anObject [
	
	stackFrameSize := anObject
]
