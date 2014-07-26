Class {
	#name : #LowcodeLLVMEngine,
	#superclass : #LowcodeEngine,
	#category : #'Lowcode-LLVM'
}

{ #category : #testing }
LowcodeLLVMEngine class >> isSuitable [
	^ self isSupported 
]

{ #category : #testing }
LowcodeLLVMEngine class >> isSupported [
	<primitive: #primitiveIsSupported module: #LowcodeLLVMPlugin error:errorCode>
	^ false
]
