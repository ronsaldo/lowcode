Class {
	#name : #LoDisBasicBlock,
	#superclass : #Object,
	#instVars : [
		'method',
		'instructions',
		'index',
		'validationStatus',
		'entryStackSignature',
		'exitStackSignature'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #adding }
LoDisBasicBlock >> addInstruction: anInstruction [
	instructions add: anInstruction
]

{ #category : #accessing }
LoDisBasicBlock >> index [
	^ index
]

{ #category : #accessing }
LoDisBasicBlock >> index: anIndex [
	index := anIndex
]

{ #category : #initialization }
LoDisBasicBlock >> initialize [
	instructions := OrderedCollection new.
	validationStatus := #notValidated.

]

{ #category : #accessing }
LoDisBasicBlock >> instructions [
	^ instructions
]

{ #category : #validation }
LoDisBasicBlock >> isValid [
	^ true
]

{ #category : #accessing }
LoDisBasicBlock >> method [
	^ method
]

{ #category : #accessing }
LoDisBasicBlock >> method: aDisasembledMethod [
	method := aDisasembledMethod
]

{ #category : #printing }
LoDisBasicBlock >> name [
	^ 'basicBlock' , index printString
]

{ #category : #printing }
LoDisBasicBlock >> printOn: aStream [
	aStream nextPutAll: self name, ': '.
	validationStatus == #valid ifTrue: [ aStream nextPutAll: '(' , entryStackSignature , ' -> ' , exitStackSignature , ')' ].
	instructions do: [ :ins | aStream tab. ins printOn: aStream. aStream cr ]
]

{ #category : #validation }
LoDisBasicBlock >> validate: stack [
	| seenBranchOrTerminator |
	validationStatus ~~ #notValidated ifTrue: [ ^ stack value = entryStackSignature ].
	entryStackSignature := stack value.
	validationStatus := #validating.

	" The last instruction has to be a branch or a terminator."
	(instructions isEmpty or: [ instructions last isBranchOrTerminator]) ifFalse: [ validationStatus := #invalid. ^ false ].

	"Validate the different instructions"
	seenBranchOrTerminator := false.	
	instructions do: [ :ins |
		"Only the last instruction can be a branch or a terminator"
		seenBranchOrTerminator ifTrue: [ validationStatus := #invalid. ^ false ].
		
		(ins validate: stack forMethod: method) ifFalse: [ validationStatus := #invalid. ^ false ].
		seenBranchOrTerminator := ins isBranchOrTerminator.
	].

	"Store the block exit signature"
	exitStackSignature := stack value.
	
	validationStatus := #valid.
	^ true
]
