"
I am used to represent special opaque types.
"
Class {
	#name : #LowcodeOpaqueType,
	#superclass : #LowcodeType,
	#category : #'Lowcode-TypeSystem-Types'
}

{ #category : #comparing }
LowcodeOpaqueType >> = other [
	^ self class = other class
]

{ #category : #accessing }
LowcodeOpaqueType >> alignment [
	^ 0
]

{ #category : #comparing }
LowcodeOpaqueType >> hash [
	^ self class hash
]

{ #category : #accessing }
LowcodeOpaqueType >> size [
	^ 0
]
