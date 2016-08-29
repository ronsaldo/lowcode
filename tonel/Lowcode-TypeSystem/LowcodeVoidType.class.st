"
I represent a void type.
"
Class {
	#name : #LowcodeVoidType,
	#superclass : #LowcodeOpaqueType,
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #initialization }
LowcodeVoidType >> initialize [
	super initialize.
	self name: #void.
]

{ #category : #testing }
LowcodeVoidType >> isVoidType [
	^ true
]

{ #category : #printing }
LowcodeVoidType >> printOn: aStream [
	aStream print: #void
]
