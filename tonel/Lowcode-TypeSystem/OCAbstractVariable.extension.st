Extension { #name : #OCAbstractVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> emitLowcodeStore: aLowcodeMethodBuilder [
	^ self emitStore: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> emitLowcodeValue: aLowcodeMethodBuilder [
	^ self emitValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCAbstractVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ LowcodeType object
]
