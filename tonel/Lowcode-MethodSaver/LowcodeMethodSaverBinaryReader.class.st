Class {
	#name : #LowcodeMethodSaverBinaryReader,
	#superclass : #Object,
	#instVars : [
		'in'
	],
	#category : #'Lowcode-MethodSaver'
}

{ #category : #accessing }
LowcodeMethodSaverBinaryReader >> next: aSize [
	^ in next: aSize
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextI16 [
	| result |
	result := self nextU16.
	^ (result bitAnd: 16r7fff) - (result bitAnd: 16r8000)
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextI32 [
	| result |
	result := self nextU32.
	^ (result bitAnd: 16r7fffffff) - (result bitAnd: 16r80000000)
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextI8 [
	| result |
	result := self nextU8.
	^ (result bitAnd: 16r7f) - (result bitAnd: 16r80)
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextU16 [
	^ in next |
		(in next << 8)
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextU32 [
	^ in next |
		(in next << 8) |
		(in next << 16) |
		(in next << 24)
]

{ #category : #'as yet unclassified' }
LowcodeMethodSaverBinaryReader >> nextU8 [
	^ in next
]

{ #category : #accessing }
LowcodeMethodSaverBinaryReader >> stream: aStream [
	in := aStream
]
