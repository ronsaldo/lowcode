"
I represent a standard x86-32 ABI.
"
Class {
	#name : #'LowcodeABI_IA32',
	#superclass : #LowcodeABI,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #testing }
LowcodeABI_IA32 class >> isForCPU: aCPUName [
	^ #(intel i386 i686) includes: aCPUName
]

{ #category : #accessing }
LowcodeABI_IA32 >> architectureName [
	^ #IA32
]

{ #category : #'as yet unclassified' }
LowcodeABI_IA32 >> callingConventionNamed: aCallingConventionName [
	aCallingConventionName = #cdecl ifTrue: [ ^ LowcodeIA32CDecl new ].
	aCallingConventionName = #stdcall ifTrue: [ ^ LowcodeIA32Stdcall new ].
	aCallingConventionName = #apicall ifTrue: [ ^ LowcodeIA32Stdcall new ].
	self error: 'Unsupported calling convention ', aCallingConventionName
]
