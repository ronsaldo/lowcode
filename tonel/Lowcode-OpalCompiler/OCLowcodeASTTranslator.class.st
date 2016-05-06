Class {
	#name : #OCLowcodeASTTranslator,
	#superclass : #OCASTTranslator,
	#category : #'Lowcode-OpalCompiler-Translator'
}

{ #category : #initialization }
OCLowcodeASTTranslator >> classForEffect [
	^ OCLowcodeASTTranslatorForEffect
]

{ #category : #initialization }
OCLowcodeASTTranslator >> classForValue [
	^ OCLowcodeASTTranslatorForValue
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> emitConversionFrom: sourceType to: targetType [
	Transcript show: 'Convert from ' , sourceType printString , ' -> ' , targetType printString
]

{ #category : #initialization }
OCLowcodeASTTranslator >> initialize [

	methodBuilder := IRBuilder new.
	effectTranslator := self as: self classForEffect.
	valueTranslator := self as: self classForValue.
	effectTranslator instVarNamed: #effectTranslator put: effectTranslator.
	effectTranslator instVarNamed: #valueTranslator put: valueTranslator.
	valueTranslator instVarNamed: #valueTranslator put: valueTranslator.
]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitMethodNode: aMethodNode [
	"TODO: Add the support for the native local variables."
	super visitMethodNode: aMethodNode.

]

{ #category : #'visitor-double dispatching' }
OCLowcodeASTTranslator >> visitReturnNode: aReturnNode [ 
	| valueType |
	valueTranslator visitNode: aReturnNode value.
	
	valueType := aReturnNode value propertyAt: #type.
	self emitConversionFrom: valueType to: LowcodeType object.
	methodBuilder returnTop.
		

]
