Class {
	#name : #FFIPlatformLinuxX86,
	#superclass : #FFILowcodePlatform,
	#category : #'Lowcode-Linux32'
}

{ #category : #'as yet unclassified' }
FFIPlatformLinuxX86 class >> isCurrentPlatform [
	^ true
]

{ #category : #'as yet unclassified' }
FFIPlatformLinuxX86 >> pointerSize [
	^ 4
]

{ #category : #'as yet unclassified' }
FFIPlatformLinuxX86 >> stackAlignment [
	^ 16
]
