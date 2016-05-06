Extension { #name : #Number }

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeByte [
	^ self asNativeUInt8
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeDouble [
	^ self asNativeFloat64
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeFloat [
	^ self asNativeFloat32
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeFloat32 [
	^ self asFloat
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeFloat64 [
	^ self asFloat
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeInt [
	^ self asNativeInt32
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeInt16 [
	^ self asInteger
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeInt32 [
	^ self asInteger
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeInt64 [
	^ self asInteger
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeInt8 [
	^ self asInteger
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeLong [
	^ self asNativeInt64
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeSByte [
	^ self asNativeInt8
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeShort [
	^ self asNativeInt16
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeUInt16 [
	^ self asInteger bitAnd: 16rffff
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeUInt32 [
	^ self asInteger bitAnd: 16rffffffff
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeUInt64 [
	^ self asInteger bitAnd: 16rffffffffffffffff
]

{ #category : #'*Lowcode-TypeSystem' }
Number >> asNativeUInt8 [
	^ self asInteger bitAnd: 16rff
]
