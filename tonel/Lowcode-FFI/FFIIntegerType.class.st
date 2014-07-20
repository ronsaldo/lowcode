Class {
	#name : #FFIIntegerType,
	#superclass : #FFIPrimitiveType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcode:gen coerceArgumentValue: calloutSpec [
	gen oopSmallIntegerToInt32.
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIIntegerType >> lowcode:gen returnValue: calloutSpec [
	gen returnSmallInteger
]
