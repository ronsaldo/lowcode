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
	(aSymbol == #SelfType and: [ anEnvironment isClass ]) ifTrue: [
		anEnvironment isMeta ifTrue: [ ^ anEnvironment instanceSide  asLowcodeTypeAtEnvironment: anEnvironment ].
		^ anEnvironment asLowcodeTypeAtEnvironment: anEnvironment
	].
	
	type := anEnvironment bindingOf: aSymbol.
	type ifNil: [ self error: 'Failed to resolve type named ', type printString ].
	^ type value asLowcodeTypeAtEnvironment: anEnvironment
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
	(self isReferenceType or: [ otherType isReferenceType ]) ifTrue: [ 
		^ self withoutReference arithmeticCoerceWith: otherType withoutReference
	].

	(self isObject or: [ otherType isObject ]) ifTrue: [
		self withoutAliases = otherType withoutAliases ifTrue: [ ^ self ].
		^ self class object
	].
	
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

{ #category : #converting }
LowcodeType >> asLowcodeType [
	^ self
]

{ #category : #testing }
LowcodeType >> canBePushedInTheStack [
	^ true
]

{ #category : #'type decorators' }
LowcodeType >> classType [
	^ LowcodeType object
]

{ #category : #emitting }
LowcodeType >> emitArgumentTypeCheck: aMethodBuilder name: argumentName [
	self subclassResponsibility
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
LowcodeType >> emitConversionToObject: aMethodBuilder boxedStructureFieldType: boxedStructureFieldType [
	aMethodBuilder
		lowcodeFirstFieldPointer;
		lowcodePointerAddConstantOffset: boxedStructureFieldType offset.
	self emitLowcodeMemoryValueAsObject: aMethodBuilder.
]

{ #category : #emitting }
LowcodeType >> emitDuplicate: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitFieldPointerFromObject: aMethodBuilder offset: aFieldOffset [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLocalStore: aMethodBuilder valueType: valueType name: localName [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLocalStoreAndPop: aMethodBuilder name: localName [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLocalValue: aMethodBuilder name: localName [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLowcodeMemoryValueAsObject: aMethodBuilder [
	self
		emitMemoryValue: aMethodBuilder;
		emitConversionToObject: aMethodBuilder
]

{ #category : #emitting }
LowcodeType >> emitLowcodeStore: aMethodBuilder selfOffset: offset valueType: valueType [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitLowcodeValue: aMethodBuilder selfOffset: offset [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitMemoryStoreAndPop: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitMemoryStoreAndPop: aMethodBuilder valueType: valueType [
	valueType ~= self ifTrue: [ self error: 'cannot store value.' ].
	^ self emitMemoryStoreAndPop: aMethodBuilder
]

{ #category : #emitting }
LowcodeType >> emitMemoryValue: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #emitting }
LowcodeType >> emitPop: aMethodBuilder [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeType >> fieldOffset: aFieldName [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeType >> fieldReferenceType: fieldName [
	^ self subclassResponsibility
]

{ #category : #accessing }
LowcodeType >> fieldType: fieldName [
	^ nil
]

{ #category : #'read write' }
LowcodeType >> fromStructure: anObject offset: offset [
	self subclassResponsibility
]

{ #category : #'type inference' }
LowcodeType >> getReturnTypeForSelector: aSelector [
	^ self class object
]

{ #category : #emitting }
LowcodeType >> hasDirectStoreFrom: valueType [
	^ self = valueType
]

{ #category : #'type coercion' }
LowcodeType >> hasImplicitConversionTo: otherType [
	self withoutAliases = otherType withoutAliases ifTrue: [ ^ true ].
	otherType isObject ifTrue: [ ^ true ].
	otherType isAny ifTrue: [ ^ true ].

	"Allow de referencing."
	(self isReferenceType and: [ otherType isReferenceType not ]) ifTrue: [ ^ self referenced hasImplicitConversionTo: otherType ].
		
	self isNumberType ~= otherType isNumberType ifTrue: [ ^ false ].
	self isNumberType ifTrue: [
		otherType isFloatingPointType ifTrue: [
			self isFloatingPointType ifFalse: [ ^ true ].
		].
	
		^ otherType size >= self size.
	].

	"Allow converting boxed structures into unboxed structures."
	(self isObjectReference and: [ otherType withoutAliases = self referenced withoutAliases ]) ifTrue: [ ^ true ].
	
	^ false
]

{ #category : #template }
LowcodeType >> instantiateTemplate: templateArguments [
	^ self instantiateTemplate: templateArguments withEnvironment: Dictionary new
]

{ #category : #template }
LowcodeType >> instantiateTemplate: templateArguments withEnvironment: templateEnvironment [
	^ (self matchesType: templateArguments withEnvironment: templateEnvironment) ifTrue: [ templateArguments ] ifFalse: [ ^ nil ]
]

{ #category : #template }
LowcodeType >> instantiateTemplateWithEnvironment: templateEnvironment [
	^ self
]

{ #category : #testing }
LowcodeType >> isAccessorMessage: aSelector [
	^ false
]

{ #category : #testing }
LowcodeType >> isAny [
	^ false
]

{ #category : #testing }
LowcodeType >> isAnyObject [
	^ false
]

{ #category : #testing }
LowcodeType >> isBooleanType [
	^ false
]

{ #category : #testing }
LowcodeType >> isBoxedStructureReferenceType [
	^ false
]

{ #category : #testing }
LowcodeType >> isClassType [
	^ false
]

{ #category : #testing }
LowcodeType >> isFloatingPointType [
	^ false
]

{ #category : #testing }
LowcodeType >> isFunctionType [
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

{ #category : #testing }
LowcodeType >> isObjectReference [
	^ false
]

{ #category : #testing }
LowcodeType >> isPlaceHolderType [
	^ false
]

{ #category : #testing }
LowcodeType >> isPointerType [
	^ false
]

{ #category : #testing }
LowcodeType >> isReferenceType [
	^ false
]

{ #category : #testing }
LowcodeType >> isStructureType [
	^ false
]

{ #category : #template }
LowcodeType >> matchesType: templateArgument withEnvironment: templateEnvironment [
	^ self withoutAliases = templateArgument withoutAliases
]

{ #category : #accessing }
LowcodeType >> name [
	^ name
]

{ #category : #accessing }
LowcodeType >> name: anObject [
	name := anObject
]

{ #category : #'type decorators' }
LowcodeType >> object [
	^ LowcodeType object
]

{ #category : #'type decorators' }
LowcodeType >> pointer [
	^ LowcodePointerType pointed: self.
]

{ #category : #'type decorators' }
LowcodeType >> ref [
	^ LowcodeReferenceType referenced: self.
]

{ #category : #accessing }
LowcodeType >> size [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeType >> withoutAliases [
	^ self
]

{ #category : #'type decorators' }
LowcodeType >> withoutReference [
	^ self
]

{ #category : #'read write' }
LowcodeType >> write: aValue toStructure: anObject offset: offset [
	self subclassResponsibility
]
