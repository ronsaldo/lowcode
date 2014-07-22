Class {
	#name : #LoDisValidationStack,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #initialization }
LoDisValidationStack >> initialize [
	value := OrderedCollection new
]

{ #category : #stack }
LoDisValidationStack >> popFloat32 [
	^ self popType: $f
]

{ #category : #stack }
LoDisValidationStack >> popFloat64 [
	^ self popType: $d
]

{ #category : #stack }
LoDisValidationStack >> popInt32 [
	^ self popType: $i
]

{ #category : #stack }
LoDisValidationStack >> popInt64 [
	^ self popType: $l
]

{ #category : #stack }
LoDisValidationStack >> popOop [
	^ self popType: $o
]

{ #category : #stack }
LoDisValidationStack >> popType: type [
	value ifEmpty: [ ^ false ].
	value last ~= type ifTrue: [ ^ false ].
	value removeLast.
	^ true
]

{ #category : #copying }
LoDisValidationStack >> postCopy [
	value := value copy
]

{ #category : #stack }
LoDisValidationStack >> pushFloat32 [
	self pushType: $f
]

{ #category : #stack }
LoDisValidationStack >> pushFloat64 [
	self pushType: $d
]

{ #category : #stack }
LoDisValidationStack >> pushInt32 [
	self pushType: $i
]

{ #category : #stack }
LoDisValidationStack >> pushInt64 [
	self pushType: $l
]

{ #category : #stack }
LoDisValidationStack >> pushOop [
	self pushType: $o
]

{ #category : #stack }
LoDisValidationStack >> pushPointer [
	self pushType: $p
]

{ #category : #stack }
LoDisValidationStack >> pushType: type [
	value add: type.
]

{ #category : #accessing }
LoDisValidationStack >> value [
	| string |
	string := ByteString new: value size.
	value doWithIndex: [ :c :i | string at: i put: c ].
	^ string
]
