Extension { #name : #OCAbstractVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> emitLowcodeStore: aLowcodeMethodBuilder type: aType valueType: valueType [
	^ self emitStore: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> emitLowcodeValue: aLowcodeMethodBuilder type: aType [
	^ self emitValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ LowcodeType object
]
