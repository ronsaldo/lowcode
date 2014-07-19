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
FFIBoolType >> lowcode: gen performCallWithValueResult: functionAddress [
	gen performCallInt32: functionAddress
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcodeCallArgumentValue: gen [
	gen callArgumentInt32
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcodeCoerceArgumentValue: gen [
	"Extract the character value"
	gen oopToBoolean32
]

{ #category : #'lowcode marshalling' }
FFIBoolType >> lowcodeReturnValue: gen [
	gen returnBoolean32
]
