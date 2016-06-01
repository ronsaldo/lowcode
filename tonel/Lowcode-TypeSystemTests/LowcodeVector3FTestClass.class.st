"
I am a class used for testing the Lowcode type system.
"
Class {
	#name : #LowcodeVector3FTestClass,
	#superclass : #InternalStructure,
	#type : #StructureLayout,
	#instVars : [
		'#x &=> #float',
		'#y &=> #float',
		'#z &=> #float'
	],
	#category : #'Lowcode-TypeSystemTests'
}

{ #category : #comparing }
LowcodeVector3FTestClass >> = other [
	^ self class = other class and: [ x = other x and: [ y = other y and: [ z = other z ] ] ]
]

{ #category : #comparing }
LowcodeVector3FTestClass >> hash [
	^ ((self class hash
		bitXor: x hash)
		bitXor: y hash)
		bitXor: z hash
]

{ #category : #accessing }
LowcodeVector3FTestClass >> x [
	^ x
]

{ #category : #accessing }
LowcodeVector3FTestClass >> x: value [
	x := value
]

{ #category : #accessing }
LowcodeVector3FTestClass >> y [
	^ y
]

{ #category : #accessing }
LowcodeVector3FTestClass >> y: value [
	y := value
]

{ #category : #accessing }
LowcodeVector3FTestClass >> z [
	^ z
]

{ #category : #accessing }
LowcodeVector3FTestClass >> z: value [
	z := value
]
