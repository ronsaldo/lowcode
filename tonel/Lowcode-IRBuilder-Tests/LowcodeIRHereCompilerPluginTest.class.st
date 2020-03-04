"
A LowcodeIRHereCompilerPluginTest is a test class for testing the behavior of LowcodeIRHereCompilerPlugin
"
Class {
	#name : #LowcodeIRHereCompilerPluginTest,
	#superclass : #TestCase,
	#category : #'Lowcode-IRBuilder-Tests'
}

{ #category : #'as yet unclassified' }
LowcodeIRHereCompilerPluginTest >> makeOne32WithLowcode [
	<useLowcodeIRBuilder>
	^ IRLowcodeBuilder here: [ :builder |
		builder
			lowcodePushOne32; 
			lowcodeInt32ToOop;
			returnTop
	]
]

{ #category : #'as yet unclassified' }
LowcodeIRHereCompilerPluginTest >> testMakeOne32WithLowcode [
	^ self assert: self makeOne32WithLowcode equals: 1
]
