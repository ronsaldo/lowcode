Class {
	#name : #LowcodeImmediateInt16,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeImmediateInt16 >> elementSize [
	^ 2
]

{ #category : #'instruction encoding' }
LowcodeImmediateInt16 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	stream nextPut: value & 16rFF;
			nextPut: (value >> 8) & 16rFF.
]
