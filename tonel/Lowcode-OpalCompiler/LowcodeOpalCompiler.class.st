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

{ #category : #'as yet unclassified' }
LowcodeOpalCompiler >> compile [
	| compiledMethod |
	compiledMethod := super compile.
	compiledMethod setSignFlag.
	compiledMethod setFrameBit: true.
	^ compiledMethod
]
