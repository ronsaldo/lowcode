"
I represent any Smalltalk object.

My subclasses are used to represent boxes of other types, or a class that can be instantiated to produce native data.
"
Class {
	#name : #LowcodeObjectType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #comparing }
LowcodeObjectType >> = other [
	^ self class = other class
]

{ #category : #'type decorators' }
LowcodeObjectType >> array: numberOfElements [
	^ LowcodeType object
]

{ #category : #'type decorators' }
LowcodeObjectType >> classType [
	^ self
]

{ #category : #emitting }
LowcodeObjectType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	"Nothing to do. By default the arguments are objects."
]

{ #category : #emitting }
LowcodeObjectType >> emitConversionFromObject: aMethodBuilder [
	"Nothing to do"
]

{ #category : #emitting }
LowcodeObjectType >> emitConversionToObject: aMethodBuilder [
	"Nothing to do"

]

{ #category : #emitting }
LowcodeObjectType >> emitDuplicate: aMethodBuilder [
	aMethodBuilder pushDup
]

{ #category : #emitting }
LowcodeObjectType >> emitLocalStore: aMethodBuilder valueType: valueType name: localName [
	self assert: valueType isObject.
	aMethodBuilder storeTemp: localName
]

{ #category : #emitting }
LowcodeObjectType >> emitLocalStoreAndPop: aMethodBuilder name: localName [
	aMethodBuilder
		storeTemp: localName;
		popTop
]

{ #category : #emitting }
LowcodeObjectType >> emitLocalValue: aMethodBuilder name: localName [
	aMethodBuilder pushTemp: localName
]

{ #category : #literals }
LowcodeObjectType >> emitLowcode: methodBuilder pushLiteral: literalValue [
	methodBuilder pushLiteral: literalValue
]

{ #category : #emitting }
LowcodeObjectType >> emitPop: aMethodBuilder [
	aMethodBuilder popTop
]

{ #category : #literals }
LowcodeObjectType >> hasLosslessConversionForLiteral: literalValue [
	^ true
]

{ #category : #comparing }
LowcodeObjectType >> hash [
	^ self class hash
]

{ #category : #initialization }
LowcodeObjectType >> initialize [
	super initialize.
	self name: #object.
]

{ #category : #'type decorators' }
LowcodeObjectType >> instanceType [
	^ self
]

{ #category : #template }
LowcodeObjectType >> instantiateTemplate: templateArguments withEnvironment: templateEnvironment [
	^ self
]

{ #category : #testing }
LowcodeObjectType >> isAnyObject [
	^ true
]

{ #category : #testing }
LowcodeObjectType >> isObject [
	^ true
]

{ #category : #'type decorators' }
LowcodeObjectType >> object [
	^ self
]

{ #category : #printing }
LowcodeObjectType >> printOn: aStream [
	aStream print: #object
]
