"
I describe the Windows X64 ABI standard calling convention.  
"
Class {
	#name : #LowcodeX64Win64CallingConvention,
	#superclass : #LowcodeX64CallingConvention,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #accessing }
LowcodeX64Win64CallingConvention >> floatRegisterParameters [
	^ { XMM0 . XMM1 . XMM2 . XMM3 }
]

{ #category : #accessing }
LowcodeX64Win64CallingConvention >> integerRegisterParameters [
	^ { RCX . RDX . R8 . R9 }
]

{ #category : #accessing }
LowcodeX64Win64CallingConvention >> isStackCleanedByCaller [
	^ true
]

{ #category : #accessing }
LowcodeX64Win64CallingConvention >> shadowStackSpace [
	^ 32
]

{ #category : #accessing }
LowcodeX64Win64CallingConvention >> stackAlignment [
	^ 16
]
