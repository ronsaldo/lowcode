Class {
	#name : #ConfigurationOfLowcode,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfLowcode
}

{ #category : #'development support' }
ConfigurationOfLowcode class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfLowcode class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfLowcode class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfLowcode class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfLowcode class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfLowcode class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfLowcode class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfLowcode class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfLowcode class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfLowcode class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfLowcode >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/ronsaldo/Lowcode/main'.
		spec project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
		spec 
			package: 'Lowcode-Assembler';
			package: 'Lowcode-Execution' with: [
				spec requires: #('Lowcode-Assembler' ). ];
			package: 'Lowcode-FFI' with: [
				spec requires: #('Lowcode-Assembler' 'Lowcode-Execution' ). ];
			package: 'Lowcode-Generator' with: [
				spec requires: #('XMLParser' ). ];
			package: #'Lowcode-IRBuilder';
			package: 'Lowcode-Linux32' with: [
				spec requires: #('Lowcode-FFI' ). ];
			package: 'Lowcode-OpalCompiler' with: [
				spec requires: #(#'Lowcode-IRBuilder' #'Lowcode-TypeSystem' ). ];
			package: #'Lowcode-OpalTest' with: [
				spec requires: #('Lowcode-OpalCompiler' ). ];
			package: #'Lowcode-Runtime';
			package: 'Lowcode-Test' with: [
				spec requires: #('Lowcode-Assembler' 'Lowcode-Execution' ). ];
			package: #'Lowcode-TypeSystem' with: [
				spec requires: #(#'Lowcode-IRBuilder' ). ].
		spec group: 'default' with: #('Lowcode-Generator' #'Lowcode-IRBuilder' 'Lowcode-OpalCompiler' #'Lowcode-TypeSystem' #'Lowcode-OpalTest' #'Lowcode-Runtime' ). ].

]

{ #category : #accessing }
ConfigurationOfLowcode >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfLowcode >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfLowcode >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]
