"
I am a description of an actual argument passed via FFI into a called function. I am used for implementing the annoying splitting of structures into registers that happens in the SystemV ABI.
"
Class {
	#name : #LowcodeFFIArgumentDescription,
	#superclass : #Object,
	#instVars : [
		'argument',
		'size',
		'parameterClass',
		'temp',
		'integerRegisterCount',
		'floatRegisterCount',
		'registerMarshallers'
	],
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #accessing }
LowcodeFFIArgumentDescription >> argument [
	^ argument
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> argument: anObject [
	argument := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> floatRegisterCount [
	^ floatRegisterCount
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> floatRegisterCount: anObject [
	floatRegisterCount := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> integerRegisterCount [
	^ integerRegisterCount
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> integerRegisterCount: anObject [
	integerRegisterCount := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> parameterClass [
	^ parameterClass
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> parameterClass: anObject [
	parameterClass := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> registerCount [
	^ integerRegisterCount + floatRegisterCount
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> registerMarshallers [
	^ registerMarshallers
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> registerMarshallers: anObject [
	registerMarshallers := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> size [
	^ size
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> size: anObject [
	size := anObject
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> temp [
	^ temp
]

{ #category : #accessing }
LowcodeFFIArgumentDescription >> temp: anObject [
	temp := anObject
]
