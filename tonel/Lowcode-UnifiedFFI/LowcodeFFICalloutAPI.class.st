"
I am implementation of the FFI Callout API that uses the Lowcode FFI.
"
Class {
	#name : #LowcodeFFICalloutAPI,
	#superclass : #FFICalloutAPI,
	#category : #'Lowcode-UnifiedFFI-Core'
}

{ #category : #installation }
LowcodeFFICalloutAPI class >> install [
	FFICalloutAPI calloutAPIClass: LowcodeFFICalloutAPI
]

{ #category : #actions }
LowcodeFFICalloutAPI class >> uninstall [
	FFICalloutAPI calloutAPIClass: FFICalloutAPI defaultCalloutAPIClass
]

{ #category : #action }
LowcodeFFICalloutAPI >> newBuilder [
	^ LowcodeFFICalloutMethodBuilder calloutAPI: self
]
