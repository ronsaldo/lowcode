Extension { #name : #Object }

{ #category : #'*Lowcode-Execution' }
Object >> inlinePrimitiveFailed: errorCode [
	self halt.
]

{ #category : #'*Lowcode-Execution' }
Object >> isLowcodeMethod [
	^ false
]
