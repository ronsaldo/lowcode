Class {
	#name : #FFIInt64Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt64Type >> accept: visitor [
	^ visitor visitInt64Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcode: gen performCallWithValueResult: functionAddress [
	gen performCallInt64: functionAddress value
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcodeCallArgument: gen [
	gen callArgumentInt64
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcodeCallArgumentValue: gen [
	gen callArgumentInt64
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcodeCoerceArgumentValue: gen [
	gen oopToInt64.
]

{ #category : #'lowcode marshalling' }
FFIInt64Type >> lowcodeReturnValue: gen [
	gen returnInt64
]
