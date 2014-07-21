Class {
	#name : #FFISpecParser,
	#superclass : #Object,
	#instVars : [
		'requestor',
		'stream'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #parsing }
FFISpecParser >> consumeWhite [
	| ch |
	[ 
		ch := stream peek.
		ch ifNil: [ ^ self ].
		ch isSeparator ] whileTrue: [ stream next
	]
]

{ #category : #parsing }
FFISpecParser >> expected: what [
	self error: 'expected ' , what , ' in function specification'
]

{ #category : #'character testing' }
FFISpecParser >> isDigitCharacter: character [
	^ character isDigit
]

{ #category : #'character testing' }
FFISpecParser >> isNextNumber [
	^ self isDigitCharacter: stream peek
]

{ #category : #'character testing' }
FFISpecParser >> isNextSymbol [
	^ self isSymbolStartCharacter: stream peek
]

{ #category : #'character testing' }
FFISpecParser >> isSymbolInnerCharacter: character [
	^ (character isLetter or: [ character isDigit  ]) or: [ character = $_ ]
]

{ #category : #'character testing' }
FFISpecParser >> isSymbolStartCharacter: character [
	^ character isLetter or: [ character = $_ ]
]

{ #category : #parsing }
FFISpecParser >> literalArrayToString: literalArray [
	^ ByteString streamContents: [ :outStream | self literalArrayToString: literalArray stream: outStream ]
]

{ #category : #parsing }
FFISpecParser >> literalArrayToString: literalArray stream:outStream [
	literalArray do: [ :el |
		el isArray ifTrue: [ 
			outStream nextPut: $( .
			self literalArrayToString: el stream: outStream.
			outStream nextPut: $); nextPut: $ .
		]
		ifFalse: [ 
			outStream nextPutAll: el; nextPut: $ .
		]
	]
]

{ #category : #parsing }
FFISpecParser >> matchCharacter: aCharacter [
	stream next ~= aCharacter ifTrue: [ self expected: '"' , aCharacter asString, '"'  ].
	self consumeWhite
]

{ #category : #parsing }
FFISpecParser >> parseMatching: aBlock [
	| ch result |
	result := ByteString streamContents: [ :out |
		ch  := stream next.
		[aBlock value: ch] whileTrue: [ 
			out nextPut: ch. 
			ch := stream next
		]
	].
	self consumeWhite.
	^ result
	
]

{ #category : #parsing }
FFISpecParser >> parseSymbol [
	self isNextSymbol ifFalse: [ self expected: 'symbol' ].
	^ self parseMatching: [ :c | self isSymbolInnerCharacter: c ].
	
]

{ #category : #parsing }
FFISpecParser >> parseType [
	| typeName pointerArity |
	typeName := self parseSymbol.
	typeName = 'const' ifTrue: [
		"Ignore const for now."
		typeName := self parseSymbol.
	].
	
	pointerArity := 0.
	
	[ stream peek = $* ] whileTrue: [
		pointerArity := pointerArity + 1.
		self matchCharacter: $*.
	].

	^ Array with: typeName with: pointerArity
]

{ #category : #accessing }
FFISpecParser >> requestor: calloutObject [
	"The requestor is used to resolve types."
	requestor := calloutObject
]

{ #category : #parsing }
FFISpecParser >> setUpScanner: aDefinition [
	| wholeSpec |
	aDefinition isString ifTrue: [
		wholeSpec := aDefinition.
	] ifFalse: [
		wholeSpec := self literalArrayToString: aDefinition.
	].
	stream := wholeSpec readStream.
	self consumeWhite

]
