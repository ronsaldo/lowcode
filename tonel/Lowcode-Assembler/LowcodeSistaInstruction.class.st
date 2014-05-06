"
This represents a Sista instruction.

TODO: This should be merged with the assembler used by Sista.
"
Class {
	#name : #LowcodeSistaInstruction,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'opcode',
		'first',
		'second'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instance creation' }
LowcodeSistaInstruction class >> new: opcode [
	^ self new opcode: opcode; yourself
]

{ #category : #'instance creation' }
LowcodeSistaInstruction class >> new: opcode with: first [
	^ self new opcode: opcode; with: first; yourself
]

{ #category : #'instance creation' }
LowcodeSistaInstruction class >> new: opcode with: first with: second [
	^ self new opcode: opcode; first: first; second: second; yourself
]

{ #category : #'as yet unclassified' }
LowcodeSistaInstruction >> computeSizeForOffset: anOffset [
	^ self elementSize
]

{ #category : #'as yet unclassified' }
LowcodeSistaInstruction >> elementSize [
	opcode >= 248 ifTrue: [ ^ 3 ].
	opcode >= 224 ifTrue: [ ^ 2 ].
	^ 1
]

{ #category : #'as yet unclassified' }
LowcodeSistaInstruction >> emitToStream: stream [
	stream nextPut: opcode.
	opcode >= 248 ifTrue:  [
		stream nextPut: first.
		stream nextPut: second.
	] ifFalse: [
		opcode >= 224 ifTrue: [
			stream nextPut: first.
		]
	]
]

{ #category : #accessing }
LowcodeSistaInstruction >> first [
	
	^ first
]

{ #category : #accessing }
LowcodeSistaInstruction >> first: anObject [
	
	first := anObject
]

{ #category : #accessing }
LowcodeSistaInstruction >> opcode [
	^ opcode
]

{ #category : #accessing }
LowcodeSistaInstruction >> opcode: anObject [
	opcode := anObject
]

{ #category : #accessing }
LowcodeSistaInstruction >> second [
	
	^ second
]

{ #category : #accessing }
LowcodeSistaInstruction >> second: anObject [
	
	second := anObject
]
