"
The FFISizeTType represents the marshalling required for a C size_t type.

The size_t is defined as the type of values returned by the sizeof() operator. This type usually has the same size of pointers, which is used by this marshaller.

This must be revised, If this is required to work in some ancient platforms such as DOS or an 8-bit microcontroller.

"
Class {
	#name : #FFISizeTType,
	#superclass : #FFIIntegerType,
	#category : #'Lowcode-FFI-Types'
}

{ #category : #testing }
FFISizeTType >> isPlatformDependent [
	^ true
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen callArgumentValue: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen callArgumentInt32 ]
		ifFalse: [ gen callArgumentInt64 ]
	
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen coerceArgumentValue: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen oopToUInt32 ]
		ifFalse: [ gen oopToUInt64 ]
	
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen convertToValueFromOop: calloutSpec [
	FFI pointerSize == 4 ifTrue: [ gen oopToUInt32 ]
		ifFalse: [ gen oopToUInt64 ]
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen convertValueToOop: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen uint32ToOop ]
		ifFalse: [ gen uint64ToOop ]
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen performCallWithValueResult: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen performCallInt32: calloutSpec functionAddress ]
		ifFalse: [ gen performCallInt64: calloutSpec functionAddress ]
	
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen readValueFromMemory: calloutSpec [
	FFI pointerSize == 4 ifTrue: [ gen loadUInt32FromMemory ]
		ifFalse: [ gen loadUInt64FromMemory ]
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen returnValue: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen returnUInt32AsOop ]
		ifFalse: [ gen returnUInt64AsOop ]
	
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen writeValueToMemory: calloutSpec [
	FFI pointerSize == 4 ifTrue: [ gen storeInt32ToMemory ]
		ifFalse: [ gen storeInt64ToMemory ]
]

{ #category : #accessing }
FFISizeTType >> valueSize [
	^ FFI pointerSize
]
