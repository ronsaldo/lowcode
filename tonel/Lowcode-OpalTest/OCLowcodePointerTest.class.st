"
I have tests for pointers using the Lowcode Opal compiler
"
Class {
	#name : #OCLowcodePointerTest,
	#superclass : #TestCase,
	#traits : 'TWithNativeData',
	#classTraits : 'TWithNativeData classTrait',
	#category : #'Lowcode-OpalTest'
}

{ #category : #'as yet unclassified' }
OCLowcodePointerTest >> allocateInt [
	^ #int nativeNew
]

{ #category : #'as yet unclassified' }
OCLowcodePointerTest >> allocateIntWith2 [
	^ (#int nativeNew) value: 2; yourself
]

{ #category : #tests }
OCLowcodePointerTest >> testAllocateInt [
	| pointer |
	pointer := self allocateInt.
	[
		self assert: pointer isNull not.
	] ensure: [ pointer delete ]
]

{ #category : #tests }
OCLowcodePointerTest >> testAllocateIntWith2 [
	| pointer |
	pointer := self allocateIntWith2.
	[
		self assert: pointer value equals: 2.
		self assert: pointer isNull not.
	] ensure: [ pointer delete ]
]
