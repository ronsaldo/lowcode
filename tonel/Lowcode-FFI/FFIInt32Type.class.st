Class {
	#name : #FFIInt32Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt32Type >> accept: visitor [
	^ visitor visitInt32Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcodeCoerceArgumentValue: gen [
	gen oopToInt32

]

{ #category : #'lowcode marshalling' }
FFIInt32Type >> lowcodeReturnValue: gen [
	gen returnInt32
]
