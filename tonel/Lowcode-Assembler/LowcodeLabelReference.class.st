"
This is a reference to a label. This is an usage of the label as an argument.
"
Class {
	#name : #LowcodeLabelReference,
	#superclass : #LowcodeStreamValue,
	#category : #'Lowcode-Assembler'
}

{ #category : #'as yet unclassified' }
LowcodeLabelReference >> elementSize [
	^ 2
]

{ #category : #'as yet unclassified' }
LowcodeLabelReference >> emitToStream: stream [
	"TODO: Handle endiannes"
	| offset |
	offset := value offset.
	stream nextPut: offset & 16rFF.
	stream nextPut: (offset >> 8) & 16rFF.
]
