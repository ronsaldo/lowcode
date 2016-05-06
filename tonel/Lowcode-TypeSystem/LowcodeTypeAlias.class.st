Class {
	#name : #LowcodeTypeAlias,
	#superclass : #LowcodeType,
	#instVars : [
		'aliasedType'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeTypeAlias class >> for: aLowcodeType named: aName [
	^ self new aliasedType: aLowcodeType; name: aName
]

{ #category : #comparing }
LowcodeTypeAlias >> = other [
	^ self class = other class and: [ aliasedType = other aliasedType ]
]

{ #category : #accessing }
LowcodeTypeAlias >> aliasedType [
	^ aliasedType
]

{ #category : #accessing }
LowcodeTypeAlias >> aliasedType: anObject [
	aliasedType := anObject
]

{ #category : #accessing }
LowcodeTypeAlias >> alignment [
	^ aliasedType alignment
]

{ #category : #emitting }
LowcodeTypeAlias >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	aliasedType emitLowcodeStore: aMethodBuilder selfOffset: offset
]

{ #category : #emitting }
LowcodeTypeAlias >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	aliasedType emitLowcodeValue: aMethodBuilder selfOffset: offset
]

{ #category : #'read write' }
LowcodeTypeAlias >> fromStructure: anObject offset: offset [
	^ aliasedType fromStructure: anObject offset: offset
]

{ #category : #comparing }
LowcodeTypeAlias >> hash [
	^ self class hash bitXor: aliasedType hash
]

{ #category : #testing }
LowcodeTypeAlias >> isFloatingPointType [
	^ aliasedType isFloatingPointType
]

{ #category : #testing }
LowcodeTypeAlias >> isIntegerType [
	^ aliasedType isIntegerType
]

{ #category : #testing }
LowcodeTypeAlias >> isNumberType [
	^ aliasedType isNumberType
]

{ #category : #printing }
LowcodeTypeAlias >> printOn: aStream [
	aStream print: name
]

{ #category : #accessing }
LowcodeTypeAlias >> size [
	^ aliasedType size
]

{ #category : #accessing }
LowcodeTypeAlias >> withoutAliases [
	^ aliasedType
]

{ #category : #'read write' }
LowcodeTypeAlias >> write: aValue toStructure: anObject offset: offset [
	^ aliasedType write: aValue toStructure: anObject offset: offset

]
