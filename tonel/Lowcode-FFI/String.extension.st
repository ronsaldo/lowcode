Extension { #name : #String }

{ #category : #'*Lowcode-FFI' }
String class >> asFFIExternalType: gen [

	^ gen resolveType: #FFIExternalStringType
]
