Class {
	#name : #LowcodeImmediateInt8,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeImmediateInt8 >> elementSize [
	^ 1
]

{ #category : #'instruction encoding' }
LowcodeImmediateInt8 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	stream nextPut: value & 16rFF.
]
