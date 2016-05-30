"
I am extended version of the OpalCompiler that adds native types, type checking of this native types and it uses the Lowcode instructions when it can use them.
"
Class {
	#name : #LowcodeOpalCompiler,
	#superclass : #OpalCompiler,
	#category : #'Lowcode-OpalCompiler-FrontEnd'
}

{ #category : #accessing }
LowcodeOpalCompiler >> compilationContextClass [
	^compilationContextClass ifNil: [ LowcodeCompilationContext  ]
]

{ #category : #'public access' }
LowcodeOpalCompiler >> compile [
	| compiledMethod |
	compiledMethod := super compile.
	compiledMethod setSignFlag.
	compiledMethod setFrameBit: true.
	^ compiledMethod
]

{ #category : #'public access' }
LowcodeOpalCompiler >> evaluate [
	"Compiles the sourceStream into a parse tree, then generates code into
	 a method. If aContext is not nil, the text can refer to temporaries in that
	 context (the Debugger uses this). If aRequestor is not nil, then it will receive
	 a notify:at: message before the attempt to evaluate is aborted. Finally, the 
	 compiled method is invoked from here via withArgs:executeMethod:, hence
	 the system no longer creates Doit method litter on errors."

	| value selectedSource itsSelection itsSelectionString compiledMethod |
	self class: (context 
				ifNil: [ receiver class ]
				ifNotNil: [ context method methodClass ]).
	self noPattern: true.
	selectedSource := ((self compilationContext requestor respondsTo: #selection)
		and: [ 
			(itsSelection := self compilationContext requestor selection) notNil
				and: [ (itsSelectionString := itsSelection asString) isEmptyOrNil not ] ])
		ifTrue: [ itsSelectionString ]
		ifFalse: [ source ].
	self source: selectedSource.
	compiledMethod := self translate generateWithSource.
	compiledMethod setSignFlag.
	compiledMethod setFrameBit: true.
	value := receiver withArgs: (context ifNil: [ #() ] ifNotNil: [ {context} ]) executeMethod:  compiledMethod.
	self compilationContext logged
		ifTrue: [ Smalltalk globals 
			at: #SystemAnnouncer 
			ifPresent: [ :sysAnn | 
				sysAnn uniqueInstance evaluated: selectedSource contents context: context ] ].
	^ value
]
