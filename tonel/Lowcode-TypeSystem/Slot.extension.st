Extension { #name : #Slot }

{ #category : #'*Lowcode-TypeSystem' }
Slot >> emitLowcodeStore: aLowcodeMethodBuilder valueType: valueType [
	^ self emitStore: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
Slot >> emitLowcodeValue: aLowcodeMethodBuilder [
	^ self emitValue: aLowcodeMethodBuilder
]

{ #category : #'*Lowcode-TypeSystem' }
Slot >> lowcodeType [
	^ LowcodeType object
]
