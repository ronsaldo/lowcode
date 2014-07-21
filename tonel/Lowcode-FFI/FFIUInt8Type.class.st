Class {
	#name : #FFIUInt8Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt8Type >> accept: visitor [
	^ visitor visitUInt8Type: self
]

{ #category : #'lowcode marshalling' }
FFIUInt8Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadUInt8FromMemory 
]

{ #category : #'lowcode marshalling' }
FFIUInt8Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt8ToMemory
]

{ #category : #accessing }
FFIUInt8Type >> valueSize [
	^ 1
]
