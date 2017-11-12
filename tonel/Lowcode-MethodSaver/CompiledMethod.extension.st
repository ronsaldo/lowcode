Extension { #name : #CompiledMethod }

{ #category : #'*Lowcode-MethodSaver' }
CompiledMethod >> saveLowcodeMethodForDebuggingInto: aFileName [
	^ LowcodeMethodSaver new saveMethod: self into: aFileName
]
