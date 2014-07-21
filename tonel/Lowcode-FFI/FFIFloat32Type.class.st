Class {
	#name : #FFIFloat32Type,
	#superclass : #FFIFloatType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #visitor }
FFIFloat32Type >> accept: visitor [
	^ visitor visitFloat32Type: self
]

{ #category : #'lowcode marshalling' }
FFIFloat32Type >> lowcode: gen convertToValueFromOop: calloutSpec [
	gen oopToFloat32
]

{ #category : #'lowcode marshalling' }
FFIFloat32Type >> lowcode: gen convertValueToOop: calloutSpec [
	gen float32ToOop 
]

{ #category : #'lowcode marshalling' }
FFIFloat32Type >> lowcode: gen readValueFromMemory: calloutSpec [
	gen loadFloat32FromMemory
]

{ #category : #'lowcode marshalling' }
FFIFloat32Type >> lowcode: gen writeValueToMemory: calloutSpec [
	gen storeFloat32ToMemory
]

{ #category : #accessing }
FFIFloat32Type >> valueSize [
	^ 4
]
