"
A LowcodeFFICalloutMethodBuilderTest is a test class for testing the behavior of LowcodeFFICalloutMethodBuilder
"
Class {
	#name : #LowcodeFFITest,
	#superclass : #TestCase,
	#instVars : [
		'libC'
	],
	#category : #'Lowcode-UnifiedFFI-Tests'
}

{ #category : #'as yet unclassified' }
LowcodeFFITest >> setUp [
	libC := LibCWithLowcode new.
]

{ #category : #'as yet unclassified' }
LowcodeFFITest >> testMalloc [
	| pointer |
	pointer := libC malloc: 4.
	[ 
		self assert: pointer isNull not.
	] ensure: [ pointer free ]
]
