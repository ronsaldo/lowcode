Class {
	#name : #LowcodeFunctionType,
	#superclass : #LowcodeType,
	#instVars : [
		'arguments',
		'returnType'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeFunctionType class >> arguments: arguments returnType: returnType [
	^ self new arguments: arguments; returnType: returnType
]

{ #category : #comparing }
LowcodeFunctionType >> = other [
	^ self class == other class and: [ arguments = other arguments and: [ returnType = other returnType ] ]
]

{ #category : #accessing }
LowcodeFunctionType >> arguments [
	^ arguments
]

{ #category : #accessing }
LowcodeFunctionType >> arguments: anObject [
	arguments := anObject
]

{ #category : #comparing }
LowcodeFunctionType >> hash [
	^ (self class hash bitXor: arguments) hash bitXor: returnType hash
]

{ #category : #printing }
LowcodeFunctionType >> printOn: aStream [
	aStream nextPutAll: '#( '.
	arguments doWithIndex: [ :arg :index |
		index > 1 ifTrue: [ aStream nextPutAll: ' , ' ].
		aStream print: arg.
	].

	aStream nextPutAll: ' -> ';
		print: returnType;
		nextPutAll: ' )'.
	
]

{ #category : #accessing }
LowcodeFunctionType >> returnType [
	^ returnType
]

{ #category : #accessing }
LowcodeFunctionType >> returnType: anObject [
	returnType := anObject
]
