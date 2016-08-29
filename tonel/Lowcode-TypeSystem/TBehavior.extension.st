Extension { #name : #TBehavior }

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> addNativeSelector: selector withMethod: compiledMethod notifying: requestor [
	^ self addNativeSelectorSilently: selector withMethod: compiledMethod
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> addNativeSelectorSilently: selector withMethod: compiledMethod [
	| oldMethodOrNil |	
	oldMethodOrNil := self lookupNativeSelector: selector.
	self nativeMethodDictionary at: selector put: compiledMethod.
	compiledMethod methodClass: self.
	compiledMethod selector: selector.

	"Now flush Pharo's method cache, either by selector or by method"
	oldMethodOrNil ifNotNil: [oldMethodOrNil flushCache].
	selector flushCache.
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> compileNative: code [ 
	"Compile the argument, code, as source code in the context of the 
	receiver. Create an error notification if the code can not be compiled. 
	The argument is either a string or an object that converts to a string or a 
	PositionableStream on an object that converts to a string."

	^self compileNative: code notifying: nil
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> compileNative: code notifying: requestor [ 
	"Compile the argument, code, as source code in the context of the 
	receiver and insEtall the result in the receiver's method dictionary. The 
	second argument, requestor, is to be notified if an error occurs. The 
	argument code is either a string or an object that converts to a string or 
	a PositionableStream. This method also saves the source code."
	
	| method |
	method  := self compiler
		source: code;
		requestor: requestor;
		failBlock: [ ^nil ];
		compile.
		
	method putSource: code
			withPreamble: [:f | f cr; nextPut: $!; nextChunkPut: 'Behavior method'; cr].
	self addNativeSelector: method selector withMethod: method notifying: requestor.
	^ method selector
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> includesNativeSelector: selector [
	^ self nativeMethodDictionary ifNil: [ false ] ifNotNil: [ :dict | dict includesKey: selector ]
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> lookupNativeSelector: selector [
	"Look up the given selector in my methodDictionary.
	Return the corresponding method if found.
	Otherwise chase the superclass chain and try again.
	Return nil if no method is found."
	| lookupClass |
	lookupClass := self.
	[lookupClass == nil]
		whileFalse: 
			[(lookupClass includesNativeSelector: selector)
				ifTrue: [^ lookupClass nativeCompiledMethodAt: selector].
			lookupClass := lookupClass superclass].
	^ nil

]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> nativeCompiledMethodAt: selector [
	^ self nativeMethodDictionary ifNotNil: [ :dict | dict at: selector ]
]

{ #category : #'*Lowcode-TypeSystem' }
TBehavior >> nativeMethodDictionary [
	self explicitRequirement
]
