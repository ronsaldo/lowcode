Class {
	#name : #FFICallout,
	#superclass : #Object,
	#instVars : [
		'functionSpec',
		'convention',
		'requestor',
		'receiver',
		'originalMethod',
		'originalMethodArguments',
		'functionHandle',
		'options'
	],
	#classVars : [
		'TypeAliases'
	],
	#category : #'Lowcode-FFI-API'
}

{ #category : #'as yet unclassified' }
FFICallout class >> defaultOptions [
	"see #allOptions on my instance side"
	^ #(
	
	"#optCoerceNilToNull"
	"passing nil as a pointer-type argument, converts it to C NULL "
		
	#optAllowExternalAddressPtr
	"for a pointer-type argument, accept an instance of NBExternalAddress "
	
	"for a pointer-type argument, allow passing a pointer to byte arrays"
	#optAllowByteArraysPtr 
	
	"if function returns a pointer, return nil if pointer is null"
	#optReturnNullAsNil  
		
	"If function returns a pointer, fail primitive if pointer is null.
	Takes preference over #returnNullAsNil 
	Default: disabled. "
	"#optFailOnReturnNull"	

	"if function returns a pointer, convert it to unsigned integer object.
	Default: disabled
	#optReturnPtrAsInt "
	
	"If function returns a pointer, convert it to an instance of NBExternalAddress.
	Takes preference over #returnPtrAsInt.
	Default: enabled.  "
	#optReturnPtrAsExternalAddress
		
	"directly convert between C integers and Smallintegers instead of using proxy 	functions. perform no range checking"
	"#optQuickSmi --  not yet done	" 

	"directly convert between C integers and Smallintegers instead of using proxy 	functions. include range checking"
	"#optQuickSmiSafe --  not yet done	" 
				
	"string conversion"
	
	"for char* parameter type, when passed an instance of ByteString, 
	copy a ByteString's contents on a stack, append null character and pass a pointer to it"
	"#optAcceptStringForCharPtr ---  not yet implemented"	
		
	"for a function returning char* type, convert it to an instance of ByteString"
	"#optReturnCharPtrAsString -- not yet implemented"

	"for a function spec taking arguments indirectly from an array using the x@index convention
	check that the index is not outside x''s bounds "
	#optCheckIndirectArgBounds
	)

]

{ #category : #'as yet unclassified' }
FFICallout class >> initTypeAliases [
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
FFICallout class >> initialize [

	Smalltalk removeFromStartUpList: self .
	
	self initTypeAliases
]

{ #category : #accessing }
FFICallout >> aliasForType: typeName [

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
FFICallout >> argument: argumentName type: typeName pointerArity: pointerArity [
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
FFICallout >> callFunction: functionSpecString module: aModuleNameOrHandle andRetry: context [
	self generateFunction: functionSpecString module: aModuleNameOrHandle.
	Lowcode retryContext: context
]

{ #category : #accessing }
FFICallout >> cdecl [
	self convention: #cdecl
]

{ #category : #accessing }
FFICallout >> convention [
	^ convention
]

{ #category : #accessing }
FFICallout >> convention: callingConventionToken [
	convention := callingConventionToken
]

{ #category : #options }
FFICallout >> defaultOptions [
	^ self class defaultOptions
]

{ #category : #'reflective operations' }
FFICallout >> doesNotUnderstand: message [

	(message selector isUnary and: [ message selector beginsWith: 'opt'] )
		ifTrue: [ ^ options includes: message selector ].
		
	^ super doesNotUnderstand: message
]

{ #category : #accessing }
FFICallout >> functionAddress [
	^ functionHandle value
]

{ #category : #accessing }
FFICallout >> functionHandle [
	^ functionHandle
]

{ #category : #accessing }
FFICallout >> functionSpec [
	^ functionSpec
]

{ #category : #'callout generation' }
FFICallout >> genFunction: functionSpecString emit: aBlock andCall: context [
	self generateFunction: functionSpecString emit: aBlock.
	Lowcode retryContext: context
]

{ #category : #'callout generation' }
FFICallout >> generateFunction: functionSpecString emit: aBlock [
	| parser |
	parser := self newSpecParser.
	functionSpec := parser parseAnonFunction: functionSpecString.
	FFIPlatform current generateCallout: self emit: aBlock
]

{ #category : #'callout generation' }
FFICallout >> generateFunction: functionSpecString module: aModuleNameOrHandle [
	| parser |
	parser := self newSpecParser.
	functionSpec := parser parseNamedFunction: functionSpecString.
	functionHandle := requestor ffiGetSymbolAddress: functionSpec functionName module: aModuleNameOrHandle.
	functionHandle ifNil: [ self error: 'Failed to find function ''' , functionSpec functionName , ''' in module ' , aModuleNameOrHandle printString  ].

	FFIPlatform current generateCallout: self
]

{ #category : #initialization }
FFICallout >> initialize [
	options := Set new.
	self parseOptions: self defaultOptions.

]

{ #category : #'instance creation' }
FFICallout >> newSpecParser [
	 ^ FFIFunctionSpecParser new requestor: self.
]

{ #category : #accessing }
FFICallout >> originalMethod [
	^ originalMethod
]

{ #category : #accessing }
FFICallout >> originalMethod: aCompiledMethod [
	originalMethod := aCompiledMethod.
	originalMethodArguments := originalMethod ffiArgumentNames.
	self assert: originalMethodArguments size = originalMethod numArgs
]

{ #category : #accessing }
FFICallout >> parseOptions: optionsArray [

	"parse an array, which is a sequence of options in a form of: 
	
	#( + option1 option2 - option3 ... )
	
	each time the #+ is seen, the options which follow it will be subject for inclusion
	and, correspondingly, if #- seen, then they will be excluded	.

	By default, (if none of #+ or #- specified initially), all options are subject for inclusion.
	"
	| include |
	
	include := true.
	
	optionsArray do: [:option |
		option == #+ 
			ifTrue: [ include := true ]
			ifFalse: [
				option == #- 
					ifTrue: [ include := false ]
					ifFalse: [ 
						include ifTrue: [ options add: option ] 
						ifFalse: [ options remove: option ifAbsent:[] ]]]
		].
]

{ #category : #accessing }
FFICallout >> receiver [
	^ receiver
]

{ #category : #accessing }
FFICallout >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
FFICallout >> requestor [
	^ requestor
]

{ #category : #accessing }
FFICallout >> requestor: aRequestor [
	requestor := aRequestor.
	
	(requestor respondsTo: #ffiCalloutOptions) ifTrue: [
		self parseOptions: requestor ffiCalloutOptions
	]

]

{ #category : #accessing }
FFICallout >> resolveType: typeName [
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
FFICallout >> returnType: typePointerPair [
	^self typeName: typePointerPair first pointerArity: typePointerPair second
]

{ #category : #accessing }
FFICallout >> sender: aSenderContext [
	self requestor: aSenderContext method methodClass.
	self receiver: aSenderContext receiver.
	self originalMethod:  aSenderContext method.
]

{ #category : #accessing }
FFICallout >> stdcall [
	self convention: #stdcall
]

{ #category : #accessing }
FFICallout >> typeName: typeName pointerArity: pointerArity [
	^ (self resolveType: typeName) pointerArity: pointerArity
]

{ #category : #accessing }
FFICallout >> variableArgument: argumentName [
	"Special variable argument"
	argumentName = 'self' ifTrue: [ ^ FFISTReceiverArgument new type: (requestor asFFIExternalType: self) ].
	
	self error: 'Unexpected argument of name ' , argumentName
]
