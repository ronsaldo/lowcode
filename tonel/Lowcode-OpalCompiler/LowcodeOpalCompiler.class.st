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
