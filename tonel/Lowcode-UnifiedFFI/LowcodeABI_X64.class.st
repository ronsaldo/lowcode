"
I represent common ABI data for the x86-64 architecture.
"
Class {
	#name : #'LowcodeABI_X64',
	#superclass : #LowcodeABI,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #accessing }
LowcodeABI_X64 >> architectureName [
	^ #X64
]

{ #category : #accessing }
LowcodeABI_X64 >> callingConventionName [
	^ #cdecl
]
