"
LibC callouts using lowcode. For testing purposes.
"
Class {
	#name : #LibCWithLowcode,
	#superclass : #ObjectWithLowcodeFFICallout,
	#category : #'Lowcode-UnifiedFFI-Tests'
}

{ #category : #misc }
LibCWithLowcode >> atof: string [
	^ self ffiCall: #(double atof(String string)) module: LibC
]

{ #category : #misc }
LibCWithLowcode >> atoi: string [
	^ self ffiCall: #(int atoi(String string)) module: LibC
]

{ #category : #misc }
LibCWithLowcode >> malloc: size [
	^ self ffiCall: #(void *malloc(size_t size)) module: LibC
]

{ #category : #misc }
LibCWithLowcode >> memCmp: first with: second size: n [
	^ self ffiCall: #(int memcmp(const void *first, const void *second, size_t n)) module: LibC
]

{ #category : #misc }
LibCWithLowcode >> memCopy: src to: dest size: n [
	^ self ffiCall: #(void *memcpy(void *dest, const void *src, size_t n)) module: LibC
]
