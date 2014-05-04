Class {
	#name : #LowcodeInstruction,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'opcode',
		'args'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode [
	^ self new: opcode args: #()
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode args: args [
	^ self new opcode: opcode; args: args; yourself
]

{ #category : #accessing }
LowcodeInstruction >> args [
	
	^ args
]

{ #category : #accessing }
LowcodeInstruction >> args: anObject [
	
	args := anObject
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> computeSizeForOffset: anOffset [
	^ self elementSize
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> elementSize [
	| size |
	size := 3.
	args do: [ :arg | size := size + (arg elementSize) ].
	^ size
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> emitToStream: stream [
	| low high |
	"Emit the opcode."
	low := opcode & 16rFF.
	high := ((opcode & 16rFF00) >> 8) | 16r80.
	stream nextPut: 248. "Sista inline primitive".
	stream nextPut: low.
	stream nextPut: high.
	
	"Emit the arguments."
	args do: [ :arg | arg emitToStream: stream ]
]

{ #category : #accessing }
LowcodeInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LowcodeInstruction >> opcode: anObject [
	
	opcode := anObject
]
