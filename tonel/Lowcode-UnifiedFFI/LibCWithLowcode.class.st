"
LibC callouts using lowcode. For testing purposes.
"
Class {
	#name : #LibCWithLowcode,
	#superclass : #ObjectWithLowcodeFFICallout,
	#category : #'Lowcode-UnifiedFFI-Tests'
}

{ #category : #misc }
LibCWithLowcode >> malloc: size [
	^ self ffiCall: #(void *malloc(size_t size)) module: LibC
]

{ #category : #misc }
LibCWithLowcode >> memCopy: src to: dest size: n [
	^ self ffiCall: #(void *memcpy(void *dest, const void *src, size_t n)) module: LibC
]
