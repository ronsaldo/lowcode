Class {
	#name : #LowcodeAssembler,
	#superclass : #Object,
	#instVars : [
		'streamElements'
	],
	#category : #'Lowcode-Assembler'
}

{ #category : #'lowcode instructions' }
LowcodeAssembler >> add: a1_dest first: a2_first second: a3_second [
	self addInstruction: 304 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #adding }
LowcodeAssembler >> addElement: aLowcodeInstruction [
	streamElements add: aLowcodeInstruction
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode [
	self addElement: (LowcodeInstruction new: opcode)
]

{ #category : #adding }
LowcodeAssembler >> addInstruction: opcode args: args [
	self addElement: (LowcodeInstruction new: opcode args: args)
]

{ #category : #adding }
LowcodeAssembler >> addSistaInstruction: opcode [
	self addElement: (LowcodeSistaInstruction new: opcode)
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> align: a1_alignment [
	self addInstruction: 362 args: { (self immUInt8: a1_alignment) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> alloca: a1_dest size: a2_size [
	self addInstruction: 361 args: { (self intRegister: a1_dest) . (self intRegister: a2_size) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> allocaf: a1_dest size: a2_size [
	self addInstruction: 360 args: { (self intRegister: a1_dest) . (self immUInt32: a2_size) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> and: a1_dest first: a2_first second: a3_second [
	self addInstruction: 313 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> bool2oop: a1_dest source: a2_source [
	self addInstruction: 334 args: { (self oopRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> breq: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 0 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brge: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 5 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brgt: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 4 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brle: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 3 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brlt: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 2 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brne: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 1 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brno: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 11 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brov: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 10 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brpf: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 12 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brps: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 13 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> bruge: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 9 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brugt: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 8 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brule: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 7 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> brult: a1_dest [
	self addInstruction: 348 args: { self conditionCode: 6 . (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> call: a1_function [
	self addInstruction: 358 args: { (self immUInt64: a1_function) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callc: a1_function args: a2_args [
	self addInstruction: 349 args: { (self immUInt64: a1_function) . (self registerList: a2_args) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> callci: a1_function args: a2_args [
	self addInstruction: 350 args: { (self intRegister: a1_function) . (self registerList: a2_args) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> calli: a1_reg [
	self addInstruction: 359 args: { (self immUInt8: a1_reg) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> cmp: a1_first second: a2_second [
	self addInstruction: 343 args: { (self intRegister: a1_first) . (self intRegister: a2_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> cmpswp32: a1_dest check: a2_check newValue: a3_newValue oldValue: a4_oldValue [
	self addInstruction: 357 args: { (self intRegister: a1_dest) . (self intRegister: a2_check) . (self intRegister: a3_newValue) . (self intRegister: a4_oldValue) }
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> computeSizes [
	| size |
	size := 0.
	streamElements do: [ :el |
		size := size + (el computeSizeForOffset: size)
	].
	^ size
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> decsp: a1_amount [
	self addInstruction: 375 args: { (self immUInt8: a1_amount) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> div: a1_dest first: a2_first second: a3_second [
	self addInstruction: 308 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'instruction encoding' }
LowcodeAssembler >> emit [
	| size |
	size := self computeSizes.
	^ ByteArray new: size streamContents: [ :stream |
		streamElements do: [ :el | el emitToStream: stream ]
	]
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fadd: a1_dest first: a2_first second: a3_second [
	self addInstruction: 318 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fcmp: a1_first second: a2_second [
	self addInstruction: 344 args: { (self intRegister: a1_first) . (self intRegister: a2_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fdiv: a1_dest first: a2_first second: a3_second [
	self addInstruction: 321 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #arguments }
LowcodeAssembler >> floatRegister: registerIdentifier [
	^ LowcodeRegisterIdentifier new: registerIdentifier
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fmul: a1_dest first: a2_first second: a3_second [
	self addInstruction: 320 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fp2int: a1_dest source: a2_source [
	self addInstruction: 303 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fp2oop: a1_dest source: a2_source [
	self addInstruction: 338 args: { (self floatRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fp2uint: a1_dest source: a2_source [
	self addInstruction: 302 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> frem: a1_dest first: a2_first second: a3_second [
	self addInstruction: 322 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fstfld: a1_dest source: a2_source [
	self addInstruction: 339 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fstidx: a1_dest source: a2_source [
	self addInstruction: 340 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> fsub: a1_dest first: a2_first second: a3_second [
	self addInstruction: 319 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> i32c2oop: a1_dest source: a2_source [
	self addInstruction: 336 args: { (self oopRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #arguments }
LowcodeAssembler >> immFloat32: aValue [
	^ LowcodeImmediateFloat32 new: aValue asFloat
]

{ #category : #arguments }
LowcodeAssembler >> immFloat64: aValue [
	^ LowcodeImmediateFloat64 new: aValue asFloat
]

{ #category : #arguments }
LowcodeAssembler >> immInt16: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt32: aValue [
	^ LowcodeImmediateInt32 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt64: aValue [
	^ LowcodeImmediateInt64 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immInt8: aValue [
	^ LowcodeImmediateInt8 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt16: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt32: aValue [
	^ LowcodeImmediateInt32 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt64: aValue [
	^ LowcodeImmediateInt64 new: aValue asInteger
]

{ #category : #arguments }
LowcodeAssembler >> immUInt8: aValue [
	^ LowcodeImmediateInt16 new: aValue asInteger
]

{ #category : #initialization }
LowcodeAssembler >> initialize [
	streamElements := OrderedCollection new.
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> int2oop: a1_dest source: a2_source [
	self addInstruction: 335 args: { (self oopRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #arguments }
LowcodeAssembler >> intRegister: registerIdentifier [
	^ LowcodeRegisterIdentifier new: registerIdentifier
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jmp: a1_dest [
	self addInstruction: 346 args: { (self labelRef: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> jmpi: a1_dest [
	self addInstruction: 347 args: { (self intRegister: a1_dest) }
]

{ #category : #arguments }
LowcodeAssembler >> labelRef: aLabel [
	^ LowcodeLabelReference new: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcf32: a1_dest value: a2_value [
	self addInstruction: 269 args: { (self floatRegister: a1_dest) . (self immFloat32: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcf64: a1_dest value: a2_value [
	self addInstruction: 270 args: { (self floatRegister: a1_dest) . (self immFloat64: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcs16: a1_dest value: a2_value [
	self addInstruction: 263 args: { (self intRegister: a1_dest) . (self immInt16: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcs32: a1_dest value: a2_value [
	self addInstruction: 265 args: { (self intRegister: a1_dest) . (self immInt32: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcs64: a1_dest value: a2_value [
	self addInstruction: 267 args: { (self intRegister: a1_dest) . (self immInt64: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcs8: a1_dest value: a2_value [
	self addInstruction: 261 args: { (self intRegister: a1_dest) . (self immInt8: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcu16: a1_dest value: a2_value [
	self addInstruction: 264 args: { (self intRegister: a1_dest) . (self immUInt16: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcu32: a1_dest value: a2_value [
	self addInstruction: 266 args: { (self intRegister: a1_dest) . (self immUInt32: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcu64: a1_dest value: a2_value [
	self addInstruction: 268 args: { (self intRegister: a1_dest) . (self immUInt64: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldcu8: a1_dest value: a2_value [
	self addInstruction: 262 args: { (self intRegister: a1_dest) . (self immUInt8: a2_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldf32: a1_dest source: a2_source [
	self addInstruction: 280 args: { (self floatRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldf64: a1_dest source: a2_source [
	self addInstruction: 281 args: { (self floatRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldlit: a1_dest index: a2_index [
	self addInstruction: 260 args: { (self oopRegister: a1_dest) . (self immInt16: a2_index) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lds16: a1_dest source: a2_source [
	self addInstruction: 274 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lds32: a1_dest source: a2_source [
	self addInstruction: 276 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lds64: a1_dest source: a2_source [
	self addInstruction: 278 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lds8: a1_dest source: a2_source [
	self addInstruction: 272 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldspcl: a1_dest [
	self addInstruction: 256 args: { (self oopRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldu16: a1_dest source: a2_source [
	self addInstruction: 275 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldu32: a1_dest source: a2_source [
	self addInstruction: 277 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldu64: a1_dest source: a2_source [
	self addInstruction: 279 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ldu8: a1_dest source: a2_source [
	self addInstruction: 273 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lea: a1_dest base: a2_base index: a3_index scale: a4_scale offset: a5_offset [
	self addInstruction: 271 args: { (self intRegister: a1_dest) . (self intRegister: a2_base) . (self intRegister: a3_index) . (self immUInt8: a4_scale) . (self immUInt64: a5_offset) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockregs [
	self addInstruction: 378
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> lockvm [
	self addInstruction: 355
]

{ #category : #adding }
LowcodeAssembler >> makeLabel [
	^ LowcodeLabel new.
]

{ #category : #adding }
LowcodeAssembler >> makeLabelHere [
	| label |
	label := self makeLabel.
	self putLabel: label.
	^ label
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movf2phy: a1_dest source: a2_source [
	self addInstruction: 381 args: { (self immUInt8: a1_dest) . (self floatRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movf: a1_dest source: a2_source [
	self addInstruction: 289 args: { (self floatRegister: a1_dest) . (self floatRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movi2phy: a1_dest source: a2_source [
	self addInstruction: 380 args: { (self immUInt8: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movi: a1_dest source: a2_source [
	self addInstruction: 288 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movoop: a1_dest source: a2_source [
	self addInstruction: 290 args: { (self oopRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movphy2f: a1_dest source: a2_source [
	self addInstruction: 383 args: { (self floatRegister: a1_dest) . (self immUInt8: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> movphy2i: a1_dest source: a2_source [
	self addInstruction: 382 args: { (self intRegister: a1_dest) . (self immUInt8: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> mul: a1_dest first: a2_first second: a3_second [
	self addInstruction: 306 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> new: a1_dest classOop: a2_classOop [
	self addInstruction: 341 args: { (self oopRegister: a1_dest) . (self oopRegister: a2_classOop) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> newidx: a1_dest classOop: a2_classOop size: a3_size [
	self addInstruction: 342 args: { (self oopRegister: a1_dest) . (self oopRegister: a2_classOop) . (self intRegister: a3_size) }
]

{ #category : #'sista instructions' }
LowcodeAssembler >> nop [
	self addSistaInstruction: 95
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> not: a1_dest source: a2_source [
	self addInstruction: 312 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2bool: a1_dest source: a2_source [
	self addInstruction: 327 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2fp: a1_dest source: a2_source [
	self addInstruction: 333 args: { (self floatRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2i32: a1_dest source: a2_source [
	self addInstruction: 329 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2i64: a1_dest source: a2_source [
	self addInstruction: 331 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2int: a1_dest source: a2_source [
	self addInstruction: 328 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2ptr: a1_dest source: a2_source [
	self addInstruction: 325 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2u32: a1_dest source: a2_source [
	self addInstruction: 330 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> oop2u64: a1_dest source: a2_source [
	self addInstruction: 332 args: { (self intRegister: a1_dest) . (self oopRegister: a2_source) }
]

{ #category : #arguments }
LowcodeAssembler >> oopRegister: registerIdentifier [
	^ LowcodeRegisterIdentifier new: registerIdentifier
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> or: a1_dest first: a2_first second: a3_second [
	self addInstruction: 314 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> peekvm: a1_dest arg: a2_arg [
	self addInstruction: 257 args: { (self oopRegister: a1_dest) . (self immUInt8: a2_arg) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pin: a1_object [
	self addInstruction: 323 args: { (self oopRegister: a1_object) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popf32: a1_dest [
	self addInstruction: 373 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popf64: a1_dest [
	self addInstruction: 374 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popi32: a1_dest [
	self addInstruction: 369 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popi64: a1_dest [
	self addInstruction: 371 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popu32: a1_dest [
	self addInstruction: 370 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popu64: a1_dest [
	self addInstruction: 372 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> popvm: a1_nitems [
	self addInstruction: 258 args: { (self immUInt8: a1_nitems) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ptr2oop: a1_dest source: a2_source [
	self addInstruction: 326 args: { (self oopRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushf32: a1_value [
	self addInstruction: 367 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushf64: a1_value [
	self addInstruction: 368 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushi32: a1_value [
	self addInstruction: 363 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushi64: a1_value [
	self addInstruction: 365 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushu32: a1_value [
	self addInstruction: 364 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushu64: a1_value [
	self addInstruction: 366 args: { (self intRegister: a1_value) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> pushvm: a1_item [
	self addInstruction: 259 args: { (self oopRegister: a1_item) }
]

{ #category : #adding }
LowcodeAssembler >> putLabel: aLabel [
	self addElement: aLabel
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> rem: a1_dest first: a2_first second: a3_second [
	self addInstruction: 310 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> restoresp: a1_source [
	self addInstruction: 377 args: { (self intRegister: a1_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> ret [
	self addInstruction: 351
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> retf: a1_code [
	self addInstruction: 353 args: { (self intRegister: a1_code) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> retif: a1_code [
	self addInstruction: 354 args: { (self intRegister: a1_code) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> retvm: a1_result [
	self addInstruction: 352 args: { (self oopRegister: a1_result) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> savesp: a1_dest [
	self addInstruction: 376 args: { (self intRegister: a1_dest) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sext16: a1_dest source: a2_source [
	self addInstruction: 292 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sext32: a1_dest source: a2_source [
	self addInstruction: 293 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sext8: a1_dest source: a2_source [
	self addInstruction: 291 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> shlt: a1_dest first: a2_first second: a3_second [
	self addInstruction: 316 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> shrt: a1_dest first: a2_first second: a3_second [
	self addInstruction: 317 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sint2fp: a1_dest source: a2_source [
	self addInstruction: 301 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> stf32: a1_dest source: a2_source [
	self addInstruction: 286 args: { (self intRegister: a1_dest) . (self floatRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> stf64: a1_dest source: a2_source [
	self addInstruction: 287 args: { (self intRegister: a1_dest) . (self floatRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sti16: a1_dest source: a2_source [
	self addInstruction: 283 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sti32: a1_dest source: a2_source [
	self addInstruction: 284 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sti64: a1_dest source: a2_source [
	self addInstruction: 285 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sti8: a1_dest source: a2_source [
	self addInstruction: 282 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> sub: a1_dest first: a2_first second: a3_second [
	self addInstruction: 305 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> test: a1_first second: a2_second [
	self addInstruction: 345 args: { (self intRegister: a1_first) . (self intRegister: a2_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> trunc16: a1_dest source: a2_source [
	self addInstruction: 298 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> trunc32: a1_dest source: a2_source [
	self addInstruction: 299 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> trunc8: a1_dest source: a2_source [
	self addInstruction: 297 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> u32c2oop: a1_dest source: a2_source [
	self addInstruction: 337 args: { (self oopRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> udiv: a1_dest first: a2_first second: a3_second [
	self addInstruction: 309 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> uint2fp: a1_dest source: a2_source [
	self addInstruction: 300 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> umul: a1_dest first: a2_first second: a3_second [
	self addInstruction: 307 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockregs [
	self addInstruction: 379
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unlockvm [
	self addInstruction: 356
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> unpin: a1_object [
	self addInstruction: 324 args: { (self oopRegister: a1_object) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> urem: a1_dest first: a2_first second: a3_second [
	self addInstruction: 311 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> xor: a1_dest first: a2_first second: a3_second [
	self addInstruction: 315 args: { (self intRegister: a1_dest) . (self intRegister: a2_first) . (self intRegister: a3_second) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zext16: a1_dest source: a2_source [
	self addInstruction: 295 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zext32: a1_dest source: a2_source [
	self addInstruction: 296 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]

{ #category : #'lowcode instructions' }
LowcodeAssembler >> zext8: a1_dest source: a2_source [
	self addInstruction: 294 args: { (self intRegister: a1_dest) . (self intRegister: a2_source) }
]
