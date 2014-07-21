Class {
	#name : #FFIInt8Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt8Type >> accept: visitor [
	^ visitor visitInt8Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt8Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadUInt8FromMemory
]

{ #category : #'lowcode marshalling' }
FFIInt8Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt8ToMemory
]

{ #category : #accessing }
FFIInt8Type >> valueSize [
	^ 1
]
