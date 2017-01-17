"
I represent the Windows ABI for x86-64.
"
Class {
	#name : #'LowcodeABI_X64_Windows',
	#superclass : #'LowcodeABI_X64',
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #accessing }
LowcodeABI_X64_Windows >> abiName [
	^ #Windows
]

{ #category : #'as yet unclassified' }
LowcodeABI_X64_Windows >> callingConventionNamed: aCallingConventionName [
	aCallingConventionName = #cdecl ifTrue: [ ^ LowcodeX64Win64CallingConvention new ].
	aCallingConventionName = #stdcall ifTrue: [ ^ LowcodeX64Win64CallingConvention new ].
	aCallingConventionName = #apicall ifTrue: [ ^ LowcodeX64Win64CallingConvention new ].
	self error: 'Unsupported calling convention ', aCallingConventionName
]
