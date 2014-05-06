"
This is used to identify a Lowcode register.
"
Class {
	#name : #LowcodeRegisterIdentifier,
	#superclass : #LowcodeStreamValue,
	#instVars : [
		'type'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'instance creation' }
LowcodeRegisterIdentifier class >> new: registerIdentifier type: registerType [
	^ self basicNew initWithValue: registerIdentifier type: registerType; yourself
]

{ #category : #'instruction encoding' }
LowcodeRegisterIdentifier >> elementSize [
	^ 1
]

{ #category : #'instruction encoding' }
LowcodeRegisterIdentifier >> emitToStream: stream [
	stream nextPut: value.
]

{ #category : #initialize }
LowcodeRegisterIdentifier >> initWithValue: aRegisterIdentifier type: aTypeIdentifier [
	self initWithValue: aRegisterIdentifier.
	type := aTypeIdentifier
]

{ #category : #accessing }
LowcodeRegisterIdentifier >> type [
	^ type
]
