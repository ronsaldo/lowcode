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
FFISizeTType >> lowcode: gen performCallWithValueResult: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen performCallInt32: calloutSpec functionAddress ]
		ifFalse: [ gen performCallInt64: calloutSpec functionAddress ]
	
]

{ #category : #'lowcode marshalling' }
FFISizeTType >> lowcode: gen returnValue: calloutSpec [
	FFI pointerSize = 4 ifTrue: [ gen returnUInt32AsOop ]
		ifFalse: [ gen returnUInt64AsOop ]
	
]
