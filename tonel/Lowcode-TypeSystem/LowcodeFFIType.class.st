Class {
	#name : #LowcodeFFIType,
	#superclass : #LowcodeNativeType,
	#instVars : [
		'ffiType'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #construction }
LowcodeFFIType class >> named: aName on: anFFIType [
	^ self new name: aName; ffiType: anFFIType; yourself
]

{ #category : #comparing }
LowcodeFFIType >> = other [
	^ self class == other class and: [ self ffiType = other ffiType ]
]

{ #category : #accessing }
LowcodeFFIType >> alignment [
	^ ffiType typeAlignment
]

{ #category : #emitting }
LowcodeFFIType >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	ffiType emitLowcodeValue: aMethodBuilder selfOffset: offset
]

{ #category : #emitting }
LowcodeFFIType >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	ffiType emitLowcodeValue: aMethodBuilder selfOffset: offset
]

{ #category : #accessing }
LowcodeFFIType >> ffiType [
	^ ffiType
]

{ #category : #accessing }
LowcodeFFIType >> ffiType: anObject [
	ffiType := anObject
]

{ #category : #'read write' }
LowcodeFFIType >> fromStructure: anObject offset: offset [
	^ ffiType readFromInternalStructure: anObject at: offset
]

{ #category : #comparing }
LowcodeFFIType >> hash [
	^ self class hash bitXor: ffiType hash
]

{ #category : #testing }
LowcodeFFIType >> isFloatingPointType [
	^ ffiType isFloatingPointType
]

{ #category : #testing }
LowcodeFFIType >> isIntegerType [
	^ ffiType isIntegerType
]

{ #category : #testing }
LowcodeFFIType >> isNumberType [
	^ ffiType isNumberType
]

{ #category : #accessing }
LowcodeFFIType >> size [
	^ ffiType typeSize
]

{ #category : #'read write' }
LowcodeFFIType >> write: aValue toStructure: anObject offset: offset [
	^ ffiType write: aValue internalStructure: anObject at: offset
]
