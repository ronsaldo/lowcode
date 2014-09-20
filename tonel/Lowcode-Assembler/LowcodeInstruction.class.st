"
This represents a Lowcode instructions that has to be assembled.
"
Class {
	#name : #LowcodeInstruction,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'opcode',
		'extendA',
		'extendB',
		'destLabel',
		'nextOffset'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode [
	^ self new opcode: opcode
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode conditionCode: aConditionCode label: aLabel [
	^ self new opcode: opcode; conditionCode: aConditionCode; label: aLabel
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode extendA: extendA [
	^ self new opcode: opcode; extendA: extendA; yourself
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode extendA: extendA extendB: extendB [
	^ self new opcode: opcode; extendA: extendA; extendB: extendB; yourself
]

{ #category : #'instance creation' }
LowcodeInstruction class >> new: opcode label: aLabel [
	^ self new opcode: opcode; label: aLabel
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> computeSizeForOffset: anOffset [
	| size |
	size := self elementSize.
	nextOffset := size + anOffset.
	^ size
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> elementSize [
	| size |
	size := 3.
	destLabel ifNotNil: [ size := size + (self labelSize * 2) ].
	extendA ifNotNil: [ size  := size + ((self bytesFor: extendA) * 2) ].
	extendB ifNotNil: [ size  := size + ((self bytesFor: extendB) * 2) ].
	^ size
]

{ #category : #'instruction encoding' }
LowcodeInstruction >> emitToStream: stream [
	| low high |
	
	"Emit the extension arguments"
	destLabel ifNotNil: [ self emitExtendLabel: destLabel offset - nextOffset toStream: stream].
	extendA ifNotNil: [ self emitExtendA: extendA toStream: stream ].
	extendB ifNotNil: [ self emitExtendB: extendB toStream: stream ].
	
	"Emit the opcode."
	low := opcode bitAnd: 16rFF.
	high := ((opcode bitAnd: 16rFF00) >> 8) bitOr: 16r80.
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
	destLabel := label.
]

{ #category : #accessing }
LowcodeInstruction >> opcode [
	
	^ opcode
]

{ #category : #accessing }
LowcodeInstruction >> opcode: anObject [
	
	opcode := anObject
]

{ #category : #'as yet unclassified' }
LowcodeInstruction >> printOn: aStream [
	nextOffset ifNotNil: [
		aStream nextPutAll: '[' , (nextOffset  - self elementSize) hex , '] '
	].

	aStream nextPutAll: (self lowcodeMnemonicFor: opcode).
	extendA ifNotNil: [ aStream nextPutAll: ' ' , extendA printString ].
	extendB ifNotNil: [ aStream nextPutAll: ' ' , extendB printString ].
	destLabel ifNotNil: [ aStream nextPutAll: ' ' , destLabel offset printString ].
	aStream cr
]
