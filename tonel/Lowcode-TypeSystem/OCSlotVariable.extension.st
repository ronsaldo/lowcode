Extension { #name : #OCSlotVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeReference: aLowcodeMethodBuilder type: aType [
	^ slot emitLowcodeReference: aLowcodeMethodBuilder type: aType
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeStore: aLowcodeMethodBuilder type: aType valueType: valueType [
	^ slot emitLowcodeStore: aLowcodeMethodBuilder valueType: valueType
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeValue: aLowcodeMethodBuilder type: variableType [
	^ slot emitLowcodeValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> lowcodeReferenceTypeFor: semanticAnalyzer [
	^ slot lowcodeReferenceType
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ slot lowcodeType
]
