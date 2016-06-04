Class {
	#name : #NativeStructure,
	#superclass : #InternalStructure,
	#traits : 'TWithNativeData',
	#classTraits : 'TWithNativeData classTrait',
	#classInstVars : [
		'nativeMethodDict'
	],
	#category : #'Lowcode-OpalCompiler-Using'
}

{ #category : #accessing }
NativeStructure class >> nativeMethodDict [
	^ nativeMethodDict
]

{ #category : #accessing }
NativeStructure class >> nativeMethodDict: aMethodDictionary [
	nativeMethodDict := aMethodDictionary
]
