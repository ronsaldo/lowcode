"
I represent a Lowcode instruction in the OpalCompiler intermediate representation.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	extA:		<Object>
	extB:		<Object>
	opcode:		<Object>


    Implementation Points
"
Class {
	#name : #IRLowcodeInstruction,
	#superclass : #IRInstruction,
	#instVars : [
		'opcode',
		'extendA',
		'extendB',
		'label',
		'literal'
	],
	#category : #'Lowcode-OpalCompiler'
}

{ #category : #visitor }
IRLowcodeInstruction >> accept: aVisitor [
	^ aVisitor visitLowcodeInstruction: self
]

{ #category : #accessing }
IRLowcodeInstruction >> extendA [
	^ extendA
]

{ #category : #accessing }
IRLowcodeInstruction >> extendA: anObject [
	extendA := anObject
]

{ #category : #accessing }
IRLowcodeInstruction >> extendB [
	^ extendB
]

{ #category : #accessing }
IRLowcodeInstruction >> extendB: anObject [
	extendB := anObject
]

{ #category : #testing }
IRLowcodeInstruction >> isLowcodeInstruction [
	^ false
]

{ #category : #accessing }
IRLowcodeInstruction >> label [
	^ label
]

{ #category : #accessing }
IRLowcodeInstruction >> label: anObject [
	label := anObject
]

{ #category : #accessing }
IRLowcodeInstruction >> literal [
	^ literal
]

{ #category : #accessing }
IRLowcodeInstruction >> literal: anObject [
	literal := anObject
]

{ #category : #accessing }
IRLowcodeInstruction >> lowcodeMnemonic [
	^ 'lowcodeSomething'
]

{ #category : #accessing }
IRLowcodeInstruction >> opcode [
	^ opcode
]

{ #category : #accessing }
IRLowcodeInstruction >> opcode: anObject [
	opcode := anObject
]

{ #category : #accessing }
IRLowcodeInstruction >> stackDifference [
	| diff |
	diff := opcode // 1000.
	^ diff >= 16 ifTrue: [ diff - 33 ] ifFalse: [ diff ]
]
