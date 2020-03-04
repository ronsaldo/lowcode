Class {
	#name : #LowcodeIRHereCompilerPlugin,
	#superclass : #OCCompilerASTPlugin,
	#category : #'Lowcode-IRBuilder-Opal'
}

{ #category : #'class initialization' }
LowcodeIRHereCompilerPlugin class >> initialize [

	self install
]

{ #category : #'class initialization' }
LowcodeIRHereCompilerPlugin class >> install [
	<script>
	(CompilationContext defaultTransformationPlugins includes: self)
		ifTrue: [ ^ self ].
	CompilationContext addDefaultTransformationPlugin: self.
	self recompileSenders
]

{ #category : #private }
LowcodeIRHereCompilerPlugin class >> priority [
	^ -10
]

{ #category : #'class initialization' }
LowcodeIRHereCompilerPlugin class >> recompileSenders [
	| pragmaCollector |
	pragmaCollector := PragmaCollector
		filter: [ :pragma | pragma selector = #useLowcodeIRBuilder ].
	pragmaCollector reset do: [ :pragma | self recompileSendersOf: pragma method ]
]

{ #category : #'class initialization' }
LowcodeIRHereCompilerPlugin class >> recompileSendersOf: aCompiledMethod [
	aCompiledMethod senders do: [ :sender | sender recompile ]
]

{ #category : #'class initialization' }
LowcodeIRHereCompilerPlugin class >> uninstall [
	<script>
	CompilationContext removeDefaultTransformationPlugin: self.
	self recompileSenders
]

{ #category : #api }
LowcodeIRHereCompilerPlugin >> isMethodWithLowcodeIRBuilder [
	(ast hasPragmaNamed: #useLowcodeIRBuilder) ifFalse: [ ^ false ].
	ast nodesDo: [ :each |
		each isMessage ifTrue: [
			each selector == #here: ifTrue: [
				each receiver isGlobal ifTrue: [
					each receiver binding ifNotNil: [ :binding |
						(binding value includesBehavior: IRLowcodeBuilder) ifTrue: [ ^ true ]
					]
				].
			].
		].
	].
	^ false
]

{ #category : #api }
LowcodeIRHereCompilerPlugin >> transform [
	| astWithoutPragma codeGenerationMethod |
	self isMethodWithLowcodeIRBuilder ifFalse: [ ^ ast ].
	ast := ast copy.
	
	astWithoutPragma := ast copy.
	astWithoutPragma removePragma: (astWithoutPragma pragmaNamed: #useLowcodeIRBuilder).

	codeGenerationMethod := astWithoutPragma generate.

	ast := LowcodeIRHereDummyAST new
		originalAST: ast;
		codeGenerationMethod: codeGenerationMethod;
		yourself
]
