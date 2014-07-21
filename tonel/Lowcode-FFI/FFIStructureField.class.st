Class {
	#name : #FFIStructureField,
	#superclass : #Object,
	#instVars : [
		'type',
		'offset',
		'index'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIStructureField >> index [
	 ^ index
]

{ #category : #'as yet unclassified' }
FFIStructureField >> index: anIndex [
	index := anIndex
]

{ #category : #accessing }
FFIStructureField >> offset [
	^ offset
]

{ #category : #'as yet unclassified' }
FFIStructureField >> offset: anOffset [
	offset := anOffset
]

{ #category : #accessing }
FFIStructureField >> type [
	^ type
]

{ #category : #'as yet unclassified' }
FFIStructureField >> type: aType [
	type := aType
]
