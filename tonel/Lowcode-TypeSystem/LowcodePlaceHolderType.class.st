Class {
	#name : #LowcodePlaceHolderType,
	#superclass : #LowcodeType,
	#instVars : [
		'index'
	],
	#category : #'Lowcode-TypeSystem'
}

{ #category : #accessing }
LowcodePlaceHolderType >> index [
	^ index
]

{ #category : #accessing }
LowcodePlaceHolderType >> index: anObject [
	index := anObject
]

{ #category : #'as yet unclassified' }
LowcodePlaceHolderType >> instantiateTemplateWithEnvironment: templateEnvironment [
	^ templateEnvironment at: index ifAbsent: [ nil ]
]

{ #category : #testing }
LowcodePlaceHolderType >> isPlaceHolderType [
	^ true
]

{ #category : #'as yet unclassified' }
LowcodePlaceHolderType >> matchesType: templateArgument withEnvironment: templateEnvironment [
	| usedType |
	usedType := templateEnvironment at: index ifAbsent: [
		templateEnvironment at: index put: templateArgument.
		^ true.
	].

	^ usedType matchesType: templateArgument withEnvironment: templateEnvironment
	
]

{ #category : #printing }
LowcodePlaceHolderType >> printOn: aStream [
	aStream print: index
]
