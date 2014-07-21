Class {
	#name : #FFIInt16Type,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIInt16Type >> accept: visitor [
	^ visitor visitInt16Type: self
]

{ #category : #'lowcode marshalling' }
FFIInt16Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadInt16FromMemory
]

{ #category : #'lowcode marshalling' }
FFIInt16Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeInt16ToMemory
]

{ #category : #accessing }
FFIInt16Type >> valueSize [
	^ 2
]
