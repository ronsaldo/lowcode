Class {
	#name : #LowcodeSpecArgument,
	#superclass : #Object,
	#instVars : [
		'type',
		'name',
		'description'
	],
	#category : #'Lowcode-Generator'
}

{ #category : #accessing }
LowcodeSpecArgument >> description [
	
	^ description
]

{ #category : #accessing }
LowcodeSpecArgument >> description: anObject [
	
	description := anObject
]

{ #category : #accessing }
LowcodeSpecArgument >> name [
	^ name
]

{ #category : #accessing }
LowcodeSpecArgument >> name: anObject [
	
	name := anObject
]

{ #category : #accessing }
LowcodeSpecArgument >> type [
	
	^ type
]

{ #category : #accessing }
LowcodeSpecArgument >> type: anObject [
	
	type := anObject
]
