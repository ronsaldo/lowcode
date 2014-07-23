Class {
	#name : #LoVCPUInterpreterProxy,
	#superclass : #Object,
	#instVars : [
		'pointerSize',
		'pointer',
		'vcpu'
	],
	#category : #'Lowcode-VirtualCPU'
}

{ #category : #'generate proxy functions' }
LoVCPUInterpreterProxy class >> generateProxyFunctions [
	"
	self generateProxyFunctions
	"
	| numArgs code parts |
	self proxyFunctionTable doWithIndex: [ :proxyFunction :i |
		numArgs := proxyFunction numArgs.
		code := ByteString streamContents: [ :out |
			numArgs > 0 ifTrue: [
				parts := proxyFunction findTokens: ':'.
				parts doWithIndex: [:part :j |
					out nextPutAll: part , ': a' , j printString, ' '
				].
				out cr; tab; nextPutAll: '^ self proxyFunctionAt: ' , (i - 1) printString , ' args: { '.

				parts doWithIndex: [:part :j |
					j > 1 ifTrue: [ out nextPutAll: ' . ' ].
					out nextPutAll: 'a' , j printString.
				].
				out nextPutAll: '}'
			] ifFalse: [ 
				out nextPutAll: proxyFunction; cr; tab; nextPutAll: '^ self proxyFunctionAt: ' , (i - 1) printString
			]
	 	].
	
		self compile: code classified: 'interpreter proxy generated functions'
	]
]

{ #category : #'generate proxy functions' }
LoVCPUInterpreterProxy class >> proxyFunctionTable [
	^ #(
	minorVersion
	majorVersion
	pop:
	pop:thenPush
	push:
	pushBool:
	pushFloat:
	pushInteger:
	stackFloatValue:
	stackIntegerValue:
	stackObjectValue:
	stackValue:
	argumentCountOf:
	arrayValueOf:
	byteSizeOf:
	fetchArray:ofObject:
	fetchClassOf:
	fetchFloat:ofObject:
	fetchInteger:ofObject:
	fetchPointer:ofObject:
	fetchWord:ofObject:
	obsoleteDontUseThisFetchWordofObject
	firstFixedField:
	firstIndexableField:
	literal:ofMethod:
	literalCountOf:
	methodArgumentCount:
	methodPrimitiveIndex:
	primitiveIndexOf:
	sizeOfSTArrayFromCPrimitive:
	slotSizeOf:
	stObject:at:
	stObject:at:put:
	stSizeOf:
	storeInteger:ofObject:withValue:
	storePointer:ofObject:withValue:
	isKindOf:
	isMemberOf:
	isBytes:
	isFloatObject:
	isIndexable:
	isIntegerObject:
	isIntegerValue:
	isPointers:
	isWeak:
	isWords:
	isWordsOrBytes:
	booleanValueOf:
	checkedIntegerValueOf:
	floatObjectOf:
	floatValueOf:
	integerObjectOf:
	integerValueOf:
	positive32BitIntegerFor:
	positive32BitValueOf:
	characterTable
	displayObject
	falseObject
	nilObject
	trueObject
	classArray
	classBitmap
	classByteArray
	classCharacter
	classFloat
	classLargePositiveInteger
	classPoint
	classSemaphore
	classSmallInteger
	classString
	clone:
	instantiateClass:indexableSize:
	makePointwithxValue:yValue:
	popRemappableOop
	pushRemappableOop:
	become:with:
	byteSwapped:
	failed
	fullDisplayUpdate
	fullGC
	incrementalGC
	primitiveFail
	showDisplayBits:Left:Top:Right:Bottom:
	signalSemaphoreWithIndex:
	success:
	superclassOf:
	compilerHookVector
	setCompilerInitialized:
	loadBitBltFrom:
	copyBits:
	copyBitsFrom:to:at:
	
	classLargeNegativeInteger
	signed32BitIntegerFor:
	signed32BitValueOf:
	includesBehavior:ThatOf:
	primitiveMethod
	
	classExternalAddress
	classExternalData
	classExternalFunction
	classExternalLibrary
	classExternalStructure
	ioLoadModule:OfLength:
	ioLoadSymbol:OfLength:FromModule:
	isInMemory:
	
	ioLoadFunction:From:
	ioMicroMSecs
	
	positive64BitIntegerFor:
	positive64BitValueOf:
	signed64BitIntegerFor:
	signed64BitValueOf:

	isArray:
	forceInterruptCheck

	fetchLong32:ofObject:
	getThisSessionID
	ioFilename:fromString:ofLength:resolveAliases:
	vmEndianness
	
	callbackEnter:
	callbackLeave:
	addGCRoot:
	removeGCRoot:
	
	primitiveFailFor:
	setInterruptCheckChain:
	classAlien
	classUnsafeAlien
	sendInvokeCallback:Stack:Registers:Jmpbuf:
	reestablishContextPriorToCallback:
	getStackPointer
	isOopImmutable:
	isOopMutable:
	
	methodArg:
	objectArg:
	integerArg:
	floatArg:
	methodReturnValue:
	topRemappableOop
	
	disownVM:
	ownVM:
	addHighPriorityTickee:Period:
	addSynchronousTickee:Period:Round:
	utcMicroseconds
	tenuringIncrementalGC
	isYoung:
	isKind:OfClass:
	primitiveErrorTable
	primitiveFailureCode
	instanceSizeOf:

	"Don 't care of those"
	sendInvokeCallbackContext:
	returnAsThroughCallbackContext
	signedMachineIntegerValueOf
	stackSignedMachineIntegerValue
	positiveMachineIntegerValueOf
	stackPositiveMachineIntegerValue
	getInterruptPending
	cStringOrNullFor
	startOfAlienData
	sizeOfAlienData
	signalNoResume
	)
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> addGCRoot: a1 [ 
	^ self proxyFunctionAt: 119 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> addHighPriorityTickee: a1 Period: a2 [ 
	^ self proxyFunctionAt: 138 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> addSynchronousTickee: a1 Period: a2 Round: a3 [ 
	^ self proxyFunctionAt: 139 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> argumentCountOf: a1 [ 
	^ self proxyFunctionAt: 13 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> arrayValueOf: a1 [ 
	^ self proxyFunctionAt: 14 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> become: a1 with: a2 [ 
	^ self proxyFunctionAt: 76 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> booleanValueOf: a1 [ 
	^ self proxyFunctionAt: 48 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> byteSizeOf: a1 [ 
	^ self proxyFunctionAt: 15 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> byteSwapped: a1 [ 
	^ self proxyFunctionAt: 77 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> cStringOrNullFor [
	^ self proxyFunctionAt: 154
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> callbackEnter: a1 [ 
	^ self proxyFunctionAt: 117 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> callbackLeave: a1 [ 
	^ self proxyFunctionAt: 118 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> characterTable [
	^ self proxyFunctionAt: 56
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> checkedIntegerValueOf: a1 [ 
	^ self proxyFunctionAt: 49 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classAlien [
	^ self proxyFunctionAt: 123
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classArray [
	^ self proxyFunctionAt: 61
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classBitmap [
	^ self proxyFunctionAt: 62
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classByteArray [
	^ self proxyFunctionAt: 63
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classCharacter [
	^ self proxyFunctionAt: 64
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classExternalAddress [
	^ self proxyFunctionAt: 97
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classExternalData [
	^ self proxyFunctionAt: 98
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classExternalFunction [
	^ self proxyFunctionAt: 99
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classExternalLibrary [
	^ self proxyFunctionAt: 100
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classExternalStructure [
	^ self proxyFunctionAt: 101
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classFloat [
	^ self proxyFunctionAt: 65
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classLargeNegativeInteger [
	^ self proxyFunctionAt: 92
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classLargePositiveInteger [
	^ self proxyFunctionAt: 66
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classPoint [
	^ self proxyFunctionAt: 67
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classSemaphore [
	^ self proxyFunctionAt: 68
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classSmallInteger [
	^ self proxyFunctionAt: 69
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classString [
	^ self proxyFunctionAt: 70
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> classUnsafeAlien [
	^ self proxyFunctionAt: 124
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> clone: a1 [ 
	^ self proxyFunctionAt: 71 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> compilerHookVector [
	^ self proxyFunctionAt: 87
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> copyBits: a1 [ 
	^ self proxyFunctionAt: 90 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> copyBitsFrom: a1 to: a2 at: a3 [ 
	^ self proxyFunctionAt: 91 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> disownVM: a1 [ 
	^ self proxyFunctionAt: 136 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> displayObject [
	^ self proxyFunctionAt: 57
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> failed [
	^ self proxyFunctionAt: 78
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> falseObject [
	^ self proxyFunctionAt: 58
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchArray: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 16 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchClassOf: a1 [ 
	^ self proxyFunctionAt: 17 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchFloat: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 18 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchInteger: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 19 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchLong32: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 113 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchPointer: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 20 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fetchWord: a1 ofObject: a2 [ 
	^ self proxyFunctionAt: 21 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> firstFixedField: a1 [ 
	^ self proxyFunctionAt: 23 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> firstIndexableField: a1 [ 
	^ self proxyFunctionAt: 24 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> floatArg: a1 [ 
	^ self proxyFunctionAt: 133 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> floatObjectOf: a1 [ 
	^ self proxyFunctionAt: 50 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> floatValueOf: a1 [ 
	^ self proxyFunctionAt: 51 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> forceInterruptCheck [
	^ self proxyFunctionAt: 112
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fullDisplayUpdate [
	^ self proxyFunctionAt: 79
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> fullGC [
	^ self proxyFunctionAt: 80
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> getInterruptPending [
	^ self proxyFunctionAt: 153
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> getStackPointer [
	^ self proxyFunctionAt: 127
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> getThisSessionID [
	^ self proxyFunctionAt: 114
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> includesBehavior: a1 ThatOf: a2 [ 
	^ self proxyFunctionAt: 95 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> incrementalGC [
	^ self proxyFunctionAt: 81
]

{ #category : #initialization }
LoVCPUInterpreterProxy >> initialize [
	pointerSize := FFI pointerSize
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> instanceSizeOf: a1 [ 
	^ self proxyFunctionAt: 146 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> instantiateClass: a1 indexableSize: a2 [ 
	^ self proxyFunctionAt: 72 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> integerArg: a1 [ 
	^ self proxyFunctionAt: 132 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> integerObjectOf: a1 [ 
	^ self proxyFunctionAt: 52 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> integerValueOf: a1 [ 
	^ self proxyFunctionAt: 53 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ioFilename: a1 fromString: a2 ofLength: a3 resolveAliases: a4 [ 
	^ self proxyFunctionAt: 115 args: { a1 . a2 . a3 . a4}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ioLoadFunction: a1 From: a2 [ 
	^ self proxyFunctionAt: 105 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ioLoadModule: a1 OfLength: a2 [ 
	^ self proxyFunctionAt: 102 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ioLoadSymbol: a1 OfLength: a2 FromModule: a3 [ 
	^ self proxyFunctionAt: 103 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ioMicroMSecs [
	^ self proxyFunctionAt: 106
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isArray: a1 [ 
	^ self proxyFunctionAt: 111 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isBytes: a1 [ 
	^ self proxyFunctionAt: 39 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isFloatObject: a1 [ 
	^ self proxyFunctionAt: 40 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isInMemory: a1 [ 
	^ self proxyFunctionAt: 104 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isIndexable: a1 [ 
	^ self proxyFunctionAt: 41 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isIntegerObject: a1 [ 
	^ self proxyFunctionAt: 42 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isIntegerValue: a1 [ 
	^ self proxyFunctionAt: 43 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isKind: a1 OfClass: a2 [ 
	^ self proxyFunctionAt: 143 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isKindOf: a1 [ 
	^ self proxyFunctionAt: 37 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isMemberOf: a1 [ 
	^ self proxyFunctionAt: 38 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isOopImmutable: a1 [ 
	^ self proxyFunctionAt: 128 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isOopMutable: a1 [ 
	^ self proxyFunctionAt: 129 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isPointers: a1 [ 
	^ self proxyFunctionAt: 44 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isWeak: a1 [ 
	^ self proxyFunctionAt: 45 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isWords: a1 [ 
	^ self proxyFunctionAt: 46 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isWordsOrBytes: a1 [ 
	^ self proxyFunctionAt: 47 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> isYoung: a1 [ 
	^ self proxyFunctionAt: 142 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> literal: a1 ofMethod: a2 [ 
	^ self proxyFunctionAt: 25 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> literalCountOf: a1 [ 
	^ self proxyFunctionAt: 26 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> loadBitBltFrom: a1 [ 
	^ self proxyFunctionAt: 89 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> majorVersion [
	^ self proxyFunctionAt: 1
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> makePointwithxValue: a1 yValue: a2 [ 
	^ self proxyFunctionAt: 73 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> methodArg: a1 [ 
	^ self proxyFunctionAt: 130 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> methodArgumentCount: a1 [ 
	^ self proxyFunctionAt: 27 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> methodPrimitiveIndex: a1 [ 
	^ self proxyFunctionAt: 28 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> methodReturnValue: a1 [ 
	^ self proxyFunctionAt: 134 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> minorVersion [
	^ self proxyFunctionAt: 0
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> nilObject [
	^ self proxyFunctionAt: 59
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> objectArg: a1 [ 
	^ self proxyFunctionAt: 131 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> obsoleteDontUseThisFetchWordofObject [
	^ self proxyFunctionAt: 22
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> ownVM: a1 [ 
	^ self proxyFunctionAt: 137 args: { a1}
]

{ #category : #accessing }
LoVCPUInterpreterProxy >> pointer [
	
	^ pointer
]

{ #category : #accessing }
LoVCPUInterpreterProxy >> pointer: anObject [
	
	pointer := anObject
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> pop: a1 [ 
	^ self proxyFunctionAt: 3 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> popRemappableOop [
	^ self proxyFunctionAt: 74
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> positive32BitIntegerFor: a1 [ 
	^ self proxyFunctionAt: 54 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> positive32BitValueOf: a1 [ 
	^ self proxyFunctionAt: 55 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> positive64BitIntegerFor: a1 [ 
	^ self proxyFunctionAt: 107 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> positive64BitValueOf: a1 [ 
	^ self proxyFunctionAt: 108 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> positiveMachineIntegerValueOf [
	^ self proxyFunctionAt: 151
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveErrorTable [
	^ self proxyFunctionAt: 144
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveFail [
	^ self proxyFunctionAt: 82
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveFailFor: a1 [ 
	^ self proxyFunctionAt: 121 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveFailureCode [
	^ self proxyFunctionAt: 145
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveIndexOf: a1 [ 
	^ self proxyFunctionAt: 29 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> primitiveMethod [
	^ self proxyFunctionAt: 96
]

{ #category : #calling }
LoVCPUInterpreterProxy >> proxyFunctionAt: fieldIndex [
	^ self proxyFunctionAt: fieldIndex args: #()
]

{ #category : #calling }
LoVCPUInterpreterProxy >> proxyFunctionAt: fieldIndex args: args [
	| functionPointer res |
	functionPointer := (pointer + (vcpu word: pointerSize*fieldIndex)) readWord.
	res := vcpu word: 0.
	
	vcpu 
		cdeclCall: [ :call |
			args reverseDo: [ :arg | call push: arg ].
			call address: functionPointer
		]
		alignment: 32.
	vcpu inputs: #() outputs: {#EAX -> res} clobbered: #() do: [  ] simulate: [  ].
	^ res
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> push: a1 [ 
	^ self proxyFunctionAt: 5 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> pushBool: a1 [ 
	^ self proxyFunctionAt: 6 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> pushFloat: a1 [ 
	^ self proxyFunctionAt: 7 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> pushInteger: a1 [ 
	^ self proxyFunctionAt: 8 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> pushRemappableOop: a1 [ 
	^ self proxyFunctionAt: 75 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> reestablishContextPriorToCallback: a1 [ 
	^ self proxyFunctionAt: 126 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> removeGCRoot: a1 [ 
	^ self proxyFunctionAt: 120 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> returnAsThroughCallbackContext [
	^ self proxyFunctionAt: 148
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> sendInvokeCallback: a1 Stack: a2 Registers: a3 Jmpbuf: a4 [ 
	^ self proxyFunctionAt: 125 args: { a1 . a2 . a3 . a4}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> sendInvokeCallbackContext: a1 [ 
	^ self proxyFunctionAt: 147 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> setCompilerInitialized: a1 [ 
	^ self proxyFunctionAt: 88 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> setInterruptCheckChain: a1 [ 
	^ self proxyFunctionAt: 122 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> showDisplayBits: a1 Left: a2 Top: a3 Right: a4 Bottom: a5 [ 
	^ self proxyFunctionAt: 83 args: { a1 . a2 . a3 . a4 . a5}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signalNoResume [
	^ self proxyFunctionAt: 157
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signalSemaphoreWithIndex: a1 [ 
	^ self proxyFunctionAt: 84 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signed32BitIntegerFor: a1 [ 
	^ self proxyFunctionAt: 93 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signed32BitValueOf: a1 [ 
	^ self proxyFunctionAt: 94 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signed64BitIntegerFor: a1 [ 
	^ self proxyFunctionAt: 109 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signed64BitValueOf: a1 [ 
	^ self proxyFunctionAt: 110 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> signedMachineIntegerValueOf [
	^ self proxyFunctionAt: 149
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> sizeOfAlienData [
	^ self proxyFunctionAt: 156
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> sizeOfSTArrayFromCPrimitive: a1 [ 
	^ self proxyFunctionAt: 30 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> slotSizeOf: a1 [ 
	^ self proxyFunctionAt: 31 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stObject: a1 at: a2 [ 
	^ self proxyFunctionAt: 32 args: { a1 . a2}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stObject: a1 at: a2 put: a3 [ 
	^ self proxyFunctionAt: 33 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stSizeOf: a1 [ 
	^ self proxyFunctionAt: 34 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackFloatValue: a1 [ 
	^ self proxyFunctionAt: 9 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackIntegerValue: a1 [ 
	^ self proxyFunctionAt: 10 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackObjectValue: a1 [ 
	^ self proxyFunctionAt: 11 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackPositiveMachineIntegerValue [
	^ self proxyFunctionAt: 152
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackSignedMachineIntegerValue [
	^ self proxyFunctionAt: 150
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> stackValue: a1 [ 
	^ self proxyFunctionAt: 12 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> startOfAlienData [
	^ self proxyFunctionAt: 155
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> storeInteger: a1 ofObject: a2 withValue: a3 [ 
	^ self proxyFunctionAt: 35 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> storePointer: a1 ofObject: a2 withValue: a3 [ 
	^ self proxyFunctionAt: 36 args: { a1 . a2 . a3}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> success: a1 [ 
	^ self proxyFunctionAt: 85 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> superclassOf: a1 [ 
	^ self proxyFunctionAt: 86 args: { a1}
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> tenuringIncrementalGC [
	^ self proxyFunctionAt: 141
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> thenPush [
	^ self proxyFunctionAt: 4
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> topRemappableOop [
	^ self proxyFunctionAt: 135
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> trueObject [
	^ self proxyFunctionAt: 60
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> utcMicroseconds [
	^ self proxyFunctionAt: 140
]

{ #category : #accessing }
LoVCPUInterpreterProxy >> vcpu [
	
	^ vcpu
]

{ #category : #accessing }
LoVCPUInterpreterProxy >> vcpu: anObject [
	
	vcpu := anObject
]

{ #category : #'interpreter proxy generated functions' }
LoVCPUInterpreterProxy >> vmEndianness [
	^ self proxyFunctionAt: 116
]
