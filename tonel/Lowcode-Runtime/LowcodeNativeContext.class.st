Class {
	#name : #LowcodeNativeContext,
	#superclass : #Object,
	#type : #bytes,
	#classVars : [
		'SignalingObject'
	],
	#category : #'Lowcode-Runtime'
}

{ #category : #'context presence signaling' }
LowcodeNativeContext class >> signalingObject [
	SignalingObject ifNil: [ SignalingObject := Object new ].
	^ SignalingObject
]
