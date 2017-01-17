"
I represent the ABI used by a platform.
"
Class {
	#name : #LowcodeABI,
	#superclass : #Object,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #accessing }
LowcodeABI class >> current [
	^ self forPlatform: OSPlatform current
]

{ #category : #accessing }
LowcodeABI class >> forCPU: aCPU [
	self allSubclassesDo: [ :subclass |
		(subclass isForCPU: aCPU) ifTrue: [ ^ subclass new ]
	].
	^ self error: 'unsupported cpu ' , aCPU
]

{ #category : #accessing }
LowcodeABI class >> forPlatform: anOSPlatform [
	^ anOSPlatform lowcodeABI
]

{ #category : #testing }
LowcodeABI class >> isForCPU: aCPUName [
	^ false
]

{ #category : #accessing }
LowcodeABI >> abiName [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeABI >> architectureName [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeABI >> callingConventionName [
	self subclassResponsibility
]
