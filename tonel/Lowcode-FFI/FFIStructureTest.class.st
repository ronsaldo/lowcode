Class {
	#name : #FFIStructureTest,
	#superclass : #TestCase,
	#category : #'Lowcode-FFI-Tests'
}

{ #category : #'as yet unclassified' }
FFIStructureTest >> returnStructure [
	^ self ffiCall: #(FFISampleExternalStructure returnSampleStruct()) module: './test.so'
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> returnStructurePointer [
	^ self ffiCall: #(FFISampleExternalStructure *returnSampleStructPointer()) module: './test.so'
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> structureArgument: arg [
	^ self ffiCall: #(void printFFISampleExternalStructure(FFISampleExternalStructure arg)) module: './test.so'
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> structureArgumentPointer: arg [
	^ self ffiCall: #(void printFFISampleExternalStructurePointer(FFISampleExternalStructure *arg)) module: './test.so'
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> testSampleExternalStructure [
	| struct |
	struct := FFISampleExternalStructure new.
	struct int1: 1;
		int2: 2;
		int3: 3;
		float1: 1.5;
		float2: 3.5;
		double1: 1.5.
	self assert: struct int1 equals: 1.
	self assert: struct int2 equals: 2.
	self assert: struct int3 equals: 3.
	self assert: struct float1 equals: 1.5.
	self assert: struct float2 equals: 3.5.
	self assert: struct double1 equals: 1.5.
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> testSampleExternalStructure2 [
	| struct struct2 |
	struct := FFISampleExternalStructure new.
	struct int1: 1;
		int2: 2;
		int3: 3;
		float1: 1.5;
		float2: 3.5;
		double1: 1.5.
	
	struct2 := FFISampleExternalStructure2 new.
	struct2 outerInt1: -1.
	struct2 innerStructure: struct.
	struct := struct2 innerStructure.
	
	self assert: struct int1 equals: 1.
	self assert: struct int2 equals: 2.
	self assert: struct int3 equals: 3.
	self assert: struct float1 equals: 1.5.
	self assert: struct float2 equals: 3.5.
	self assert: struct double1 equals: 1.5.
	self assert: struct2 outerInt1 equals: -1.

]

{ #category : #'as yet unclassified' }
FFIStructureTest >> testStructureArgument [
	| struct |
	struct := FFISampleExternalStructure new.
	struct int1: 1;
		int2: 2;
		int3: 3;
		float1: 1.5;
		float2: 3.5;
		double1: -1.5.
	self structureArgument: struct
]

{ #category : #'as yet unclassified' }
FFIStructureTest >> testStructureArgumentPointer [
	| struct |
	struct := FFISampleExternalStructure new.
	struct int1: 1;
		int2: 2;
		int3: 3;
		float1: 1.5;
		float2: 3.5;
		double1: -1.5.
	self structureArgumentPointer: struct
]
