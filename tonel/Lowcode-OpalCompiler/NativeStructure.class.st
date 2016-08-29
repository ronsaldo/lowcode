"
I represent a native structure.
"
Class {
	#name : #NativeStructure,
	#superclass : #InternalStructure,
	#traits : 'TWithNativeData',
	#classTraits : 'TWithNativeData classTrait',
	#classInstVars : [
		'nativeMethodDictionary'
	],
	#category : #'Lowcode-OpalCompiler-Using'
}

{ #category : #'native methods' }
NativeStructure class >> nativeMethodDictionary [
	nativeMethodDictionary ifNil: [ nativeMethodDictionary := MethodDictionary new ].
	^ nativeMethodDictionary
]

{ #category : #'native methods' }
NativeStructure class >> nativeMethodDictionary: aMethodDictionary [
	nativeMethodDictionary := aMethodDictionary
]
