Extension { #name : #IRLowcodeBuilder }

{ #category : #'*Lowcode-TypeSystem' }
IRLowcodeBuilder >> generateTempOfType: aType [
	| tempSymbol |
	tempSymbol := self generateSymbol.
	(aType isObject or: [ aType isBoxedStructureReferenceType ]) ifTrue: [
		self addTemp: tempSymbol.
	] ifFalse: [
		self addNativeTemp: tempSymbol -> aType size.
	].
	^ tempSymbol
]
