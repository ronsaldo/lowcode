Extension { #name : #Array }

{ #category : #'*Lowcode-TypeSystem' }
Array >> asLowcodeType [
	^ self asLowcodeTypeAtEnvironment: thisContext sender receiver class
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> asLowcodeTypeAtEnvironment: anEnvironment [
	| arguments currentType in hasReturnType |
	arguments := OrderedCollection new.
	in := self readStream.
	currentType := nil.
	hasReturnType := false.
	[ in atEnd ] whileFalse: [
		(in peek ~~ #-> and: [ in peek ~~ #, ]) ifTrue: [
			currentType := currentType ifNil: [ in next asLowcodeTypeAtEnvironment: anEnvironment ] ifNotNil: [ currentType perform: in next ].
		].
		in peek == #, ifTrue: [
			in next.
			currentType ifNil: [ self error: 'expected an argument type before ,' ].
			arguments add: currentType.
			currentType := nil. 
		].
		in peek == #-> ifTrue: [
			hasReturnType := true.
			in next.
			currentType ifNotNil: [
				arguments add: currentType.
			].
			currentType := nil. 
		].
	].

	hasReturnType ifFalse: [ ^ currentType ].
	^ LowcodeFunctionType arguments: arguments returnType: currentType
]
