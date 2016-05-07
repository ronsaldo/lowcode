Class {
	#name : #LowcodeType,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'AnyType',
		'BoolType',
		'Float16Type',
		'Float32Type',
		'Float64Type',
		'Int16Type',
		'Int32Type',
		'Int64Type',
		'Int8Type',
		'ObjectType',
		'PrimitiveTypeDictionary',
		'SizeType',
		'UInt16Type',
		'UInt32Type',
		'UInt64Type',
		'UInt8Type'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #accessing }
LowcodeType class >> any [
	^ AnyType
]

{ #category : #accessing }
LowcodeType class >> bool [
	^ BoolType
]

{ #category : #accessing }
LowcodeType class >> double [
	^ Float64Type
]

{ #category : #accessing }
LowcodeType class >> float [
	^ Float32Type
]

{ #category : #accessing }
LowcodeType class >> float32 [
	^ Float32Type
]

{ #category : #accessing }
LowcodeType class >> float64 [
	^ Float64Type
]

{ #category : #construction }
LowcodeType class >> forSymbol: aSymbol atEnvironment: anEnvironment [
	| type |
	PrimitiveTypeDictionary at: aSymbol ifPresent: [ :resolvedType | ^ resolvedType ].
	type := anEnvironment bindingOf: aSymbol.
	type ifNil: [ self error: 'Failed to resolve type named ', type printString ].
	^ type asLowcodeTypeAtEnvironment: anEnvironment
]

{ #category : #'class initialization' }
LowcodeType class >> initialize [
	"
	self initialize
	"
	super initialize.

	AnyType := LowcodeAnyType new.
	ObjectType := LowcodeObjectType new.
	
	BoolType := LowcodeFFIType named: #bool on: FFIBool new.
	
	Int8Type := LowcodeFFIType named: #int8 on: FFIInt8 new.
	Int16Type := LowcodeFFIType named: #int16 on: FFIInt16 new.
	Int32Type := LowcodeFFIType named: #int32 on: FFIInt32 new.
	Int64Type := LowcodeFFIType named: #int64 on: FFIInt64 new.

	UInt8Type := LowcodeFFIType named: #uint8 on: FFIInt8 new.
	UInt16Type := LowcodeFFIType named: #uint16 on: FFIInt16 new.
	UInt32Type := LowcodeFFIType named: #uint32 on: FFIInt32 new.
	UInt64Type := LowcodeFFIType named: #uint64 on: FFIInt64 new.

	SizeType := LowcodeFFIType named: #size on: FFISizeT new.

	Float16Type := LowcodeFFIType named: #float16 on: FFIFloat16 new.
	Float32Type := LowcodeFFIType named: #float32 on: FFIFloat32 new.
	Float64Type := LowcodeFFIType named: #float64 on: FFIFloat64 new.
	
	PrimitiveTypeDictionary := Dictionary new.
	{
		AnyType . ObjectType . BoolType .
		Int8Type . Int16Type . Int32Type . Int64Type .
		UInt8Type . UInt16Type . UInt32Type . UInt64Type .
		SizeType .
		Float16Type . Float32Type . Float64Type .
		
		LowcodeTypeAlias for: UInt8Type named: #char.
		LowcodeTypeAlias for: UInt8Type named: #byte.
		LowcodeTypeAlias for: Int8Type named: #sbyte.
		LowcodeTypeAlias for: Int16Type named: #short.
		LowcodeTypeAlias for: UInt16Type named: #ushort.
		LowcodeTypeAlias for: Int32Type named: #int.
		LowcodeTypeAlias for: UInt32Type named: #uint.
		LowcodeTypeAlias for: Int64Type named: #long.
		LowcodeTypeAlias for: UInt64Type named: #ulong.
		
		LowcodeTypeAlias for: Float32Type named: #float.
		LowcodeTypeAlias for: Float64Type named: #double.
	} do: [ :type | PrimitiveTypeDictionary at: type name put: type ]
	
]

{ #category : #accessing }
LowcodeType class >> int16 [
	^ Int16Type
]

{ #category : #accessing }
LowcodeType class >> int32 [
	^ Int32Type
]

{ #category : #accessing }
LowcodeType class >> int64 [
	^ Int64Type
]

{ #category : #accessing }
LowcodeType class >> int8 [
	^ Int8Type
]

{ #category : #accessing }
LowcodeType class >> object [
	^ ObjectType
]

{ #category : #accessing }
LowcodeType class >> uint16 [
	^ UInt16Type
]

{ #category : #accessing }
LowcodeType class >> uint32 [
	^ UInt32Type
]

{ #category : #accessing }
LowcodeType class >> uint64 [
	^ UInt64Type
]

{ #category : #accessing }
LowcodeType class >> uint8 [
	^ UInt8Type
]

{ #category : #accessing }
LowcodeType >> alignment [
	self subclassResponsibility
]

{ #category : #'type coercion' }
LowcodeType >> arithmeticCoerceWith: otherType [
	| minimalCoercionSize |
	(self isObject or: [ otherType isObject ]) ifTrue: [ ^ self class object ].
	
	(self isNumberType not or: [ otherType isNumberType not ]) ifTrue: [
		self withoutAliases == otherType withoutAliases ifTrue: [ ^ self ].
		^ nil
	].

	"Do we have a floating point argument?"
	minimalCoercionSize := self size max: otherType size.
	(self isFloatingPointType or: [otherType isFloatingPointType]) ifTrue: [
		^ minimalCoercionSize <= 4 ifTrue: [ self class float32 ] ifFalse: [ self class float64 ]
	].

	"Now we know that we only have integer."
	^ minimalCoercionSize <= 4 ifTrue: [ self class int32 ] ifFalse: [ self class int64 ].
]

{ #category : #emitting }
LowcodeType >> emitConversionFromObject: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitConversionToObject: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitDuplicate: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLowcodeStore: aMethodBuilder selfOffset: offset [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	self subclassResponsibility
]

{ #category : #'read write' }
LowcodeType >> fromStructure: anObject offset: offset [
	self subclassResponsibility
]

{ #category : #'type coercion' }
LowcodeType >> hasImplicitConversionTo: otherType [
	self withoutAliases = otherType withoutAliases ifTrue: [ ^ true ].
	otherType isObject ifTrue: [ ^ true ].
	otherType isAny ifTrue: [ ^ true ].
	
	self isNumberType ~= otherType isNumberType ifTrue: [ ^ false ].
	self isNumberType ifTrue: [
		otherType isFloatingPointType ifTrue: [
			self isFloatingPointType ifFalse: [ ^ true ].
		].
	
		^ otherType size >= self size.
	].

	^ false
]

{ #category : #testing }
LowcodeType >> isAny [
	^ false
]

{ #category : #testing }
LowcodeType >> isFloatingPointType [
	^ false
]

{ #category : #testing }
LowcodeType >> isIntegerType [
	^ false
]

{ #category : #testing }
LowcodeType >> isNative [
	^ false
]

{ #category : #testing }
LowcodeType >> isNumberType [
	^ false
]

{ #category : #testing }
LowcodeType >> isObject [
	^ false
]

{ #category : #accessing }
LowcodeType >> name [
	^ name
]

{ #category : #accessing }
LowcodeType >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LowcodeType >> size [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeType >> withoutAliases [
	^ self
]

{ #category : #'read write' }
LowcodeType >> write: aValue toStructure: anObject offset: offset [
	self subclassResponsibility
]
