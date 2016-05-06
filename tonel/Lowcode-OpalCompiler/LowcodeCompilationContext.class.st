Class {
	#name : #LowcodeCompilationContext,
	#superclass : #CompilationContext,
	#category : #'Lowcode-OpalCompiler-FrontEnd'
}

{ #category : #accessing }
LowcodeCompilationContext >> astTranslatorClass [
	^ astTranslatorClass ifNil: [ astTranslatorClass := OCLowcodeASTTranslator ]
]

{ #category : #accessing }
LowcodeCompilationContext >> encoderClass [
	^ encoderClass ifNil: [ encoderClass := OpalEncoderForSistaV1 ]
]

{ #category : #accessing }
LowcodeCompilationContext >> semanticAnalyzerClass [
	^ semanticAnalyzerClass ifNil: [ semanticAnalyzerClass := OCLowcodeASTSemanticAnalyzer  ]
]
