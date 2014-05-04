Class {
	#name : #LowcodeStreamValue,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'as yet unclassified' }
LowcodeStreamValue class >> new: aValue [
	^ self basicNew initWithValue: aValue; yourself
]

{ #category : #'instruction encoding' }
LowcodeStreamValue >> elementSize [
	self subclassResponsibility
]

{ #category : #'instruction encoding' }
LowcodeStreamValue >> emitToStream: stream [
	self subclassResponsibility
]

{ #category : #initialize }
LowcodeStreamValue >> initWithValue: aRegisterIdentifier [
	value := aRegisterIdentifier
]

{ #category : #accessing }
LowcodeStreamValue >> value [
	^ value
]
