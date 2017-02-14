"
I represent a description of a calling convention.
"
Class {
	#name : #LowcodeCallingConvention,
	#superclass : #Object,
	#category : #'Lowcode-UnifiedFFI-ABI'
}

{ #category : #'as yet unclassified' }
LowcodeCallingConvention class >> declareRegisterEnumeration: enumeration [
	enumeration doWithIndex: [ :registerName :index |
		self classPool at: registerName ifAbsent: [
			self addClassVarNamed: registerName
		].
	
		self classVarNamed: registerName put: index - 1
	]
]

{ #category : #accessing }
LowcodeCallingConvention >> areStructuresSplitInRegisters [
	^ false
]

{ #category : #accessing }
LowcodeCallingConvention >> computeStructureRegisterPassingLayout: aStructureClass [
	^ nil
	
]

{ #category : #accessing }
LowcodeCallingConvention >> floatRegisterParameters [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> hasStandardReturnRegisters [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> integerRegisterParameters [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> isStackCleanedByCaller [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> maxFloatRegisterSize [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> maxIntegerRegisterSize [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> maxStructureSplitSize [
	^ 0
]

{ #category : #accessing }
LowcodeCallingConvention >> shadowStackSpace [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeCallingConvention >> stackAlignment [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
LowcodeCallingConvention >> structureFieldRegisterMarshaller: aStructureField [
	self subclassResponsibility
]
