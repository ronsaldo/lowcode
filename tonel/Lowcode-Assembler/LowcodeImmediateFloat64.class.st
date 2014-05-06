Class {
	#name : #LowcodeImmediateFloat64,
	#superclass : #LowcodeImmediate,
	#category : #'Lowcode-Assembler'
}

{ #category : #'as yet unclassified' }
LowcodeImmediateFloat64 >> elementSize [
	^ 8
]

{ #category : #'as yet unclassified' }
LowcodeImmediateFloat64 >> emitToStream: stream [
	"TODO: Use the correct endiannes."
	| ivalue |
	ivalue := (value at: 2) | ((value at: 1) << 32).
	stream nextPut: ivalue & 16rFF;
			nextPut: (ivalue >> 8) & 16rFF;
			nextPut: (ivalue >> 16) & 16rFF;
			nextPut: (ivalue >> 24) & 16rFF;
			nextPut: (ivalue >> 32) & 16rFF;
			nextPut: (ivalue >> 40) & 16rFF;
			nextPut: (ivalue >> 48) & 16rFF;
			nextPut: (ivalue >> 56) & 16rFF.
]
