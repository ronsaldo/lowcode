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
FFIBoolType >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToBoolean32
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen convertValueToOop: calloutSpec [
	gen boolean32ToOop
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcode: gen performCallWithValueResult: calloutSpec [
	gen performCallInt32: calloutSpec functionAddress
]

{ #category : #accessing }
FFIBoolType >> valueSize [
	^ 1
]
