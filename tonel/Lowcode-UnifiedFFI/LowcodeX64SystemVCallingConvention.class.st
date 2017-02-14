"
I describe the C x86-64 SystemV ABI calling convention.

I am really annoying because I like to split small (up to four eight bytes) structures recursively into separate registers.
"
Class {
	#name : #LowcodeX64SystemVCallingConvention,
	#superclass : #LowcodeX64CallingConvention,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> areStructuresSplitInRegisters [
	^ true
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> computeStructureRegisterPassingLayout: aStructureClass [
	| layout |
	aStructureClass structureSize > self maxStructureSplitSize ifTrue: [ ^ nil ].
	layout := aStructureClass flatStructureLayout sysVAMD64PostProcess.
	^ layout isPassedInMemory ifTrue: [ nil ] ifFalse: [ layout ]
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> floatRegisterParameters [
	^ { XMM0 . XMM1 . XMM2 . XMM3 . XMM4 . XMM5 . XMM6 . XMM7 }
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> integerRegisterParameters [
	^ { RDI . RSI . RDX . RCX . R8 . R9}
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> isStackCleanedByCaller [
	^ true
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> maxStructureSplitSize [
	^ 16
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> shadowStackSpace [
	^ 0
]

{ #category : #accessing }
LowcodeX64SystemVCallingConvention >> stackAlignment [
	^ 16
]

{ #category : #'as yet unclassified' }
LowcodeX64SystemVCallingConvention >> structureFieldRegisterMarshaller: aStructureField [
	aStructureField registerClass == #integer ifTrue: [ 
		^ LowcodeFFIRegisterMarshallerInt64 new
			structureMember: aStructureField
	] ifFalse: [
		self assert: aStructureField registerClass == #float.
		^ LowcodeFFIRegisterMarshallerFloat64 new
			structureMember: aStructureField
	]

]
