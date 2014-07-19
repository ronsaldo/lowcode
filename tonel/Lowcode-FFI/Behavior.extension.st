Extension { #name : #Behavior }

{ #category : #'*Lowcode-FFI' }
Behavior >> ffiBindingOf: aName [
	"answer a binding for a type name,
	by default use smalltalk name bindings"
	^ self bindingOf: aName
]
