"
Here the constants of the Lowcode assembler are placed.
This is used mainly for naming the registers.
"
Class {
	#name : #LowcodeAssemblerConstants,
	#superclass : #SharedPool,
	#classVars : [
		'FR0',
		'FR1',
		'FR10',
		'FR11',
		'FR12',
		'FR13',
		'FR14',
		'FR15',
		'FR2',
		'FR3',
		'FR4',
		'FR5',
		'FR6',
		'FR7',
		'FR8',
		'FR9',
		'IR0',
		'IR1',
		'IR10',
		'IR11',
		'IR12',
		'IR13',
		'IR14',
		'IR15',
		'IR2',
		'IR3',
		'IR4',
		'IR5',
		'IR6',
		'IR7',
		'IR8',
		'IR9',
		'OR0',
		'OR1',
		'OR10',
		'OR11',
		'OR12',
		'OR13',
		'OR14',
		'OR15',
		'OR2',
		'OR3',
		'OR4',
		'OR5',
		'OR6',
		'OR7',
		'OR8',
		'OR9'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #arguments }
LowcodeAssemblerConstants class >> floatRegister: id [
	^ LowcodeRegisterIdentifier new: id type: #float
]

{ #category : #'class initialization' }
LowcodeAssemblerConstants class >> initialize [
	"
	self initialize.
	"
	self initializeIntegerRegisters.
	self initializeFloatRegisters.
	self initializeOopRegisters.
]

{ #category : #initialization }
LowcodeAssemblerConstants class >> initializeFloatRegisters [
	FR0 := self floatRegister: 0.
	FR1 := self floatRegister: 1.
	FR2 := self floatRegister: 2.
	FR3 := self floatRegister: 3.
	FR4 := self floatRegister: 4.
	FR5 := self floatRegister: 5.
	FR6 := self floatRegister: 6.
	FR7 := self floatRegister: 7.
	FR8 := self floatRegister: 8.
	FR9 := self floatRegister: 9.
	FR10 := self floatRegister: 10.
	FR11 := self floatRegister: 11.
	FR12 := self floatRegister: 12.
	FR13 := self floatRegister: 13.
	FR14 := self floatRegister: 14.
	FR15 := self floatRegister: 15.
]

{ #category : #initialization }
LowcodeAssemblerConstants class >> initializeIntegerRegisters [
	IR0 := self intRegister: 0.
	IR1 := self intRegister: 1.
	IR2 := self intRegister: 2.
	IR3 := self intRegister: 3.
	IR4 := self intRegister: 4.
	IR5 := self intRegister: 5.
	IR6 := self intRegister: 6.
	IR7 := self intRegister: 7.
	IR8 := self intRegister: 8.
	IR9 := self intRegister: 9.
	IR10 := self intRegister: 10.
	IR11 := self intRegister: 11.
	IR12 := self intRegister: 12.
	IR13 := self intRegister: 13.
	IR14 := self intRegister: 14.
	IR15 := self intRegister: 15.
]

{ #category : #initialization }
LowcodeAssemblerConstants class >> initializeOopRegisters [
	OR0 := self oopRegister: 0.
	OR1 := self oopRegister: 1.
	OR2 := self oopRegister: 2.
	OR3 := self oopRegister: 3.
	OR4 := self oopRegister: 4.
	OR5 := self oopRegister: 5.
	OR6 := self oopRegister: 6.
	OR7 := self oopRegister: 7.
	OR8 := self oopRegister: 8.
	OR9 := self oopRegister: 9.
	OR10 := self oopRegister: 10.
	OR11 := self oopRegister: 11.
	OR12 := self oopRegister: 12.
	OR13 := self oopRegister: 13.
	OR14 := self oopRegister: 14.
	OR15 := self oopRegister: 15.
]

{ #category : #arguments }
LowcodeAssemblerConstants class >> intRegister: id [
	^ LowcodeRegisterIdentifier new: id type: #int
]

{ #category : #arguments }
LowcodeAssemblerConstants class >> oopRegister: id [
	^ LowcodeRegisterIdentifier new: id type: #oop
]
