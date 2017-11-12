Class {
	#name : #LowcodeMethodLoader,
	#superclass : #LowcodeMethodSerialization,
	#instVars : [
		'in'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #'instance creation' }
LowcodeMethodLoader class >> fromFileNamed: aFileName [
	^ self new fromFileNamed: aFileName
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> fromFileNamed: aFileName [
	aFileName asFileReference readStreamDo: [ :stream |
		stream binary.
		in := LowcodeMethodSaverBinaryReader new stream: stream.
		^ self readCompiledMethod
	]
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readAdditionalMethodState [
	^ self readByteSymbol
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readByteString [
	| size result |
	size := in nextU16.
	result := ByteString new: size.
	1 to: size do: [ :i |
		result at: i put: in nextU8 asCharacter
	].
	^ result
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readByteSymbol [
	^ self readByteString asSymbol
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readCompiledMethod [
	| header literalCount literals bytesSize bytes method baseIndex |
	header := in nextI32.
	literalCount := in nextU32.
	
	literals := (1 to: literalCount) collect: [ :i | self readLiteral ].
	bytesSize := in nextU32.
	bytes := in next: bytesSize.
	
	method := CompiledMethod newMethod: bytesSize header: header.
	literals doWithIndex: [ :lit :index |
		method literalAt: index put: lit
	].

	baseIndex := method initialPC.
	1 to: bytesSize do: [ :i |
		method byteAt: (i + baseIndex - 1) put: (bytes at: i)
	].
	
	^ method
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readGlobalVariable [
	^ GlobalVariable key: (self readLiteral) value: (self readLiteral)
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readLiteral [
	| classIndex literalClass |
	classIndex := in nextU8.
	literalClass := LiteralClasses at: classIndex.
	^ self perform: ('read' , literalClass name) asSymbol
]

{ #category : #'instance creation' }
LowcodeMethodLoader >> readUndefinedObject [
	^ nil
]
