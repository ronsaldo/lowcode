"
I am a trait that provides support for native data.
"
Trait {
	#name : #TWithNativeData,
	#category : #'Lowcode-OpalCompiler-Using'
}

{ #category : #accessing }
TWithNativeData classSide >> classSideCompilerClass [
	^ LowcodeOpalCompiler
]

{ #category : #accessing }
TWithNativeData classSide >> compilerClass [
	^ LowcodeOpalCompiler
]
