"
A LowcodeTypeTest is a test class for testing the behavior of LowcodeType
"
Class {
	#name : #LowcodeTypeTest,
	#superclass : #TestCase,
	#category : #'Lowcode-TypeSystem-Tests'
}

{ #category : #'as yet unclassified' }
LowcodeTypeTest >> testArithmeticCoercion [ 
	self assert: (LowcodeType int8 arithmeticCoerceWith: LowcodeType int8) equals: LowcodeType int32.
	self assert: (LowcodeType uint8 arithmeticCoerceWith: LowcodeType uint8) equals: LowcodeType int32.
	
	self assert: (LowcodeType int8 arithmeticCoerceWith: LowcodeType float32) equals: LowcodeType float32.
	self assert: (LowcodeType float32 arithmeticCoerceWith: LowcodeType uint8) equals: LowcodeType float32.
	
	self assert: (LowcodeType int8 arithmeticCoerceWith: LowcodeType float64) equals: LowcodeType float64.
	self assert: (LowcodeType float64 arithmeticCoerceWith: LowcodeType uint8) equals: LowcodeType float64.

]

{ #category : #'as yet unclassified' }
LowcodeTypeTest >> testHasImplicitConversionTo [
	self assert: (#int asLowcodeType hasImplicitConversionTo: #int asLowcodeType).
	self assert: (#int asLowcodeType hasImplicitConversionTo: #int32 asLowcodeType).
	self assert: (#int32 asLowcodeType hasImplicitConversionTo: #int asLowcodeType).
	self assert: (#int asLowcodeType hasImplicitConversionTo: #float asLowcodeType).
	self assert: (#int asLowcodeType hasImplicitConversionTo: #long asLowcodeType).
]

{ #category : #tests }
LowcodeTypeTest >> testPrimitiveTypes [ 
	self assert: LowcodeType int8 isNumberType.
	self assert: LowcodeType int8 isIntegerType.
	self deny: LowcodeType int8 isFloatingPointType.
	
	self assert: LowcodeType uint8 isNumberType.
	self assert: LowcodeType uint8 isIntegerType.
	self deny: LowcodeType uint8 isFloatingPointType.

	self assert: LowcodeType int16 isNumberType.
	self assert: LowcodeType int16 isIntegerType.
	self deny: LowcodeType int16 isFloatingPointType.
	
	self assert: LowcodeType uint16 isNumberType.
	self assert: LowcodeType uint16 isIntegerType.
	self deny: LowcodeType uint16 isFloatingPointType.
	
	self assert: LowcodeType int32 isNumberType.
	self assert: LowcodeType int32 isIntegerType.
	self deny: LowcodeType int32 isFloatingPointType.
	
	self assert: LowcodeType uint32 isNumberType.
	self assert: LowcodeType uint32 isIntegerType.
	self deny: LowcodeType uint32 isFloatingPointType.
	
	self assert: LowcodeType int64 isNumberType.
	self assert: LowcodeType int64 isIntegerType.
	self deny: LowcodeType int64 isFloatingPointType.
	
	self assert: LowcodeType uint64 isNumberType.
	self assert: LowcodeType uint64 isIntegerType.
	self deny: LowcodeType uint64 isFloatingPointType.
	
	self assert: LowcodeType float32 isNumberType.
	self deny: LowcodeType float32 isIntegerType.
	self assert: LowcodeType float32 isFloatingPointType.
	
	self assert: LowcodeType float64 isNumberType.
	self deny: LowcodeType float64 isIntegerType.
	self assert: LowcodeType float64 isFloatingPointType.
	
]

{ #category : #tests }
LowcodeTypeTest >> testPrimitiveTypes2 [ 
	self assert: #sbyte asLowcodeType isNumberType.
	self assert: #sbyte asLowcodeType isIntegerType.
	self deny: #sbyte asLowcodeType isFloatingPointType.
	
	self assert: #byte asLowcodeType isNumberType.
	self assert: #byte asLowcodeType isIntegerType.
	self deny: #byte asLowcodeType isFloatingPointType.
	
	self assert: #float asLowcodeType isNumberType.
	self deny: #float asLowcodeType isIntegerType.
	self assert: #float asLowcodeType isFloatingPointType.
	
	self assert: #double asLowcodeType isNumberType.
	self deny: #double asLowcodeType isIntegerType.
	self assert: #double asLowcodeType isFloatingPointType.
	
]
