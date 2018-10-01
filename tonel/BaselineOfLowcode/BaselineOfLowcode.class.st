Class {
	#name : #BaselineOfLowcode,
	#superclass : #BaselineOf,
	#category : #BaselineOfLowcode
}

{ #category : #baselines }
BaselineOfLowcode >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
		spec 
			package: 'Lowcode-Generator' with: [
				spec requires: #('XMLParser' ). ];
			package: #'Lowcode-IRBuilder';
			package: #'Lowcode-OpalCompiler' with: [
				spec requires: #(#'Lowcode-IRBuilder' #'Lowcode-TypeSystem' ). ];
			package: #'Lowcode-OpalTest' with: [
				spec requires: #('Lowcode-OpalCompiler' ). ];
			package: #'Lowcode-Runtime' with: [
				spec postLoadDoIt: #postloadForRuntime:package: ];
			package: #'Lowcode-TypeSystem' with: [
				spec requires: #(#'Lowcode-IRBuilder' )];
			package: #'Lowcode-UnifiedFFI' with: [
				spec requires: #(#'Lowcode-IRBuilder' 'Lowcode-Runtime'). ].
		spec
			group: 'Runtime' with: #(#'Lowcode-Runtime' );
			group: 'Core' with: #(#'Runtime' #'Lowcode-IRBuilder'  );
			group: 'OpalCompiler' with: #(#'Core' #'Lowcode-TypeSystem' #'Lowcode-OpalCompiler' );
			group: 'Generator' with: #(#'Core' #'Lowcode-Generator' );
			group: 'UnifiedFFI' with: #(#'Core' #'Lowcode-UnifiedFFI');
			group: 'WithOpalCompiler' with: #('Core' 'UnifiedFFI' 'OpalCompiler');
			group: 'default' with: #('UnifiedFFI')].

]

{ #category : #'as yet unclassified' }
BaselineOfLowcode >> postloadForRuntime: loader package: packageSpec [
	Smalltalk recreateSpecialObjectsArray
]
