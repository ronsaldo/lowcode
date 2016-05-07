Class {
	#name : #LowcodeObjectType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #comparing }
LowcodeObjectType >> = other [
	^ self class = other class
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
LowcodeObjectType >> emitLocalStore: aMethodBuilder name: localName [
	aMethodBuilder storeTemp: localName
]

{ #category : #emitting }
LowcodeObjectType >> emitLocalValue: aMethodBuilder name: localName [
	aMethodBuilder pushTemp: localName
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

{ #category : #testing }
LowcodeObjectType >> isObject [
	^ true
]

{ #category : #printing }
LowcodeObjectType >> printOn: aStream [
	aStream print: #object
]
