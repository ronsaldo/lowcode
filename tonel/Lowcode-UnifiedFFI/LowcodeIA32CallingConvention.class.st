"
I describe common things for x86-32 calling conventions, specially by providing convenience names for the CPU registers.
"
Class {
	#name : #LowcodeIA32CallingConvention,
	#superclass : #LowcodeCallingConvention,
	#classVars : [
		'EAX',
		'EBP',
		'EBX',
		'ECX',
		'EDI',
		'EDX',
		'ESI',
		'ESP',
		'XMM0',
		'XMM1',
		'XMM2',
		'XMM3',
		'XMM4',
		'XMM5',
		'XMM6',
		'XMM7'
	],
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #initialization }
LowcodeIA32CallingConvention class >> initialize [
	super initialize.

	self declareRegisterEnumeration: #(
		EAX ECX EDX EBX ESP EBP ESI EDI
	).
		
	self declareRegisterEnumeration: #(
		XMM0 XMM1 XMM2 XMM3 XMM4 XMM5 XMM6 XMM7
	).
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> floatRegisterParameters [
	^ #()
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> hasStandardReturnRegisters [
	^ true
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> integerRegisterParameters [
	^ #()
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> isStackCleanedByCaller [
	^ true
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> maxFloatRegisterSize [
	^ 8
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> maxIntegerRegisterSize [
	^ 4
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> shadowStackSpace [
	^ 0
]

{ #category : #accessing }
LowcodeIA32CallingConvention >> stackAlignment [
	"GCC assumes on linux a 16 byte stack alignment. Lets not worrry about Window."
	^ 16
]
