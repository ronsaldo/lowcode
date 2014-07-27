Class {
	#name : #FFIStructure,
	#superclass : #Object,
	#classVars : [
		'Printing'
	],
	#classInstVars : [
		'initialized',
		'currentFields'
	],
	#category : #'Lowcode-FFI-Objects'
}

{ #category : #alignment }
FFIStructure class >> byteAlignment [
	
	"default "
	^ FFI pointerSize

]

{ #category : #'managing accessors' }
FFIStructure class >> createAccessorsFor: fieldName [ 
	"Define read/write accessors for the given field"
	| code |

	code := fieldName,'
	"This method was automatically generated"
	
	^ self fieldAt: ' , fieldName printString.
	Author useAuthor: 'FFI' during: [ 
		self compileSilently: code classified: NativeBoost automaticallyGeneratedCodeCategory ].
	
	code := fieldName,': anObject
	"This method was automatically generated"
	
	^ self fieldAt: ' , fieldName printString , ' put: anObject'.
	Author useAuthor: 'FFI' during: [ 
		self compileSilently: code classified: NativeBoost automaticallyGeneratedCodeCategory ].

]

{ #category : #accessing }
FFIStructure class >> fields [

	^ currentFields ifNil: [
		self rebuildFieldAccessors.
		currentFields
	].
]

{ #category : #accessing }
FFIStructure class >> fieldsClass [
	^ FFIStructureFields
]

{ #category : #'fields description' }
FFIStructure class >> fieldsDesc [
	"override this method in a subclass to get an automatically generated
	field accessors.
	
	The field description format is following:
	
	#( 
 		type1 name1, name2;
		type2 name3;
		....
	)
	"
	^ #()
]

{ #category : #'managing accessors' }
FFIStructure class >> flushNativeFieldAccessors [

	methodDict do: [:method |
		method isLowcodeMethod ifTrue: [ method uninstall ] ]
]

{ #category : #initialization }
FFIStructure class >> initializeAccessors [
	initialized := true.
	self rebuildFieldAccessors.
]

{ #category : #initialization }
FFIStructure class >> initializeForNewSession [

	self allSubclassesDo: [ :each | each updateFieldOffsets ]
]

{ #category : #accessing }
FFIStructure class >> instanceSize [ 
	
	^ self fields totalSize

	

]

{ #category : #testing }
FFIStructure class >> isInitialized [
	^ initialized == true
]

{ #category : #compiling }
FFIStructure class >> noteCompilationOf: aSelector meta: isMeta [
	initialized == true ifFalse: [ ^ self ].

	isMeta ifTrue: [ 
		"Compilation on a class side , lets get rid of native methods on instance side"
		(aSelector == #fieldsDesc or: [ aSelector == #byteAlignment ]) ifTrue: [ 
			self flushNativeFieldAccessors.
			self rebuildFieldAccessors ].
	].

]

{ #category : #'managing accessors' }
FFIStructure class >> rebuildFieldAccessors [

	currentFields ifNotNil: [
		currentFields fieldNamesDo: [:field |
			self removeAccessor: field.
			self removeAccessor: field asMutator ]].

	currentFields := self fieldsClass new 
		parseFields: self fieldsDesc byteAlignment: self byteAlignment structure: self.
	self fields fieldNamesDo: [:fldName | self createAccessorsFor: fldName ].

	^ currentFields
]

{ #category : #'managing accessors' }
FFIStructure class >> removeAccessor: aSelector [
	methodDict at: aSelector ifAbsent: [ ^ self ].
	self removeSelectorSilently: aSelector.

]

{ #category : #'session management' }
FFIStructure class >> updateFieldOffsets [

	"Update the field offsets and total structure size, in case if platform has changed and using
	different alignment comparing to previous session"
	
	currentFields ifNil: [ ^ self ].
	
	currentFields updateFieldOffsetsFor: self
]

{ #category : #accessing }
FFIStructure >> address [
	self subclassResponsibility
]

{ #category : #dnu }
FFIStructure >> doesNotUnderstand: aMessage [

	self class isInitialized ifFalse: [
		"retry send after initialization"
		self class initializeAccessors.
		^ aMessage sentTo: self
	].

	^ super doesNotUnderstand: aMessage
]

{ #category : #'initialize-release' }
FFIStructure >> emit: gen read: aFieldName spec: cs [
	| type offset |
	type := self class fields typeOf: aFieldName.
	offset := self class fields offsetOf: aFieldName.

	"Compute the value pointer"
	gen pushConstantUInt32: offset;
		pointerOffset32.
	
	"Read the value"	
	type lowcode: gen readOopFromMemory: cs.
	^ gen
]

{ #category : #'initialize-release' }
FFIStructure >> emit: gen write: aFieldName spec: cs [
	| type offset temp |
	type := self class fields typeOf: aFieldName.
	offset := self class fields offsetOf: aFieldName.

	"Store the Oop"
	temp := gen allocateTemp.
	gen popAndStoreTemp: temp.

	"Compute the value pointer"
	gen pushConstantUInt32: offset;
		pointerOffset32.

	"Load the Oop"
	gen pushTemp: temp.
	
	"write the value"	
	type lowcode: gen writeOopToMemory: cs.
	^ gen
]

{ #category : #printing }
FFIStructure >> printOn: aStream [ 
	"Append to the argument, aStream, the names and values of all the record's variables."

	Printing == true ifTrue: [ 
		"since we use field accessors for printing values,
		debugging the code with not-yet nativised accessors leads to infinite loop"
		^ aStream nextPutAll: self class name; nextPutAll: '(...)'.	
		].
	
	Printing := true.
	[ 
		aStream nextPutAll: self class name; nextPutAll: ' ( '; cr.
		self class fields namesInDeclarationOrder do: [ :field |
			aStream nextPutAll: field; nextPut: $:; space; tab.
				(self perform: field ) printOn: aStream.
				] separatedBy: [ aStream cr ].
		aStream cr; nextPut: $). ]
	ensure: [	Printing := false ].
	
]
