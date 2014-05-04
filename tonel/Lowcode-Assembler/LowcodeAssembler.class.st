Class {
	#name : #LowcodeAssembler,
	#superclass : #Object,
	#instVars : [
		'streamElements'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #adding }
LowcodeAssembler >> addElement: aLowcodeInstruction [
	streamElements add: aLowcodeInstruction
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode [
	self addElement: (LowcodeInstruction new: opcode)
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode args: args [
	self addElement: (LowcodeInstruction new: opcode args: args)
]

{ #category : #adding }
LowcodeAssembler >> addSistaInstruction: opcode [
	self addElement: (LowcodeSistaInstruction new: opcode)
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> computeSizes [
	| size |
	size := 0.
	streamElements do: [ :el |
		size := size + (el computeSizeForOffset: size)
	].
	^ size
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emit [
	| size |
	size := self computeSizes.
	^ ByteArray new: size streamContents: [ :stream |
		streamElements do: [ :el | el emitToStream: stream ]
	]
]

{ #category : #arguments }
LowcodeAssembler >> immFloat32: aValue [
	^ LowcodeImmediateFloat32 new: aValue asFloat
]

{ #category : #arguments }
LowcodeAssembler >> immFloat64: aValue [
	^ LowcodeImmediateFloat64 new: aValue asFloat
]

{ #category : #arguments }
LowcodeAssembler >> immInt16: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt32: aValue [
	^ LowcodeImmediateInt32 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt64: aValue [
	^ LowcodeImmediateInt64 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt8: aValue [
	^ LowcodeImmediateInt8 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt16: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt32: aValue [
	^ LowcodeImmediateInt32 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt64: aValue [
	^ LowcodeImmediateInt64 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt8: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jmp: destLabel [
	self addInstruction: 346 args: { self labelRef: destLabel }
]

{ #category : #arguments }
LowcodeAssembler >> labelRef: aLabel [
	^ LowcodeLabelReference new: aLabel
]

{ #category : #adding }
LowcodeAssembler >> makeLabel [
	^ LowcodeLabel new.
]

{ #category : #adding }
LowcodeAssembler >> makeLabelHere [
	| label |
	label := self makeLabel.
	self putLabel: label.
	^ label
]

{ #category : #'sista instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> retvm [
	self addInstruction: 352
]
