Class {
	#name : #LowcodeEngine,
	#superclass : #Object,
	#classVars : [
		'Current',
		'CurrentSession'
	],
	#category : #'Lowcode-Execution'
}

{ #category : #accessing }
LowcodeEngine class >> current [
	((CurrentSession ~~ Smalltalk session) or: [ Current == nil ]) ifTrue: [ 
		Current := self pickEngine.
		CurrentSession := Smalltalk session.
	].
	^ Current

]

{ #category : #testing }
LowcodeEngine class >> isSupported [
	^ false
]

{ #category : #private }
LowcodeEngine class >> pickEngine [
	self allSubclassesDo: [ :sc | sc isSupported ifTrue: [^ sc new] ].
	self error: 'No Lowcode execution engine available.'
]
