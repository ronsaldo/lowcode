"
I describe common things for x86-64 calling conventions, specially by providing convenience names for the CPU registers.
"
Class {
	#name : #LowcodeX64CallingConvention,
	#superclass : #LowcodeCallingConvention,
	#classVars : [
		'R10',
		'R11',
		'R12',
		'R13',
		'R14',
		'R15',
		'R8',
		'R9',
		'RAX',
		'RBP',
		'RBX',
		'RCX',
		'RDI',
		'RDX',
		'RSI',
		'RSP',
		'XMM0',
		'XMM1',
		'XMM10',
		'XMM11',
		'XMM12',
		'XMM13',
		'XMM14',
		'XMM15',
		'XMM2',
		'XMM3',
		'XMM4',
		'XMM5',
		'XMM6',
		'XMM7',
		'XMM8',
		'XMM9'
	],
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #initialization }
LowcodeX64CallingConvention class >> initialize [
	super initialize.
	
	self declareRegisterEnumeration: #(
		RAX RCX RDX RBX RSP RBP RSI RDI
		R8 R9 R10 R11 R12 R13 R14 R15
	).
	
	self declareRegisterEnumeration: #(
		XMM0 XMM1 XMM2 XMM3 XMM4 XMM5 XMM6 XMM7
		XMM8 XMM9 XMM10 XMM11 XMM12 XMM13 XMM14 XMM15
	)
]

{ #category : #testing }
LowcodeX64CallingConvention >> hasStandardReturnRegisters [
	^ true
]

{ #category : #accessing }
LowcodeX64CallingConvention >> maxFloatRegisterSize [
	^ 8
]

{ #category : #accessing }
LowcodeX64CallingConvention >> maxIntegerRegisterSize [
	^ 8
]
