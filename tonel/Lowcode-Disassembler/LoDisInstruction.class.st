Class {
	#name : #LoDisInstruction,
	#superclass : #Object,
	#instVars : [
		'ownerBlock',
		'jumpBlock',
		'branchBlock',
		'opcode',
		'extendA',
		'extendB',
		'pc',
		'nextPC',
		'nextBlock'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #accessing }
LoDisInstruction >> branchAddress: literals [
	self subclassResponsibility
]

{ #category : #accessing }
LoDisInstruction >> branchBlock [
	^ branchBlock
]

{ #category : #accessing }
LoDisInstruction >> branchBlock: aBasicBlock [
	branchBlock := aBasicBlock
]

{ #category : #accessing }
LoDisInstruction >> extendA [
	
	^ extendA
]

{ #category : #accessing }
LoDisInstruction >> extendA: anObject [
	
	extendA := anObject
]

{ #category : #accessing }
LoDisInstruction >> extendB [
	
	^ extendB
]

{ #category : #accessing }
LoDisInstruction >> extendB: anObject [
	
	extendB := anObject
]

{ #category : #accessing }
LoDisInstruction >> instructionKind [
	^ #operation
]

{ #category : #accessing }
LoDisInstruction >> instructionSize [
	^ nextPC - pc
]

{ #category : #testing }
LoDisInstruction >> isBranch [
	^ self instructionKind == #branch
]

{ #category : #testing }
LoDisInstruction >> isBranchOrTerminator [
	^ (self isBranch or: [ self isJump ]) or: [ self isTerminator ]
]

{ #category : #testing }
LoDisInstruction >> isJump [
	^ self instructionKind == #jump
]

{ #category : #testing }
LoDisInstruction >> isTerminator [
	^ self instructionKind == #terminator
]

{ #category : #accessing }
LoDisInstruction >> jumpAddress [
	^ nextPC
]

{ #category : #accessing }
LoDisInstruction >> jumpAddress: literals [
	self subclassResponsibility
]

{ #category : #accessing }
LoDisInstruction >> jumpBlock [
	^ jumpBlock
]

{ #category : #accessing }
LoDisInstruction >> jumpBlock: aBasicBlock [
	jumpBlock := aBasicBlock
]

{ #category : #printing }
LoDisInstruction >> mnemonic [
	self subclassResponsibility
]

{ #category : #accessing }
LoDisInstruction >> nextAddress [
	^ nextPC
]

{ #category : #accessing }
LoDisInstruction >> nextBlock [
	^ nextBlock
]

{ #category : #accessing }
LoDisInstruction >> nextBlock: aBasicBlock [
	nextBlock := aBasicBlock
]

{ #category : #accessing }
LoDisInstruction >> nextPC [
	
	^ nextPC
]

{ #category : #accessing }
LoDisInstruction >> nextPC: anObject [
	
	nextPC := anObject
]

{ #category : #accessing }
LoDisInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LoDisInstruction >> opcode: anObject [
	
	opcode := anObject
]

{ #category : #accessing }
LoDisInstruction >> ownerBlock [
	
	^ ownerBlock
]

{ #category : #accessing }
LoDisInstruction >> ownerBlock: anObject [
	
	ownerBlock := anObject
]

{ #category : #accessing }
LoDisInstruction >> pc [
	
	^ pc
]

{ #category : #accessing }
LoDisInstruction >> pc: anObject [
	
	pc := anObject
]

{ #category : #validation }
LoDisInstruction >> performValidation: stack forMethod: method [
	| selector |
	selector := (self mnemonic , 'Validate:forMethod:') asSymbol.
	^ self perform: selector with: stack with: method
]

{ #category : #printing }
LoDisInstruction >> printOn: aStream [
	aStream nextPutAll: self mnemonic, ' '.

	extendA > 0 ifTrue: [ aStream nextPutAll: '[ExtA = ' , extendA printString, '] ' ].
	extendB > 0 ifTrue: [ aStream nextPutAll: '[ExtB = ' , extendB printString, '] ' ].
	
	(self isJump and: [ jumpBlock notNil]) ifTrue: [ aStream nextPutAll: jumpBlock name ].
	(self isBranch and: [ branchBlock notNil]) ifTrue: [ 
		aStream nextPutAll: branchBlock name , ' next: ' , nextBlock name
	].
]

{ #category : #accessing }
LoDisInstruction >> successors [
	self isJump ifTrue: [ ^ { self jumpBlock } ].
	self isBranch ifTrue: [ ^ { self nextBlock . self branchBlock } ].
	^ #()
]

{ #category : #validation }
LoDisInstruction >> validate: stack forMethod: method [
	(self performValidation: stack forMethod: method) ifFalse: [^ false].
	
	self isJump ifTrue: [ 
		(self jumpBlock validate: stack copy) ifFalse: [ ^ false ]
	].

	self isBranch ifTrue: [ 
		(self branchBlock validate: stack copy) ifFalse: [ ^ false ].
		(self nextBlock validate: stack copy) ifFalse: [ ^ false ]
	].

	^ true
]
