"
I represent the SystemV ABI for x86-64.
"
Class {
	#name : #'LowcodeABI_X64_SystemV',
	#superclass : #'LowcodeABI_X64',
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #testing }
LowcodeABI_X64_SystemV class >> isForCPU: aCPUName [
	^ #(x64 x86_64) includes: aCPUName
]

{ #category : #accessing }
LowcodeABI_X64_SystemV >> abiName [
	^ #SystemV
]

{ #category : #'as yet unclassified' }
LowcodeABI_X64_SystemV >> callingConventionNamed: aCallingConventionName [
	aCallingConventionName = #cdecl ifTrue: [ ^ LowcodeX64SystemVCallingConvention new ].
	aCallingConventionName = #stdcall ifTrue: [ ^ LowcodeX64SystemVCallingConvention new ].
	aCallingConventionName = #apicall ifTrue: [ ^ LowcodeX64SystemVCallingConvention new ].
	self error: 'Unsupported calling convention ', aCallingConventionName
]
