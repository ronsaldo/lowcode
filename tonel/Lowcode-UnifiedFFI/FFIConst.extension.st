Extension { #name : #FFIConst }

{ #category : #'*Lowcode-UnifiedFFI' }
FFIConst >> emitLowcodeCallArgument: builder [
	value == nil ifTrue: [
		^ builder lowcodeCallArgumentPointer
	].
	(#(true false) includes: value) ifTrue: [
		^ builder lowcodeCallArgumentInt32
	].
	value isInteger ifTrue: [
		^ builder lowcodeCallArgumentInt32
	].
	value isFloat ifTrue: [
		^ builder lowcodeCallArgumentFloat64
	].

	^ self error: 'constant type not supported.'
]

{ #category : #'*Lowcode-UnifiedFFI' }
FFIConst >> emitLowcodeMarshallArgument: builder context: sender [
	value == nil ifTrue: [
		^ builder lowcodePushNullPointer
	].
	value == true ifTrue: [
		^ builder lowcodePushOne32
	].
	value == false ifTrue: [
		^ builder lowcodePushZero32
	].
	value isInteger ifTrue: [
		value = 0 ifTrue: [ ^ builder lowcodePushZero32 ].
		value = 1 ifTrue: [ ^ builder lowcodePushOne32 ].
		^ builder lowcodePushConstantUInt32: (value bitAnd: 16rffffffff)
	].
	value isFloat ifTrue: [
		value = 0.0 ifTrue: [ ^ builder lowcodePushZeroFloat64 ].
		value = 1.0 ifTrue: [ ^ builder lowcodePushOneFloat64 ].
		^ builder
			pushLiteral: value
			lowcodeOopToFloat64
	].

	^ self error: 'constant type not supported.'
]
