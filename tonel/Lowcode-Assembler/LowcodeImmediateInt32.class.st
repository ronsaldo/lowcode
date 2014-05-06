Class {
	#name : #LowcodeImmediateInt32,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeImmediateInt32 >> elementSize [
	^ 4
]

{ #category : #'instruction encoding' }
LowcodeImmediateInt32 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	stream nextPut: value & 16rFF;
			nextPut: (value >> 8) & 16rFF;
			nextPut: (value >> 16) & 16rFF;
			nextPut: (value >> 24) & 16rFF.
]
