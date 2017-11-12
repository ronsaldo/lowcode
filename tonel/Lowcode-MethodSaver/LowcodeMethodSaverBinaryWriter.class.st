Class {
	#name : #LowcodeMethodSaverBinaryWriter,
	#superclass : #Object,
	#instVars : [
		'out'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #accessing }
LowcodeMethodSaverBinaryWriter >> nextPutAll: aByteArray [
	out nextPutAll: aByteArray
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryWriter >> putI16: anInteger [
	out
		nextPut: anInteger & 16rff;
		nextPut: (anInteger >> 8) & 16rff
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryWriter >> putI32: anInteger [
	out
		nextPut: anInteger & 16rff;
		nextPut: (anInteger >> 8) & 16rff;
		nextPut: (anInteger >> 16) & 16rff;
		nextPut: (anInteger >> 24) & 16rff
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryWriter >> putI8: anInteger [
	out nextPut: anInteger & 16rff
]

{ #category : #accessing }
LowcodeMethodSaverBinaryWriter >> stream: aStream [
	out := aStream
]
