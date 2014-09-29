Extension { #name : #CompiledMethod }

{ #category : #'*Lowcode-Execution' }
CompiledMethod >> lowcodeAssemblerMethod [
	| assoc |
	self numLiterals < 3 ifTrue: [ ^ nil ].
	assoc := self literalAt: self numLiterals - 2.
	assoc isVariableBinding ifFalse: [ ^ nil ].
	assoc key ~~ #lowcodeAssemblerMethod ifTrue: [ ^ nil ].
	^ assoc value
]
