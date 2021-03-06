"
I am used to represent type aliases, in a similar way to C typedef.
"
Class {
	#name : #LowcodeTypeAlias,
	#superclass : #LowcodeType,
	#instVars : [
		'aliasedType'
	],
	#category : #'Lowcode-TypeSystem-Types'
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

{ #category : #'reflective operations' }
LowcodeTypeAlias >> doesNotUnderstand: aMessage [
	(aMessage selector beginsWith: #emit) ifTrue: [ 
		^ aMessage sendTo: aliasedType 
	].

	^ super doesNotUnderstand: aMessage
]

{ #category : #emitting }
LowcodeTypeAlias >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	aliasedType emitArgumentTypeCheck: aMethodBuilder name: argumentName
]

{ #category : #emitting }
LowcodeTypeAlias >> emitConversion: methodBuilder toFloatSize: floatSize [
	aliasedType emitConversion: methodBuilder toFloatSize: floatSize
]

{ #category : #emitting }
LowcodeTypeAlias >> emitConversion: methodBuilder toIntSize: floatSize [
	aliasedType emitConversion: methodBuilder toIntSize: floatSize
]

{ #category : #emitting }
LowcodeTypeAlias >> emitConversion: methodBuilder toUIntSize: floatSize [
	aliasedType emitConversion: methodBuilder toUIntSize: floatSize
]

{ #category : #emitting }
LowcodeTypeAlias >> emitConversionFromObject: aMethodBuilder [
	aliasedType emitConversionFromObject: aMethodBuilder

]

{ #category : #emitting }
LowcodeTypeAlias >> emitConversionToObject: aMethodBuilder [
	aliasedType emitConversionToObject: aMethodBuilder

]

{ #category : #emitting }
LowcodeTypeAlias >> emitDuplicate: aMethodBuilder [
	aliasedType emitDuplicate: aMethodBuilder
]

{ #category : #emitting }
LowcodeTypeAlias >> emitFieldPointerFromObject: aMethodBuilder offset: aFieldOffset [
	aliasedType emitFieldPointerFromObject: aMethodBuilder offset: aFieldOffset
]

{ #category : #emitting }
LowcodeTypeAlias >> emitLocalReference: aMethodBuilder name: localName [
	^ aliasedType emitLocalReference: aMethodBuilder name: localName
]

{ #category : #emitting }
LowcodeTypeAlias >> emitLocalStore: aMethodBuilder valueType: valueType  name: localName [
	aliasedType emitLocalStore: aMethodBuilder valueType: valueType  name: localName

]

{ #category : #emitting }
LowcodeTypeAlias >> emitLocalStoreAndPop: aMethodBuilder name: localName [
	aliasedType emitLocalStoreAndPop: aMethodBuilder name: localName

]

{ #category : #emitting }
LowcodeTypeAlias >> emitLocalValue: aMethodBuilder name: localName [
	aliasedType emitLocalValue: aMethodBuilder name: localName

]

{ #category : #literals }
LowcodeTypeAlias >> emitLowcode: methodBuilder pushLiteral: literalValue [
	aliasedType emitLowcode: methodBuilder pushLiteral: literalValue
]

{ #category : #emitting }
LowcodeTypeAlias >> emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType [
	aliasedType emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType

]

{ #category : #emitting }
LowcodeTypeAlias >> emitLowcodeValue: aMethodBuilder selfOffset: selfOffset [
	aliasedType emitLowcodeValue: aMethodBuilder selfOffset: selfOffset
]

{ #category : #emitting }
LowcodeTypeAlias >> emitMemoryStoreAndPop: aMethodBuilder [
	aliasedType emitMemoryStoreAndPop: aMethodBuilder
]

{ #category : #emitting }
LowcodeTypeAlias >> emitMemoryValue: aMethodBuilder [
	aliasedType emitMemoryValue: aMethodBuilder
]

{ #category : #emitting }
LowcodeTypeAlias >> emitPop: aMethodBuilder [
	aliasedType emitPop: aMethodBuilder
]

{ #category : #accessing }
LowcodeTypeAlias >> extraClassDependencies [
	^ aliasedType extraClassDependencies
]

{ #category : #accessing }
LowcodeTypeAlias >> fieldOffset: fieldName [
	^ aliasedType fieldOffset: fieldName
]

{ #category : #accessing }
LowcodeTypeAlias >> fieldReferenceType: fieldName [
	^ aliasedType fieldReferenceType: fieldName
]

{ #category : #accessing }
LowcodeTypeAlias >> fieldType: fieldName [
	^ aliasedType fieldType: fieldName
]

{ #category : #'read write' }
LowcodeTypeAlias >> fromMemory: pointer offset: offset [
	^ aliasedType fromMemory: pointer offset: offset
]

{ #category : #'read write' }
LowcodeTypeAlias >> fromStructure: anObject offset: offset [
	^ aliasedType fromStructure: anObject offset: offset
]

{ #category : #accessing }
LowcodeTypeAlias >> getCompiledMethodForSelector: aSelector [
	^ aliasedType getCompiledMethodForSelector: aSelector
]

{ #category : #literals }
LowcodeTypeAlias >> hasLosslessConversionForLiteral: literalValue [
	^ aliasedType hasLosslessConversionForLiteral: literalValue
]

{ #category : #comparing }
LowcodeTypeAlias >> hash [
	^ self class hash bitXor: aliasedType hash
]

{ #category : #testing }
LowcodeTypeAlias >> isAccessorMessage: aSelector [
	^ aliasedType isAccessorMessage: aSelector
]

{ #category : #testing }
LowcodeTypeAlias >> isBooleanType [
	^ aliasedType isBooleanType
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

{ #category : #'native pointers' }
LowcodeTypeAlias >> nativeNew [
	^ aliasedType nativeNew
]

{ #category : #'native pointers' }
LowcodeTypeAlias >> nativeNew: size [
	^ aliasedType nativeNew: size
]

{ #category : #'native pointers' }
LowcodeTypeAlias >> nativeNewType [
	^ aliasedType nativeNewType
]

{ #category : #'native pointers' }
LowcodeTypeAlias >> nativeNullPointer [
	^ aliasedType nativeNullPointer
]

{ #category : #'native pointers' }
LowcodeTypeAlias >> nativePointer: address [
	^ aliasedType nativePointer: address
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
	^ aliasedType withoutAliases
]

{ #category : #'read write' }
LowcodeTypeAlias >> write: aValue toMemory: anObject offset: offset [
	^ aliasedType write: aValue toMemory: anObject offset: offset
]

{ #category : #'read write' }
LowcodeTypeAlias >> write: aValue toStructure: anObject offset: offset [
	^ aliasedType write: aValue toStructure: anObject offset: offset

]
