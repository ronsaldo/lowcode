"
I am the base class of types that are passed by value.
"
Class {
	#name : #LowcodeValueType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #testing }
LowcodeValueType >> isValueType [
	^ true
]

{ #category : #'native pointers' }
LowcodeValueType >> nativeNew [
	^ self nativeNew: 1
]

{ #category : #'native pointers' }
LowcodeValueType >> nativeNew: arraySize [
	^ NativePointerBox type: self pointer: (ExternalAddress allocate: (arraySize * self size max: 1))
]

{ #category : #'native pointers' }
LowcodeValueType >> nativeNewType [
	^ self pointer
]

{ #category : #'native pointers' }
LowcodeValueType >> nativeNullPointer [
	^ NativePointerBox new type: self.
]

{ #category : #'native pointers' }
LowcodeValueType >> nativePointer: address [
	^ address asNativePointerBoxWithType: self
]
