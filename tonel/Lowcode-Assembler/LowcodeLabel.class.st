"
This represents a label inside a Lowcode instruction stream. His offset must be computed in a first pass in the whole assembler instruction stream.
"
Class {
	#name : #LowcodeLabel,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'offset',
		'name'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #accessing }
LowcodeLabel >> asLiteral [
	^ offset
]

{ #category : #'instruction encoding' }
LowcodeLabel >> computeSizeForOffset: anOffset [
	offset := anOffset.
	^ self elementSize
]

{ #category : #'as yet unclassified' }
LowcodeLabel >> dumpTo: aStream startPC: startPC [
	self printOn: aStream

]

{ #category : #'instruction encoding' }
LowcodeLabel >> elementSize [
	^ 0
]

{ #category : #'instruction encoding' }
LowcodeLabel >> emitToStream: stream [
	"Do nothing here."
]

{ #category : #accessing }
LowcodeLabel >> name [
	^ name
]

{ #category : #accessing }
LowcodeLabel >> name: aString [
	name := aString
]

{ #category : #accessing }
LowcodeLabel >> offset [
	^ offset
]

{ #category : #accessing }
LowcodeLabel >> offset: anObject [
	offset := anObject
]

{ #category : #accessing }
LowcodeLabel >> printOn: aStream [
	aStream nextPutAll: name ,  ':'
]

{ #category : #accessing }
LowcodeLabel >> value [
	^ offset
]
