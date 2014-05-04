Class {
	#name : #LowcodeLabel,
	#superclass : #LowcodeStreamElement,
	#instVars : [
		'offset'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeLabel >> computeSizeForOffset: anOffset [
	offset := anOffset.
	^ self elementSize
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
LowcodeLabel >> offset [
	^ offset
]

{ #category : #accessing }
LowcodeLabel >> offset: anObject [
	offset := anObject
]
