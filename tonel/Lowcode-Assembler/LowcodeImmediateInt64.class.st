Class {
	#name : #LowcodeImmediateInt64,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeImmediateInt64 >> elementSize [
	^ 8
]

{ #category : #'instruction encoding' }
LowcodeImmediateInt64 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	stream nextPut: value & 16rFF;
			nextPut: (value >> 8) & 16rFF;
			nextPut: (value >> 16) & 16rFF;
			nextPut: (value >> 24) & 16rFF;
			nextPut: (value >> 32) & 16rFF;
			nextPut: (value >> 40) & 16rFF;
			nextPut: (value >> 48) & 16rFF;
			nextPut: (value >> 56) & 16rFF.
]
