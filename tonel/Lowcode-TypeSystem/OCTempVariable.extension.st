Extension { #name : #OCTempVariable }

{ #category : #'*Lowcode-TypeSystem' }
OCTempVariable >> emitLowcodeStore: aLowcodeMethodBuilder type: variableType valueType: valueType [
	variableType emitLocalStore: aLowcodeMethodBuilder valueType: valueType name: name
]

{ #category : #'*Lowcode-TypeSystem' }
OCTempVariable >> emitLowcodeValue: aLowcodeMethodBuilder type: variableType [
	variableType emitLocalValue: aLowcodeMethodBuilder name: name
]

{ #category : #'*Lowcode-TypeSystem' }
OCTempVariable >> lowcodeTypeFor: semanticAnalyzer [
	^ semanticAnalyzer typeForTemporary: self
]
