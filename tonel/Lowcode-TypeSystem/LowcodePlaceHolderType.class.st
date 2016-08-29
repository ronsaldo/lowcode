"
I represent a place holder for template parameters. I am used to infer types of inlined messages such as ifTrue:ifFalse:

Signature for ifTrue:ifFalse: present in OCLowcodeASTSemanticAnalyzer >> #initialize

ifTrue:ifFalse: (bool , (-> 1), (-> 1) -> 1)

"
Class {
	#name : #LowcodePlaceHolderType,
	#superclass : #LowcodeType,
	#instVars : [
		'index'
	],
	#category : #'Lowcode-TypeSystem-Types'
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
