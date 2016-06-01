Class {
	#name : #PackedStructureLayout,
	#superclass : #StructureLayout,
	#category : #'Lowcode-TypeSystem-InternalStructure'
}

{ #category : #'structure layout' }
PackedStructureLayout >> computeStructureLayout [
	structureAlignment := 1.
	structureSize := 0.
	
	self allSlotsDo: [:slot |
		slot offset: structureSize.
		structureSize := structureSize + slot fieldSize
	].
	
]

{ #category : #extending }
PackedStructureLayout >> extendPackedStructure: aScope [
	^ self species new slotScope: aScope
]

{ #category : #extending }
PackedStructureLayout >> extendStructure: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #structure;
		signal.
]

{ #category : #extending }
PackedStructureLayout >> extendUnion: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #union;
		signal.
]
