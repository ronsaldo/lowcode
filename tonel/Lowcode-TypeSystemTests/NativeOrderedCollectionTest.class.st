"
An InternalStructureOrderedCollectionTest is a test class for testing the behavior of InternalStructureOrderedCollection
"
Class {
	#name : #NativeOrderedCollectionTest,
	#superclass : #TestCase,
	#category : #'Lowcode-TypeSystemTests'
}

{ #category : #'as yet unclassified' }
NativeOrderedCollectionTest >> testAdding [
	| collection element |
	collection := NativeOrderedCollection for: LowcodeVector3FTestClass.
	element := LowcodeVector3FTestClass new.
	collection add: element.
	self assert: (collection at: 1) = element.
	self assert: collection size = 1.
	self assert: collection isEmpty not.
]

{ #category : #'as yet unclassified' }
NativeOrderedCollectionTest >> testNew [
	| collection |
	collection := NativeOrderedCollection for: LowcodeVector3FTestClass.
	self assert: collection size = 0.
	self assert: collection isEmpty.
]
