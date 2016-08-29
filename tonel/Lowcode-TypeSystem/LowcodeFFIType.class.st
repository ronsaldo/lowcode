"
I am a native type that reuses the code present in the FFI types such as FFIUInt32.
"
Class {
	#name : #LowcodeFFIType,
	#superclass : #LowcodeNativeType,
	#instVars : [
		'ffiType'
	],
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #construction }
LowcodeFFIType class >> named: aName on: anFFIType [
	^ self new name: aName; ffiType: anFFIType; yourself
]

{ #category : #comparing }
LowcodeFFIType >> = other [
	^ self class == other class and: [ self ffiType class = other ffiType class ]
]

{ #category : #accessing }
LowcodeFFIType >> alignment [
	^ ffiType typeAlignment
]

{ #category : #emitting }
LowcodeFFIType >> emitAdd: aMethodBuilder [
	ffiType emitLowcodeAdd: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	ffiType emitArgumentTypeCheck: aMethodBuilder name: argumentName
]

{ #category : #emitting }
LowcodeFFIType >> emitBitInvert: aMethodBuilder [
	ffiType emitLowcodeBitInvert: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitConversion: methodBuilder toFloatSize: floatSize [
	ffiType emitLowcode: methodBuilder toFloatSize: floatSize
]

{ #category : #emitting }
LowcodeFFIType >> emitConversion: methodBuilder toIntSize: floatSize [
	ffiType emitLowcode: methodBuilder toIntSize: floatSize
]

{ #category : #emitting }
LowcodeFFIType >> emitConversion: methodBuilder toUIntSize: floatSize [
	ffiType emitLowcode: methodBuilder toUIntSize: floatSize
]

{ #category : #emitting }
LowcodeFFIType >> emitConversionFromObject: aMethodBuilder [
	ffiType emitLowcodeConvertFromObject: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitConversionToObject: aMethodBuilder [
	ffiType emitLowcodeConvertToObject: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitDivide: aMethodBuilder [
	ffiType emitLowcodeDivide: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitDuplicate: aMethodBuilder [
	ffiType emitLowcodeDuplicate: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitEquals: aMethodBuilder [
	ffiType emitLowcodeEquals: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitGreaterEqualThan: aMethodBuilder [
	ffiType emitLowcodeGreaterEqualThan: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitGreaterThan: aMethodBuilder [
	ffiType emitLowcodeGreaterThan: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitLessEqualThan: aMethodBuilder [
	ffiType emitLowcodeLessEqualThan: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitLessThan: aMethodBuilder [
	ffiType emitLowcodeLessThan: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitLocalReference: aMethodBuilder name: localName [
	aMethodBuilder lowcodeLoadLocalAddress: localName
]

{ #category : #emitting }
LowcodeFFIType >> emitLocalStore: aMethodBuilder valueType: valueType name: localName [
	ffiType emitLowcodeLocalStore: aMethodBuilder name: localName
]

{ #category : #emitting }
LowcodeFFIType >> emitLocalValue: aMethodBuilder name: localName [
	ffiType emitLowcodeLocalValue: aMethodBuilder name: localName
]

{ #category : #emitting }
LowcodeFFIType >> emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType [
	self assert: valueType withoutAliases = self.
	ffiType emitLowcodeStore: aMethodBuilder selfOffset: offset
]

{ #category : #emitting }
LowcodeFFIType >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	ffiType emitLowcodeValue: aMethodBuilder selfOffset: offset
]

{ #category : #emitting }
LowcodeFFIType >> emitMemoryStoreAndPop: aMethodBuilder [
	ffiType emitLowcodeMemoryStoreAndPop: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitMemoryValue: aMethodBuilder [
	ffiType emitLowcodeMemoryValue: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitMultiply: aMethodBuilder [
	ffiType emitLowcodeMultiply: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitNegated: aMethodBuilder [
	ffiType emitLowcodeNegated: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitNot: aMethodBuilder [
	ffiType emitLowcodeNot: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitNotEquals: aMethodBuilder [
	ffiType emitLowcodeNotEquals: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitPop: aMethodBuilder [
	ffiType emitLowcodePop: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitRem: aMethodBuilder [
	ffiType emitLowcodeRem: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitSqrt: aMethodBuilder [
	ffiType emitLowcodeSqrt: aMethodBuilder
]

{ #category : #emitting }
LowcodeFFIType >> emitSubtract: aMethodBuilder [
	ffiType emitLowcodeSubtract: aMethodBuilder
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
LowcodeFFIType >> fromMemory: pointer offset: offset [
	^ ffiType basicHandle: pointer at: offset + 1
]

{ #category : #'read write' }
LowcodeFFIType >> fromStructure: anObject offset: offset [
	^ ffiType readFromInternalStructure: anObject at: offset
]

{ #category : #comparing }
LowcodeFFIType >> hash [
	^ self class hash bitXor: ffiType class hash
]

{ #category : #template }
LowcodeFFIType >> instantiateTemplate: templateArguments withEnvironment: templateEnvironment [
	^ self
]

{ #category : #testing }
LowcodeFFIType >> isBooleanType [
	^ ffiType isBooleanType
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
LowcodeFFIType >> write: aValue toMemory: pointer offset: offset [
	^ ffiType basicHandle: pointer at: offset + 1 put: aValue
]

{ #category : #'read write' }
LowcodeFFIType >> write: aValue toStructure: anObject offset: offset [
	^ ffiType write: aValue internalStructure: anObject at: offset
]
