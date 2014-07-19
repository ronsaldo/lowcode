Extension { #name : #Object }

{ #category : #'*Lowcode-FFI' }
Object >> ffiCall: functionSpec [
	" you can override this method if you need to"
	
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		function: functionSpec module: self ffiLibraryNameOrHandle 
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiCall: functionSpec module: aModuleNameOrHandle [
	" you can override this method if you need to"
	
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		function: functionSpec module: aModuleNameOrHandle
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiCall: functionSpec module: aModuleNameOrHandle options: callOptions [
	" you can override this method if you need to"
	
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: callOptions;
		function: functionSpec module: aModuleNameOrHandle
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiCall: functionSpec options: callOptions [
	" you can override this method if you need to"
	
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: callOptions;
		function: functionSpec module: self ffiLibraryNameOrHandle
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiCallingConvention [
	^ #cdecl
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiCalloutIn: aMethodContext [
	^ FFICallloutAPI inContext: aMethodContext
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiGetSymbolAddress: aName module: aModuleNameOrHandle [
	"Lookup for given symbol in external module and answer its address
	(an instance of FFIExternalAddress), or nil if not found.
	
	A default implementation,
	first we try to use OS-specific symbol lookup mechanism,
	and if not found, we try to lookup a symbol from VM registered plugin(s)"
	
	| addr |
	
	addr := FFI loadSymbol: aName fromModule: aModuleNameOrHandle.

	^ addr ifNil: [ 
		"loadfunction takes only names, not handles"
		aModuleNameOrHandle isString 
			ifFalse: [ nil ] 
			ifTrue: [ FFI loadFunction: aName from: aModuleNameOrHandle ]]
]

{ #category : #'*Lowcode-FFI' }
Object >> ffiLibraryNameOrHandle [
	"Do I need to keep this hack?"
	self flag: 'HACK: avoid direct subclassResponsibility to not break RB test cases..'.
	^ SubclassResponsibility signalFor: thisContext selector

]
