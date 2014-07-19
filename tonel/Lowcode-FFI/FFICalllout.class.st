Class {
	#name : #FFICalllout,
	#superclass : #Object,
	#instVars : [
		'functionSpec',
		'convention',
		'requestor',
		'receiver',
		'originalMethod',
		'originalMethodArguments',
		'functionHandle'
	],
	#classVars : [
		'TypeAliases'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #'as yet unclassified' }
FFICalllout class >> initTypeAliases [
	"self initTypeAliases"
	
	TypeAliases := Dictionary newFromPairs:
	#(
"not really a type, useful only as return type or with pointers "
		void FFIVoidType
		
" 0/!0  <-> false/true "
		bool FFIBoolType

"fixed size integer types, byte order is platform dependent "
		int8 FFIInt8Type
		uint8 FFIUInt8Type
		int16 FFIInt16Type
		uint16 FFIUInt16Type
		int32 FFIInt32Type
		uint32 FFIUInt32Type
		int64 FFIInt64Type
		uint64 FFIUInt64Type

" aliases to common C compiler types.. some of them are platform dependent, some is not.. to be sorted out later "		
		signedByte int8
		unsignedByte int8
		signedShort int16
		unsignedShort uint16
		signedChar int8  
		unsignedChar uint8
		schar int8
		uchar uint8
		signedLong int32
		unsignedLong uint32
		sbyte int8
		byte uint8
		short int16
		ushort uint16
		long int32
		ulong uint32
		longlong int64
		ulonglong uint64
		uint uint32
		int int32

"unsigned for sizes.. usually same size as platform's word size"
		size_t FFISizeTType
		
"character type. uint8 <-> accepts Character/Smallint as argument, converts return to Character "
		Character FFICharacterType
		char FFICharacterType
		

"Floats fixed-size. platform-dependent byte order"
		float32 FFIFloat32Type
		float64 FFIFloat64Type

"Floats, C type name aliases"
				
		float float32
		double float64

"Special types "		
		oop FFIOopType
	)
	
]

{ #category : #'as yet unclassified' }
FFICalllout class >> initialize [

	Smalltalk removeFromStartUpList: self .
	
	self initTypeAliases
]

{ #category : #accessing }
FFICalllout >> aliasForType: typeName [

	| alias |
	alias := typeName.
	(requestor notNil and: [ requestor respondsTo: #externalTypeAlias: ]) 
		ifTrue: [ alias := requestor externalTypeAlias: typeName.
			alias ifNil: [ alias := typeName ] ].
	
	" internal aliases "
	TypeAliases ifNil: [ self class initTypeAliases ].
	^ TypeAliases at: alias ifAbsent: [ alias ]
]

{ #category : #accessing }
FFICalllout >> argument: argumentName type: typeName pointerArity: pointerArity [
	| type index argNameSymbol |
	type := self typeName: typeName pointerArity: pointerArity.
	argNameSymbol := argumentName asSymbol.
	
	index := requestor instVarIndexFor: argNameSymbol.
	index > 0 ifTrue: [
		^ FFISTInstanceVariableArgument new index: index - 1; type: type; yourself.
	].

	index := originalMethodArguments indexOf:  argNameSymbol.
	index > 0 ifTrue: [
		^ FFISTMethodArgument new index: index - 1; type: type; yourself.
	]

]

{ #category : #'callout generation' }
FFICalllout >> callFunction: functionSpecString module: aModuleNameOrHandle [
	| parser |
	parser := self newSpecParser.
	functionSpec := parser parseNamedFunction: functionSpecString.
	functionHandle := requestor ffiGetSymbolAddress: functionSpec functionName module: aModuleNameOrHandle.
	^ FFIPlatform current generateCallout: self
]

{ #category : #'callout generation' }
FFICalllout >> callFunction: functionSpecString module: aModuleNameOrHandle andRetry: context [
	self generateFunction: functionSpecString module: aModuleNameOrHandle.
	Lowcode retryContext: context
]

{ #category : #accessing }
FFICalllout >> cdecl [
	self convention: #cdecl
]

{ #category : #accessing }
FFICalllout >> convention [
	^ convention
]

{ #category : #accessing }
FFICalllout >> convention: callingConventionToken [
	convention := callingConventionToken
]

{ #category : #accessing }
FFICalllout >> functionHandle [
	^ functionHandle
]

{ #category : #accessing }
FFICalllout >> functionSpec [
	^ functionSpec
]

{ #category : #'callout generation' }
FFICalllout >> generateFunction: functionSpecString module: aModuleNameOrHandle [
	| parser |
	parser := self newSpecParser.
	functionSpec := parser parseNamedFunction: functionSpecString.
	functionHandle := requestor ffiGetSymbolAddress: functionSpec functionName module: aModuleNameOrHandle.
	FFIPlatform current generateCallout: self
]

{ #category : #'instance creation' }
FFICalllout >> newSpecParser [
	 ^ FFIFunctionSpecParser new requestor: self.
]

{ #category : #accessing }
FFICalllout >> originalMethod [
	^ originalMethod
]

{ #category : #accessing }
FFICalllout >> originalMethod: aCompiledMethod [
	originalMethod := aCompiledMethod.
	originalMethodArguments := originalMethod ffiArgumentNames.
	self assert: originalMethodArguments size = originalMethod numArgs
]

{ #category : #accessing }
FFICalllout >> parseOptions [
	self shouldBeImplemented
]

{ #category : #accessing }
FFICalllout >> receiver [
	^ receiver
]

{ #category : #accessing }
FFICalllout >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
FFICalllout >> requestor: aRequestor [
	requestor := aRequestor.
	
	(requestor respondsTo: #ffiCalloutOptions) ifTrue: [
		self parseOptions: requestor ffiCalloutOptions
	]

]

{ #category : #accessing }
FFICalllout >> resolveType: typeName [
	" a type name could be
	 - a class variable name
	- a class name
	- a type name 
	- a type name, followed by arbitrary number pointer chars - $*"

	| name newName resolver binding ptrArity |
	
	newName := typeName.
	ptrArity := 0.
	"resolve aliases and pointers"	
	[
		name := newName trimRight.  
		newName := self aliasForType: name.
		newName last = $* ifTrue: [
			ptrArity := ptrArity + 1.
			newName := newName allButLast ].
		name = newName ] whileFalse.
	
	resolver := requestor ifNil: [ self class ].
	binding := resolver ffiBindingOf: name asSymbol.
	
	binding ifNotNil: [ 
		^ (binding value asFFIExternalType: self) pointerArity: ptrArity ] .

	^ self error: 'Unable to resolve external type: ', typeName.


]

{ #category : #accessing }
FFICalllout >> returnType: typePointerPair [
	^self typeName: typePointerPair first pointerArity: typePointerPair second
]

{ #category : #accessing }
FFICalllout >> sender: aSenderContext [
	self requestor: aSenderContext method methodClass.
	self receiver: aSenderContext receiver.
	self originalMethod:  aSenderContext method.
]

{ #category : #accessing }
FFICalllout >> stdcall [
	self convention: #stdcall
]

{ #category : #accessing }
FFICalllout >> typeName: typeName pointerArity: pointerArity [
	^ (self resolveType: typeName) pointerArity: pointerArity
]

{ #category : #accessing }
FFICalllout >> variableArgument: argumentName [
	"Special variable argument"
	argumentName = 'self' ifTrue: [ ^ FFISTReceiverArgument new ].
	
	self error: 'Unexpected argument of name ' , argumentName
]
