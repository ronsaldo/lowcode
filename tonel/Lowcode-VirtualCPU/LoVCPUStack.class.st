Class {
	#name : #LoVCPUStack,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'Lowcode-VirtualCPU'
}

{ #category : #initialization }
LoVCPUStack >> initialize [
	stack := OrderedCollection new.
	
]

{ #category : #stack }
LoVCPUStack >> popFloat32 [
	^ self popType: #float32
]

{ #category : #stack }
LoVCPUStack >> popFloat64 [
	^ self popType: #float64
]

{ #category : #stack }
LoVCPUStack >> popInt32 [
	^ self popType: #int32
]

{ #category : #stack }
LoVCPUStack >> popInt64 [
	^ self popType: #int64
]

{ #category : #stack }
LoVCPUStack >> popOop [
	^ self popType: #oop
]

{ #category : #stack }
LoVCPUStack >> popPointer [
	^ self popType: #pointer
]

{ #category : #stack }
LoVCPUStack >> popType: type [
	| res |
	stack ifEmpty: [ self error: 'Stack underflow' ].
	stack last second ~~ type ifTrue: [ self error: 'Stack type mismatch.' ].
	res := stack last first.
	stack removeLast.
	^ res
]

{ #category : #copying }
LoVCPUStack >> postCopy [
	stack := stack copy
]

{ #category : #stack }
LoVCPUStack >> push: value type: type [
	stack add: {value . type }
]

{ #category : #stack }
LoVCPUStack >> pushFloat32: word [
	self push: word type: #float32
]

{ #category : #stack }
LoVCPUStack >> pushFloat64: word [
	self push: word type: #float64
]

{ #category : #stack }
LoVCPUStack >> pushInt32: word [
	self push: word type: #int32
]

{ #category : #stack }
LoVCPUStack >> pushInt64: word [
	self push: word type: #int64
]

{ #category : #stack }
LoVCPUStack >> pushOop: word [
	self push: word type: #oop
]

{ #category : #stack }
LoVCPUStack >> pushPointer: word [
	self push: word type: #pointer
]
