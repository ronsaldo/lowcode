Class {
	#name : #TWithNativeData,
	#superclass : #Trait,
	#traits : '{}\r\tcategory: \'Lowcode-OpalCompiler-Using\'',
	#instVars : [
		'named:'
	],
	#classVars : [
		'uses:'
	],
	#pools : [
		'}'
	],
	#category : 'Lowcode-OpalCompiler-Using'
}

{ #category : #'methodsFor:' }
TWithNativeData >> classSideCompilerClass [
	^ LowcodeOpalCompiler
]

{ #category : #'methodsFor:' }
TWithNativeData >> compilerClass [
	^ LowcodeOpalCompiler
]
