Class {
	#name : #UnionLayout,
	#superclass : #StructureLayout,
	#category : #'Lowcode-TypeSystem'
}

{ #category : #'structure layout' }
UnionLayout >> computeStructureLayout [
	structureAlignment := 1.
	structureSize := 0.
	
	self allSlotsDo: [:slot |
		slot offset: 0.
		structureAlignment := structureAlignment max: slot alignment.
		structureSize := structureSize max: slot fieldSize.
	].

	structureSize := structureSize alignedTo: structureAlignment.
	
]

{ #category : #extending }
UnionLayout >> extendPackedStructure: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #structure;
		signal.
]

{ #category : #extending }
UnionLayout >> extendStructure: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #structure;
		signal.
]

{ #category : #extending }
UnionLayout >> extendUnion: aScope [
	^ self species new slotScope: aScope
]
