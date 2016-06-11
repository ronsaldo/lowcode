Extension { #name : #Object }

{ #category : #'*Lowcode-TypeSystem' }
Object >> asObject [
	^ self
]

{ #category : #'*Lowcode-TypeSystem' }
Object >> lowcodeCheckArrayArgument: elementType elements: numberOfElements [
	self error: 'Expected a native array whose elements have the ' , elementType printString, ' and ' , numberOfElements printString, ' elements.'
]
