Class {
	#name : #FFIPlatform,
	#superclass : #Object,
	#classVars : [
		'CurrentPlatform',
		'FFISession'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #accessing }
FFIPlatform class >> current [
	(FFISession ~~ Smalltalk session or: [ CurrentPlatform isNil]) ifTrue: [ 
		CurrentPlatform := self pickPlatform.
		FFISession := Smalltalk session.
	].
	^ CurrentPlatform
]

{ #category : #testing }
FFIPlatform class >> isCurrentPlatform [
	^ false
]

{ #category : #'as yet unclassified' }
FFIPlatform class >> pickPlatform [
	self allSubclassesDo: [ :sc |
		sc isCurrentPlatform ifTrue: [ ^ sc new. ]
	].
	self error: 'FFI platform could not be indentified'
]

{ #category : #'as yet unclassified' }
FFIPlatform >> generateCallout: calloutSpecification [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FFIPlatform >> pointerSize [
	^ self subclassResponsibility
]
