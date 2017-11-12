Class {
	#name : #LowcodeMethodSerialization,
	#superclass : #Object,
	#classVars : [
		'LiteralClasses'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #initialization }
LowcodeMethodSerialization class >> initialize [
	super initialize.
	
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
		
		ClassVariable .
		GlobalVariable .
	}
]
