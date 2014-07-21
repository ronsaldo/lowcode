Class {
	#name : #FFIStructureFields,
	#superclass : #FFISpecParser,
	#instVars : [
		'fields',
		'totalSize',
		'alignment'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #adding }
FFIStructureFields >> addField: name type: type [
	| field |
	field := FFIStructureField new
			type: type;
			offset: totalSize - type typeSize;
			yourself.
	fields at: name ifPresent: [ self error: 'existing field name ' , name printString ].
	fields at: name put: field
]

{ #category : #accessing }
FFIStructureFields >> fieldNames [

	^ fields keys
]

{ #category : #accessing }
FFIStructureFields >> fieldNamesDo: aBlock [

	^ fields keysDo: [:name | aBlock value: name ]
]

{ #category : #initialization }
FFIStructureFields >> initialize [
	fields := IdentityDictionary new.
]

{ #category : #accessing }
FFIStructureFields >> namesInDeclarationOrder [

	| result |
	
	result := SortedCollection sortBlock: [:a :b | a value offset < b value offset ].

	fields associationsDo: [:each  | result add: each ].
		
	^ result collect: [:each | each key ]
]

{ #category : #'instance creation' }
FFIStructureFields >> newField: name type: type [
	| align |
	align := type typeSize min: alignment.
	self sizeAlignedTo: align with: type.
	self addField: name type: type
]

{ #category : #accessing }
FFIStructureFields >> offsetOf: fieldName [
	^ (fields at: fieldName) offset
]

{ #category : #parsing }
FFIStructureFields >> parseFields: fieldSpec byteAlignment: byteAlignment structure: structure [
	| typeAndArity type name |
	
	fields := IdentityDictionary new.
	totalSize := 0.
	alignment := byteAlignment.
	
	self requestor: (FFICallout new requestor: structure).
	self setUpScanner: fieldSpec.
	[stream atEnd] whileFalse: [ 
		typeAndArity := self parseType.
		type := requestor typeName: typeAndArity first pointerArity: typeAndArity second.
		name := self parseSymbol asSymbol .
	
		self newField: name type: type.
			
		[ stream peek = $, ] whileTrue: [ 
			self matchCharacter: $,.
			name := self parseSymbol asSymbol.
			self newField: name type: type.
		].
	
		self matchCharacter: $;
	]
]

{ #category : #'parsing spec' }
FFIStructureFields >> sizeAlignedTo: anAlign with: aType [
	totalSize := (totalSize alignedTo: anAlign) + aType typeSize
]

{ #category : #accessing }
FFIStructureFields >> totalSize [
	^ totalSize
]

{ #category : #accessing }
FFIStructureFields >> typeOf: fieldName [
	^ (fields at: fieldName) type
]

{ #category : #accessing }
FFIStructureFields >> updateFieldOffsetsFor: class [
]
