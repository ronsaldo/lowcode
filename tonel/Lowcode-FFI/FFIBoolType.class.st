Class {
	#name : #FFIBoolType,
	#superclass : #FFIExternalType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIBoolType >> accept: visitor [
	^ visitor visitBoolType: self
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen callArgumentValue: calloutSpec [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen coerceArgumentValue: calloutSpec [
	"Extract the character value"
	gen oopToBoolean32
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen returnValue: calloutSpec [
	gen returnBoolean32AsOop
]
