"
Lowcode assembler instruction stream element
"
Class {
	#name : #LowcodeStreamElement,
	#superclass : #Object,
	#category : #'Lowcode-Assembler'
}

{ #category : #'instruction encoding' }
LowcodeStreamElement >> computeSizeForOffset: anOffset [
	self subclassResponsibility 
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> elementSize [
	self subclassResponsibility
]

{ #category : #'instruction encoding' }
LowcodeStreamElement >> emitToStream: stream [
	self subclassResponsibility
]
