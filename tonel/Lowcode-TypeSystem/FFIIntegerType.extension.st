Extension { #name : #FFIIntegerType }

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isFloatingPointType [
	^ false
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isIntegerType [
	^ true
]

{ #category : #'*Lowcode-TypeSystem' }
FFIIntegerType >> isNumberType [
	^ true
]
