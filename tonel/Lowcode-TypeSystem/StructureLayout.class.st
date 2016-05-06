Class {
	#name : #StructureLayout,
	#superclass : #PointerLayout,
	#instVars : [
		'structureAlignment',
		'structureSize'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #'instance creation' }
StructureLayout class >> extending: superLayout scope: aScope host: aClass [
	^ (superLayout extendStructure: aScope)
		host: aClass;
		yourself
]

{ #category : #'structure layout' }
StructureLayout >> computeStructureLayout [
	structureAlignment := 1.
	structureSize := 0.
	
	self allSlotsDo: [:slot |
		slot offset: (structureSize alignedTo: slot alignment).
		structureAlignment := structureAlignment max: slot alignment.
		structureSize := slot offset + slot fieldSize
	].

	structureSize := structureSize alignedTo: structureAlignment.
	
]

{ #category : #extending }
StructureLayout >> extend [
	"Answer a default layout extending me."

	^ self extend: self slotScope extend
]

{ #category : #extending }
StructureLayout >> extend: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #structure;
		signal.
]

{ #category : #extending }
StructureLayout >> extendPackedStructure: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #union;
		signal.
]

{ #category : #extending }
StructureLayout >> extendStructure: aScope [
	^ self species new slotScope: aScope
]

{ #category : #extending }
StructureLayout >> extendUnion: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #union;
		signal.
]

{ #category : #extending }
StructureLayout >> extendVariable: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #variable;
		signal.
]

{ #category : #extending }
StructureLayout >> extendWeak: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #weak;
		signal.
]

{ #category : #accessing }
StructureLayout >> fieldSize [
	^ 0
]

{ #category : #accessing }
StructureLayout >> instVarNames [
	^ slotScope visibleSlotNames
]

{ #category : #format }
StructureLayout >> instanceSpecification [
	^ 16
]

{ #category : #copying }
StructureLayout >> postCopy [
	super postCopy.
	
]

{ #category : #accessing }
StructureLayout >> size [
	^ 0
]

{ #category : #accessing }
StructureLayout >> slotScope: aSlotScope [
	super slotScope: aSlotScope.
	self computeStructureLayout.
]

{ #category : #accessing }
StructureLayout >> structureAlignment [
	structureAlignment ifNil: [ self computeStructureLayout ].
	^ structureAlignment
]

{ #category : #accessing }
StructureLayout >> structureSize [
	structureSize ifNil: [ self computeStructureLayout ].
	^ structureSize
]
