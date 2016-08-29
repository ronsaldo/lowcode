"
I am a structured with a native array inside.
"
Class {
	#name : #LowcodeVector3FArrayTestClass,
	#superclass : #InternalStructure,
	#type : #StructureLayout,
	#instVars : [
		'#array &=> #(#float array: 20)'
	],
	#category : #'Lowcode-TypeSystemTests'
}

{ #category : #'as yet unclassified' }
LowcodeVector3FArrayTestClass >> array [
	^ array
]

{ #category : #'as yet unclassified' }
LowcodeVector3FArrayTestClass >> array: anArray [
	array := anArray
]
