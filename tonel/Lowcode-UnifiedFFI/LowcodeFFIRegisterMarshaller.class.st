"
I am a marshaller of arguments that are passed via CPU registers instead of the Stack.
"
Class {
	#name : #LowcodeFFIRegisterMarshaller,
	#superclass : #Object,
	#instVars : [
		'structureMember'
	],
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #marshalling }
LowcodeFFIRegisterMarshaller >> dereferencePointerWith: builder [
	self subclassResponsibility
]

{ #category : #initialization }
LowcodeFFIRegisterMarshaller >> initialize [
	structureMember := false.
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshaller >> marshallRegisterParameterWith: builder [
	structureMember ifTrue: [ self dereferencePointerWith: builder ]
]

{ #category : #marshalling }
LowcodeFFIRegisterMarshaller >> passRegister: aRegister with: builder [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeFFIRegisterMarshaller >> registerKind [
	self subclassResponsibility
]

{ #category : #accessing }
LowcodeFFIRegisterMarshaller >> structureMember [
	^ structureMember
]

{ #category : #accessing }
LowcodeFFIRegisterMarshaller >> structureMember: anObject [
	structureMember := anObject
]
