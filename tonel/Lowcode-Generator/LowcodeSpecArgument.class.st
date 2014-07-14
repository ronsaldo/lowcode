Class {
	#name : #LowcodeSpecArgument,
	#superclass : #Object,
	#instVars : [
		'type',
		'name',
		'description'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecArgument >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecArgument >> description: anObject [
	
	description := anObject
]

{ #category : #accessing }
LowcodeSpecArgument >> encodingCode [
	self isRegister ifTrue: [ ^ 'r' ]. "Register index - 4 bits"
	self isLiteral ifTrue: [ ^ 'l' ]. "Literal index"
	self isInteger ifTrue: [ ^ 'i']. "Integer"
	self isLabel ifTrue: [ ^ 'o']. "Offset"
	self isCondition ifTrue: [ ^ 'c']. "Condition code"
	self error: 'unknown encoding code for argument'
]

{ #category : #accessing }
LowcodeSpecArgument >> isCondition [
	^ self type = 'condition'
]

{ #category : #accessing }
LowcodeSpecArgument >> isInteger [
	^ type = 'int' or: [ type = 'index' ]
]

{ #category : #accessing }
LowcodeSpecArgument >> isLabel [
	^ type = 'label'
]

{ #category : #accessing }
LowcodeSpecArgument >> isLiteral [
	^ (type = 'literal' or: [ type beginsWith: 'jump-table' ]) or: [ type beginsWith: 'arg-list' ]
]

{ #category : #accessing }
LowcodeSpecArgument >> isRegister [
	^ type endsWith: '-register'
]

{ #category : #accessing }
LowcodeSpecArgument >> name [
	^ name
]

{ #category : #accessing }
LowcodeSpecArgument >> name: anObject [
	
	name := anObject
]

{ #category : #'as yet unclassified' }
LowcodeSpecArgument >> printOn: aStream [
	aStream nextPutAll: type , ' ' , name
]

{ #category : #accessing }
LowcodeSpecArgument >> type [
	
	^ type
]

{ #category : #accessing }
LowcodeSpecArgument >> type: anObject [
	
	type := anObject
]
