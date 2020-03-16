Class {
	#name : #LowcodeMemoryAccessorsSettings,
	#superclass : #Object,
	#classVars : [
		'MemoryAccessorSelectors'
	],
	#category : #'Lowcode-MemoryAccessors'
}

{ #category : #'class initialization' }
LowcodeMemoryAccessorsSettings class >> initialize [
	MemoryAccessorSelectors :=  #(
		(DoubleAt: doubleAt:)
		(DoubleAt:put: doubleAt:put:)
		(FloatAt: floatAt:)
		(FloatAt:put: floatAt:put:)
		(PointerAt: pointerAt:)
		(PointerAt:put: pointerAt:put:)
		(SignedByteAt: signedByteAt:)
		(SignedByteAt:put: signedByteAt:put:)
		(SignedLongAt: signedLongAt:)
		(SignedLongAt:put: signedLongAt:put:)
		(SignedLongLongAt: signedLongLongAt:)
		(SignedLongLongAt:put: signedLongLongAt:put:)
		(SignedShortAt: signedShortAt:)
		(SignedShortAt:put: signedShortAt:put:)
		(UnsignedByteAt: unsignedByteAt:)
		(UnsignedByteAt:put: unsignedByteAt:put:)
		(UnsignedLongAt: unsignedLongAt:)
		(UnsignedLongAt:put: unsignedLongAt:put:)
		(UnsignedLongLongAt: unsignedLongLongAt:)
		(UnsignedLongLongAt:put: unsignedLongLongAt:put:)
		(UnsignedShortAt: unsignedShortAt:)
		(UnsignedShortAt:put: unsignedShortAt:put:)
	).
	
]

{ #category : #'class initialization' }
LowcodeMemoryAccessorsSettings class >> installAccessorsWithPrefix: prefix [
	[
	{ ByteArray . ExternalAddress } do: [ :cls |
		MemoryAccessorSelectors do: [ :suffixAndSelector |
			| replacementSelector selector |
			replacementSelector := (prefix , suffixAndSelector first) asSymbol.
			selector := suffixAndSelector second.
			cls methodDict at: replacementSelector ifPresent: [ :replacement |
				cls methodDict at: selector ifPresent: [ :oldVersion |
					cls methodDict at: selector put: (replacement copy selector: selector; yourself)
				]
			]
		]
	].
	CompiledMethod flushCache.
	] valueUnpreemptively
]

{ #category : #'as yet unclassified' }
LowcodeMemoryAccessorsSettings class >> installFFIKernelBased [
	<script>
	self installAccessorsWithPrefix: 'ffi'
]

{ #category : #'as yet unclassified' }
LowcodeMemoryAccessorsSettings class >> installLowcodeBased [
	<script>
	self installAccessorsWithPrefix: 'lc'
]
