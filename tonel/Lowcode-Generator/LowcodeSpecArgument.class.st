Class {
	#name : #LowcodeSpecArgument,
	#superclass : #Object,
	#instVars : [
		'type',
		'name',
		'description',
		'aliased',
		'allocate'
	],
	#classVars : [
		'RegisterSignature64On32Map',
		'RegisterSignatureMap'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #initialization }
LowcodeSpecArgument class >> initialize [
	RegisterSignatureMap := Dictionary newFromPairs: #(
		"oop Oop"
		oop Integer
		int32 Integer
		int64 Integer
		pointer Integer
		
		float32 Float
		float64 Float
	).
	
	RegisterSignature64On32Map := Dictionary newFromPairs: #(
		"oop Oop"
		oop Integer
		int32 Integer
		int64 #(Integer Integer)
		pointer Integer
		
		float32 Float
		float64 Float
	)
]

{ #category : #accessing }
LowcodeSpecArgument >> aliased [
	^ aliased
]

{ #category : #accessing }
LowcodeSpecArgument >> aliased: aBoolean [
	aliased := aBoolean
]

{ #category : #accessing }
LowcodeSpecArgument >> allocate [
	^ allocate
]

{ #category : #accessing }
LowcodeSpecArgument >> allocate: aBoolean [
	allocate := aBoolean
]

{ #category : #'as yet unclassified' }
LowcodeSpecArgument >> asXMLElement [
	| element |
	element := XMLElement name: type.
	element attributeAt: 'name' put: name.
	aliased ifTrue: [ element attributeAt: 'aliased' put: 'true'. ].
	allocate ifTrue: [ element attributeAt: 'allocate' put: 'true'. ].
	description ifNotEmpty: [ element contentString: description ].
	^ element
]

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
LowcodeSpecArgument >> isOop [
	^ type = 'oop'
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
LowcodeSpecArgument >> registerSignature [
	^ RegisterSignatureMap at: type
]

{ #category : #accessing }
LowcodeSpecArgument >> registerSignature64On32 [
	^ RegisterSignature64On32Map at: type
]

{ #category : #accessing }
LowcodeSpecArgument >> type [
	
	^ type
]

{ #category : #accessing }
LowcodeSpecArgument >> type: anObject [
	
	type := anObject
]
