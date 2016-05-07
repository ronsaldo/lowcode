Extension { #name : #OCSlotVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeStore: aLowcodeMethodBuilder type: variableType [
	^ slot emitLowcodeStore: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeValue: aLowcodeMethodBuilder type: variableType [
	^ slot emitLowcodeValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ slot lowcodeType
]
