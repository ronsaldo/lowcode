"
I am a wrapper around an scope object that adds support for native variables.
"
Class {
	#name : #IRLowcodeScope,
	#superclass : #Object,
	#instVars : [
		'scope',
		'builder',
		'nativeTempMap',
		'parentLowcodeScope',
		'nativeScopeSize'
	],
	#category : #'Lowcode-OpalCompiler-IR'
}

{ #category : #construction }
IRLowcodeScope class >> on: aScope builder: anIRBuilder [
	^ self new scope: aScope; builder: anIRBuilder 
]

{ #category : #accessing }
IRLowcodeScope >> addNativeTemp: nativeTempNameWithSize [
	| name size |
	name := nativeTempNameWithSize key.
	size := nativeTempNameWithSize value.
	nativeTempMap at: name put: self totalLocalFrameSize.
	nativeScopeSize := nativeScopeSize + size.
	
]

{ #category : #accessing }
IRLowcodeScope >> addNativeTemps: aNativeTempNamesWithSizes [
	aNativeTempNamesWithSizes do: [ :nativeTempNameWithSize | self addNativeTemp: nativeTempNameWithSize ]
]

{ #category : #accessing }
IRLowcodeScope >> builder [
	^ builder
]

{ #category : #accessing }
IRLowcodeScope >> builder: anObject [
	builder := anObject
]

{ #category : #'reflective operations' }
IRLowcodeScope >> doesNotUnderstand: aMessage [
	^ aMessage sendTo: scope
]

{ #category : #initialization }
IRLowcodeScope >> initialize [
	nativeTempMap := Dictionary new.
	nativeScopeSize := 0.
]

{ #category : #accessing }
IRLowcodeScope >> nativeLocalOffsetOf: nativeTempName [
	^ nativeTempMap at: nativeTempName ifAbsent: [
		parentLowcodeScope ifNil: [ self error: 'unknown native local variable named ' , nativeTempName printString ].
		^ parentLowcodeScope nativeLocalOffsetOf: nativeTempName
	]
]

{ #category : #accessing }
IRLowcodeScope >> nativeScopeSize [
	^ nativeScopeSize
]

{ #category : #accessing }
IRLowcodeScope >> nativeTempMap [
	^ nativeTempMap
]

{ #category : #accessing }
IRLowcodeScope >> parentLowcodeScope [
	^ parentLowcodeScope
]

{ #category : #accessing }
IRLowcodeScope >> parentLowcodeScope: anObject [
	parentLowcodeScope := anObject
]

{ #category : #accessing }
IRLowcodeScope >> scope [
	^ scope
]

{ #category : #accessing }
IRLowcodeScope >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
IRLowcodeScope >> totalLocalFrameSize [
	^ (parentLowcodeScope ifNil: [ 0 ] ifNotNil: [ parentLowcodeScope totalLocalFrameSize ]) + nativeScopeSize
]
