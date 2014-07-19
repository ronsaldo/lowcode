Class {
	#name : #FFIIntegerType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcode: gen performCallWithValueResult: functionAddress [
	gen performCallInt32: functionAddress
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcodeCallArgumentValue: gen [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcodeCoerceArgumentValue: gen [
	gen oopSmallIntegerToInt32.
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcodeReturnValue: gen [
	gen returnSmallInteger
]
