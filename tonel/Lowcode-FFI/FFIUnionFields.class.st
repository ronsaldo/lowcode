Class {
	#name : #FFIUnionFields,
	#superclass : #FFIStructureFields,
	#instVars : [
		'ffiFields'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #'as yet unclassified' }
FFIUnionFields >> addField: name type: type [
	| field |
	field := FFIStructureField new
			type: type;
			offset: 0;
			index: (ffiFields := ffiFields + 1)
			yourself.
	fields at: name ifPresent: [ self error: 'existing field name ' , name printString ].
	fields at: name put: field
]

{ #category : #'as yet unclassified' }
FFIUnionFields >> initialize [
	super initialize.
	
	ffiFields := 0.
]

{ #category : #'as yet unclassified' }
FFIUnionFields >> namesInDeclarationOrder [

	| result |
	
	result := SortedCollection sortBlock: [:a :b | a value index < b value index ].

	fields associationsDo: [:each  | result add: each ].
		
	^ result collect: [:each | each key ]
]

{ #category : #accessing }
FFIUnionFields >> offsetOf: fieldName [
	^ 0
]

{ #category : #'parsing spec' }
FFIUnionFields >> sizeAlignedTo: anAlign with: aType [

	totalSize := (totalSize alignedTo: anAlign ) max: (aType typeSize alignedTo: anAlign)
]

{ #category : #accessing }
FFIUnionFields >> updateFieldOffsetsFor: unionClass [
	"Not needed, since all fields have same offset == 0.. but we need to update total size"
	
	
]
