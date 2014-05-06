Class {
	#name : #LowcodeImmediateFloat32,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeImmediateFloat32 >> elementSize [
	^ 4
]

{ #category : #'instruction encoding' }
LowcodeImmediateFloat32 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	| ivalue |
	ivalue := value asIEEE32BitWord.
	stream nextPut: ivalue & 16rFF;
			nextPut: (ivalue >> 8) & 16rFF;
			nextPut: (ivalue >> 16) & 16rFF;
			nextPut: (ivalue >> 24) & 16rFF.
]
