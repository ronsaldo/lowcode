Extension { #name : #OCLiteralVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCLiteralVariable >> lowcodeTypeFor: semanticAnalyzer [
	| varValue |
	varValue := self value.
	^ varValue isClass ifTrue: [ varValue asLowcodeType classType ] ifFalse: [ LowcodeType object ]
]
