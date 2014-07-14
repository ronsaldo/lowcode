"
This represents a Lowcode instructions that has to be assembled.
"
Class {
	#name : #LowcodeInstruction,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'opcode',
		'extendA',
		'extendB'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode [
	^ self new: opcode args: #()
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode conditionCode: aConditionCode label: aLabel [
	^ self new opcode: opcode; conditionCode: aConditionCode; label: aLabel
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode label: aLabel [
	^ self new opcode: opcode; label: aLabel
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> computeSizeForOffset: anOffset [
	^ self elementSize
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> elementSize [
	| size |
	size := 3.
	extendA ifNotNil: [ size  := size + (self bytesFor: extendA) * 2 ].
	extendB ifNotNil: [ size  := size + (self bytesFor: extendB) * 2 ].
	^ size
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> emitToStream: stream [
	| low high |
	
	"Emit the extension arguments"
	extendA ifNotNil: [ self emitExtendA: extendA toStream: stream ].
	extendB ifNotNil: [ self emitExtendB: extendB toStream: stream ].
	
	"Emit the opcode."
	low := opcode & 16rFF.
	high := ((opcode & 16rFF00) >> 8) | 16r80.
	stream nextPut: 248. "Sista inline primitive".
	stream nextPut: low.
	stream nextPut: high.

]

{ #category : #accessing }
LowcodeInstruction >> extendA [
	^ extendA
]

{ #category : #accessing }
LowcodeInstruction >> extendA: anInteger [
	extendA := anInteger
]

{ #category : #accessing }
LowcodeInstruction >> extendB [
	^ extendB
]

{ #category : #accessing }
LowcodeInstruction >> extendB: anInteger [
	extendB := anInteger
]

{ #category : #accessing }
LowcodeInstruction >> label: label [
	extendA := label index
]

{ #category : #accessing }
LowcodeInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LowcodeInstruction >> opcode: anObject [
	
	opcode := anObject
]
