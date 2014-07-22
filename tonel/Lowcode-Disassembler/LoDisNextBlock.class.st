Class {
	#name : #LoDisNextBlock,
	#superclass : #LoDisPseudoInstruction,
	#category : #'Lowcode-Disassembler'
}

{ #category : #'instance creation' }
LoDisNextBlock class >> new: nextBlock [
	^ self new jumpBlock: nextBlock
]

{ #category : #testing }
LoDisNextBlock >> isJump [
	^ true
]

{ #category : #printing }
LoDisNextBlock >> printOn: aStream [
	aStream nextPutAll: 'nextBlock ', jumpBlock name
]

{ #category : #validation }
LoDisNextBlock >> validate: stack forMethod: method [
	^ self jumpBlock validate: stack copy
]
