Extension { #name : #OCSlotVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeStore: aLowcodeMethodBuilder [
	^ slot emitLowcodeStore: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> emitLowcodeValue: aLowcodeMethodBuilder [
	^ slot emitLowcodeValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
OCSlotVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ slot lowcodeType
]
