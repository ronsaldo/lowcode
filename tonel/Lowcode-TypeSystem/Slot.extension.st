Extension { #name : #Slot }

{ #category : #'*Lowcode-TypeSystem' }
Slot >> emitLowcodeStore: aLowcodeMethodBuilder [
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
