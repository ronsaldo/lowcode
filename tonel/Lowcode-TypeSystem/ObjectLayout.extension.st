Extension { #name : #ObjectLayout }

{ #category : #'*Lowcode-TypeSystem' }
ObjectLayout >> extendPackedStructure: aScope [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #packedStructure;
			signal ].
	^ StructureLayout new slotScope: aScope
]

{ #category : #'*Lowcode-TypeSystem' }
ObjectLayout >> extendStructure: aScope [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #structure;
			signal ].
	^ StructureLayout new slotScope: aScope
]

{ #category : #'*Lowcode-TypeSystem' }
ObjectLayout >> extendUnion: aScope [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #structure;
			signal ].
	^ UnionLayout new slotScope: aScope
]
