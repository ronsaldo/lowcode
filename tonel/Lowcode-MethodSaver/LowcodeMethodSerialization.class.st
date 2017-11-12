Class {
	#name : #LowcodeMethodSerialization,
	#superclass : #Object,
	#classVars : [
		'ClassVariableClass',
		'GlobalVariableClass',
		'LiteralClasses'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #initialization }
LowcodeMethodSerialization class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	ClassVariableClass := Smalltalk at: #ClassVariable ifAbsent: [Association].
	GlobalVariableClass := Smalltalk at: #GlobalVariable ifAbsent: [Association].
	LiteralClasses := {
		UndefinedObject .
		True .
		False .
		ByteString .
		ByteSymbol .
		SmallInteger .
		SmallFloat64 .
		BoxedFloat64 .
		AdditionalMethodState .
		
		ClassVariableClass.
		GlobalVariableClass
	}
]
