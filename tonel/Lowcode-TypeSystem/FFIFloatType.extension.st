Extension { #name : #FFIFloatType }

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isFloatingPointType [
	^ true
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isIntegerType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIFloatType >> isNumberType [
	^ true
]
