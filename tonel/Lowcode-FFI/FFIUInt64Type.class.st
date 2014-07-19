Class {
	#name : #FFIUInt64Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt64Type >> accept: visitor [
	^ visitor visitUInt64Type: self
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcode: gen performCallWithValueResult: functionAddress [
	gen performCallInt64: functionAddress value
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcodeCallArgumentValue: gen [
	gen callArgumentInt64
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcodeCoerceArgumentValue: gen [
	gen oopToUInt64.
]

{ #category : #'lowcode marshalling' }
FFIUInt64Type >> lowcodeReturnValue: gen [
	gen returnUInt64
]
