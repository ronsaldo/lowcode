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
			currentType ifNil: [
				currentType := in next asLowcodeTypeAtEnvironment: anEnvironment
			] ifNotNil: [
				(in peek isSymbol and: [ in peek endsWith: #':' ]) ifTrue: [
					currentType := currentType perform: in next with: in next.
				] ifFalse: [
					currentType := currentType perform: in next. 
				]
			].
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

{ #category : #'*Lowcode-TypeSystem' }
Array >> nativeNew [
	^ self asLowcodeType nativeNew
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> nativeNew: size [
	^ self asLowcodeType nativeNew: size
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> nativeNullPointer [
	^ self asLowcodeType nativeNullPointer
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> nativePointer: address [
	^ self asLowcodeType nativePointer: address
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> uncheckedAt: index [
	^ self at: index
]

{ #category : #'*Lowcode-TypeSystem' }
Array >> uncheckedAt: index put: value [
	^ self at: index put: value
]
