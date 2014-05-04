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
