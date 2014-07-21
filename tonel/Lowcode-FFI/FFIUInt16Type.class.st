Class {
	#name : #FFIUInt16Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIUInt16Type >> accept: visitor [
	^ visitor visitUInt16Type: self
]

{ #category : #'lowcode marshalling' }
FFIUInt16Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadUInt16FromMemory 
]

{ #category : #'lowcode marshalling' }
FFIUInt16Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt16ToMemory
]

{ #category : #accessing }
FFIUInt16Type >> valueSize [
	^ 2
]
