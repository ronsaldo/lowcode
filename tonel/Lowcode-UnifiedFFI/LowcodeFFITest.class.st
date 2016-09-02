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
LowcodeFFITest >> testAtoi [
	self assert: (LibCWithLowcode new atoi: '6') equals: 6.

]

{ #category : #'as yet unclassified' }
LowcodeFFITest >> testMalloc [
	| pointer |
	pointer := libC malloc: 4.
	[ 
		self assert: pointer isNull not.
	] ensure: [ pointer free ]
]

{ #category : #'as yet unclassified' }
LowcodeFFITest >> testMemcmp [
	| firstString secondString |
	firstString := ExternalAddress fromString: 'abc'.
	secondString := ExternalAddress fromString: 'abd'.
	[
		self assert: (LibCWithLowcode new memCmp: firstString with: secondString size: 3) equals: -1.
	] ensure: [ firstString free . secondString free. ]
]

{ #category : #'as yet unclassified' }
LowcodeFFITest >> testMemcmp2 [
	self assert: (LibCWithLowcode new memCmp: 'abc' with: 'abd' size: 3) equals: -1.

]
