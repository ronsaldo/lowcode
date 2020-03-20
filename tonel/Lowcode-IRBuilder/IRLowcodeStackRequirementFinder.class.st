"
I am a Lowcode specific stack size requirement finder. I also validate that the lowcode stack parameters have the correct type.
"
Class {
	#name : #IRLowcodeStackRequirementFinder,
	#superclass : #IRVisitor,
	#instVars : [
		'lowcodeStack',
		'currentLowcodeStackSize',
		'requiredLowcodeStackSize',
		'sequencesWithEntryStack',
		'pendingSequences',
		'processedSequences',
		'wordSize'
	],
	#category : #'Lowcode-IRBuilder'
}

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> enqueueSequence: sequence stackElements: sequenceStackEntryElements [
	self assert: sequenceStackEntryElements isArray.
	sequencesWithEntryStack at: sequence ifPresent: [ :found |
		found = sequenceStackEntryElements ifFalse: [ 
			self error: 'Sequence is entered with unbalanced stack elements.'
		].
		^ self	
	] ifAbsentPut: [ sequenceStackEntryElements ].
	pendingSequences add: sequence
]

{ #category : #initialization }
IRLowcodeStackRequirementFinder >> initialize [
	super initialize.
	sequencesWithEntryStack := IdentityDictionary new.
	currentLowcodeStackSize := 0.
	requiredLowcodeStackSize := 0.
	pendingSequences := LinkedList new.
	wordSize := Smalltalk wordSize.
]

{ #category : #adding }
IRLowcodeStackRequirementFinder >> pop: elementType [
	elementType == #oop ifTrue: [ ^ self ].
	"Transcript show: 'Pop: '; show: elementType; cr."
	lowcodeStack last ~~ elementType ifTrue: [ self error: 'Unbalanced lowcode stack' ].
	lowcodeStack removeLast.
	currentLowcodeStackSize := currentLowcodeStackSize - (self sizeofLowcodeOperand: elementType).
]

{ #category : #'as yet unclassified' }
IRLowcodeStackRequirementFinder >> processPendingSequences [
	[pendingSequences isNotEmpty] whileTrue: [
		| sequence |
		sequence := pendingSequences first.
		pendingSequences removeFirst.
		self visitNode: sequence
	]
]

{ #category : #adding }
IRLowcodeStackRequirementFinder >> push: elementType [
	elementType == #oop ifTrue: [ ^ self ].
	"Transcript show: 'Push: '; show: elementType; cr."
	lowcodeStack add: elementType.
	currentLowcodeStackSize := currentLowcodeStackSize + (self sizeofLowcodeOperand: elementType).
	requiredLowcodeStackSize := requiredLowcodeStackSize max: currentLowcodeStackSize

]

{ #category : #'as yet unclassified' }
IRLowcodeStackRequirementFinder >> requiredLowcodeStackSize [
	^ requiredLowcodeStackSize
]

{ #category : #'as yet unclassified' }
IRLowcodeStackRequirementFinder >> requiredLowcodeStackTemporaries [
	^ (requiredLowcodeStackSize + wordSize - 1) // wordSize
]

{ #category : #'as yet unclassified' }
IRLowcodeStackRequirementFinder >> sizeofLowcodeOperand: operand [
	operand == #float64 ifTrue: [ ^ 8 ].
	operand == #int64 ifTrue: [ ^ 8 ].
	^ wordSize
]

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> visitJump: jump [
	self enqueueSequence: jump destination stackElements: lowcodeStack asArray.
]

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> visitJumpIf: jumpIf [
	self enqueueSequence: jumpIf destination stackElements: lowcodeStack asArray.
	self enqueueSequence: jumpIf otherwise stackElements: lowcodeStack asArray.
]

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> visitLowcodeInstruction: instruction [
	| opcode stackTransition |
	opcode := instruction opcode.
	stackTransition := IRLowcodeInstruction lowcodeStackTransitionTable at: opcode.
	stackTransition first reverseDo: [ :each | self pop: each ].
	stackTransition second do: [ :each | self push: each ].

]

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> visitMethod: method [
	self enqueueSequence: method startSequence stackElements: #().
	self processPendingSequences.
]

{ #category : #visiting }
IRLowcodeStackRequirementFinder >> visitSequence: sequence [
	currentLowcodeStackSize := 0.
	requiredLowcodeStackSize := 0.
	lowcodeStack := OrderedCollection new.
	(sequencesWithEntryStack at: sequence) do: [ :each | self push: each].
	
	sequence do: [ :instr | self visitNode: instr].
]
