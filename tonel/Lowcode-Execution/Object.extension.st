Extension { #name : #Object }

{ #category : #'*Lowcode-Execution' }
Object >> inlinePrimitiveFailed: errorCode [
	^ self inlinePrimitiveFailed: errorCode in: thisContext sender
]

{ #category : #'*Lowcode-Execution' }
Object >> inlinePrimitiveFailed: errorCode in: failureContext [
	^ Lowcode inlinePrimitiveFailed: errorCode in: failureContext
]

{ #category : #'*Lowcode-Execution' }
Object >> isLowcodeMethod [
	^ false
]
