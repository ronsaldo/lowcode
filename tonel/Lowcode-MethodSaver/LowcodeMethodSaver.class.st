Class {
	#name : #LowcodeMethodSaver,
	#superclass : #LowcodeMethodSerialization,
	#instVars : [
		'out'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #'as yet unclassified' }
LowcodeMethodSaver >> saveMethod: aMethod into: aFileName [
	aFileName asFileReference writeStreamDo: [ :stream |
		stream truncate; binary.
		out := LowcodeMethodSaverBinaryWriter new stream: stream.
		self writeCompiledMethod: aMethod
	]
]

{ #category : #writing }
LowcodeMethodSaver >> writeAdditionalMethodState: aMethodState [
	self writeByteSymbol: aMethodState selector
]

{ #category : #writing }
LowcodeMethodSaver >> writeByteString: aString [
	out putI16: aString size.
	aString do: [ :c | out putI8: c asInteger ] 
]

{ #category : #writing }
LowcodeMethodSaver >> writeByteSymbol: aSymbol [
	self writeByteString: aSymbol
]

{ #category : #writing }
LowcodeMethodSaver >> writeCompiledMethod: aMethod [
	| byteSizes |
	out putI32: aMethod header.
	out putI32: aMethod numLiterals.
	1 to: aMethod numLiterals do: [ :i |
		self writeLiteral: (aMethod literalAt: i)
	].

	byteSizes := aMethod basicSize - aMethod initialPC + 1.
	out putI32: byteSizes.
	aMethod initialPC to: aMethod initialPC + byteSizes - 1 do: [ :i |
		out putI8: (aMethod byteAt: i)
	].
]

{ #category : #writing }
LowcodeMethodSaver >> writeGlobalVariable: aGlobal [
	self
		writeLiteral: aGlobal key;
		writeLiteral: nil
]

{ #category : #writing }
LowcodeMethodSaver >> writeLiteral: aLiteral [
	| literalClassIndex |
	literalClassIndex := LiteralClasses indexOf: aLiteral class.
	literalClassIndex = 0 ifTrue: [
		self error: 'Cannot write literal of class ' , aLiteral class name.
	].

	out putI8: literalClassIndex.
	self perform: (#write , aLiteral class name, ':') asSymbol with: aLiteral
]

{ #category : #writing }
LowcodeMethodSaver >> writeUndefinedObject: anUndefinedObject [
	"Nothing required for nil"
]
