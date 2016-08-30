"
I am an object that always uses the LowcodeFFICalloutAPI.
"
Class {
	#name : #ObjectWithLowcodeFFICallout,
	#superclass : #Object,
	#category : #'Lowcode-UnifiedFFI-Tests'
}

{ #category : #callouts }
ObjectWithLowcodeFFICallout >> ffiCallout [
	^ LowcodeFFICalloutAPI inContext: thisContext sender
]

{ #category : #callouts }
ObjectWithLowcodeFFICallout >> ffiCalloutIn: aContext [
	^ LowcodeFFICalloutAPI inContext: aContext
]
