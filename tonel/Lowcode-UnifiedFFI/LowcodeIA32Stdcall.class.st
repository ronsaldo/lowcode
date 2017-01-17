"
I describe the X86-32 __stdcall calling convention.
"
Class {
	#name : #LowcodeIA32Stdcall,
	#superclass : #LowcodeIA32CallingConvention,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #testing }
LowcodeIA32Stdcall >> isStackCleanedByCaller [
	^ false
]
