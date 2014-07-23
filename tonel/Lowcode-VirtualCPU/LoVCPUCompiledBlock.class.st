Class {
	#name : #LoVCPUCompiledBlock,
	#superclass : #Object,
	#instVars : [
		'basicBlock',
		'label'
	],
	#category : #'Lowcode-VirtualCPU'
}

{ #category : #'instance creation' }
LoVCPUCompiledBlock class >> for: aBasicBlock [
	^ self new basicBlock: aBasicBlock
]

{ #category : #accessing }
LoVCPUCompiledBlock >> basicBlock [
	
	^ basicBlock
]

{ #category : #accessing }
LoVCPUCompiledBlock >> basicBlock: anObject [
	
	basicBlock := anObject
]

{ #category : #accessing }
LoVCPUCompiledBlock >> label [
	
	^ label
]

{ #category : #accessing }
LoVCPUCompiledBlock >> label: anObject [
	
	label := anObject
]
