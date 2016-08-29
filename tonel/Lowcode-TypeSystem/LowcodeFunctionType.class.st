"
I represent a function type. I am used to provide function signatures and to represent pointers to functions.
"
Class {
	#name : #LowcodeFunctionType,
	#superclass : #LowcodeType,
	#instVars : [
		'arguments',
		'returnType'
	],
	#category : #'Lowcode-TypeSystem-Types'
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

{ #category : #template }
LowcodeFunctionType >> instantiateTemplate: templateArguments withEnvironment: templateEnvironment [
	| instantiatedArgument newArgumentTypes newReturnType |
	templateArguments isArray ifTrue: [
		newArgumentTypes := arguments collectWithIndex: [ :arg :index |
			instantiatedArgument := arg instantiateTemplate: (templateArguments at: index) withEnvironment: templateEnvironment.
 			instantiatedArgument ifNil: [ ^ nil ].
			instantiatedArgument
		].
		newReturnType := returnType instantiateTemplateWithEnvironment: templateEnvironment.
		newReturnType ifNil: [ ^ nil ].
		^ LowcodeFunctionType arguments: newArgumentTypes asArray returnType: newReturnType
	].

	^ super instantiateTemplate: templateArguments withEnvironment: templateEnvironment

]

{ #category : #template }
LowcodeFunctionType >> instantiateTemplateWithEnvironment: templateEnvironment [
	| instantiatedArgument newArgumentTypes newReturnType |
	newArgumentTypes := arguments collect: [ :arg |
			instantiatedArgument := arg instantiateTemplateWithEnvironment: templateEnvironment.
 			instantiatedArgument ifNil: [ ^ nil ].
			instantiatedArgument
	].
	newReturnType := self instantiateTemplateWithEnvironment: templateEnvironment.
	newReturnType ifNil: [ ^ nil ].
	LowcodeFunctionType arguments: newArgumentTypes asArray returnType: newReturnType

]

{ #category : #testing }
LowcodeFunctionType >> isFunctionType [
	^ true
]

{ #category : #template }
LowcodeFunctionType >> matchesType: templateArgument withEnvironment: templateEnvironment [
	| argResult |
	templateArgument isFunctionType ifFalse: [ ^ false ].
	arguments size ~= templateArgument arguments size ifTrue: [ ^ false].
	
	1 to: arguments size do: [ :i |
		argResult := (arguments at: i) matchesType: (templateArgument arguments at: i) withEnvironment: templateEnvironment.
		argResult ifFalse: [ ^ false ]
	].

	^ returnType matchesType: templateArgument returnType withEnvironment: templateEnvironment

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
