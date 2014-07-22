Class {
	#name : #LoDisLowcodeInstruction,
	#superclass : #LoDisInstruction,
	#classVars : [
		'InstructionKinds'
	],
	#category : #'Lowcode-Disassembler'
}

{ #category : #'class initialization' }
LoDisLowcodeInstruction class >> initialize [
	"
	self initialize
	"
	super initialize.
	
	self initializeInstructionKindMap
	
]

{ #category : #initialization }
LoDisLowcodeInstruction class >> initializeInstructionKindMap [
	InstructionKinds := IdentityDictionary newFromPairs: #(
256 operation
257 operation
258 operation
259 operation
260 operation
261 operation
262 operation
263 operation
264 operation
265 operation
266 operation
267 operation
268 operation
269 operation
270 operation
271 operation
272 operation
273 operation
274 operation
275 operation
276 operation
277 operation
278 operation
279 operation
280 operation
281 operation
282 operation
283 operation
284 operation
285 operation
286 operation
287 operation
288 operation
289 operation
290 operation
291 operation
292 operation
293 operation
294 operation
295 operation
296 operation
297 operation
298 operation
299 operation
300 operation
301 operation
302 operation
303 operation
304 operation
305 operation
306 operation
307 operation
308 operation
309 operation
310 operation
311 operation
312 operation
313 operation
314 operation
315 operation
316 operation
317 operation
318 operation
319 operation
320 operation
321 operation
322 operation
323 operation
324 operation
325 operation
326 operation
327 operation
328 operation
329 operation
330 operation
331 operation
332 operation
333 operation
334 operation
335 operation
336 operation
337 operation
338 operation
339 operation
340 operation
341 operation
342 operation
343 operation
344 operation
345 operation
346 operation
347 operation
348 operation
349 operation
350 operation
351 operation
352 operation
353 operation
354 operation
355 operation
356 operation
357 operation
358 operation
359 operation
360 operation
361 operation
362 operation
363 operation
364 operation
365 operation
366 operation
367 operation
368 operation
369 operation
370 operation
371 operation
372 operation
373 operation
374 operation
375 operation
376 operation
377 operation
378 operation
379 operation
380 operation
381 operation
382 operation
383 operation
384 operation
385 operation
386 operation
387 operation
388 operation
389 operation
390 operation
391 operation
392 operation
393 operation
394 operation
395 operation
396 operation
397 operation
398 operation
399 operation
400 operation
401 operation
402 operation
403 operation
404 operation
405 operation
406 operation
407 operation
408 operation
409 operation
410 operation
411 operation
412 operation
413 operation
414 operation
415 operation
416 operation
417 operation
418 operation
419 operation
420 operation
421 operation
422 operation
423 operation
424 operation
425 operation
426 operation
427 operation
428 operation
429 operation
430 operation
431 operation
432 operation
433 operation
434 operation
435 operation
436 operation
437 operation
438 operation
439 operation
440 operation
441 operation
442 operation
443 operation
444 operation
445 operation
446 operation
447 operation
448 operation
449 operation
450 operation
451 operation
452 operation
453 operation
454 operation
455 operation
456 operation
457 operation
458 operation
459 operation
460 operation
461 operation
462 operation
463 operation
464 operation
465 operation
466 operation
467 operation
468 operation
469 jump
470 branch
471 branch
472 branch
473 branch
478 terminator
479 terminator
480 terminator
481 terminator
482 terminator
483 terminator
484 terminator
485 terminator
486 terminator
487 terminator
488 terminator
489 terminator
490 operation
491 operation
492 operation
493 operation
494 operation
495 operation
496 operation
497 operation
498 operation
499 operation
500 operation
501 operation
502 operation
503 operation
504 operation
505 operation
506 operation
507 operation
508 operation
509 operation
510 operation
511 operation
512 operation
513 operation
514 operation
515 operation
516 operation
517 operation
518 operation
519 operation
520 operation
521 operation
522 operation
523 operation
524 operation
525 operation
526 operation
527 operation
528 operation
529 operation
530 operation
531 operation
532 operation
533 operation
534 operation

	)
]

{ #category : #'instance creation' }
LoDisLowcodeInstruction class >> new: opcode [
	^ self new opcode: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> add64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> alloca64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> and64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> arithmeticRightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> beginCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> boolean64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> branchAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchFalse64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> branchTrue64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> byteSizeOfValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentInt64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callArgumentStructureValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callInstructionValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> callPhysicalValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> checkSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> compareAndSwap32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> div64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicateInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> duplicatePointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> effectiveAddress64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallNoCleanupValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> endCallValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> failWithCodeValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> firstIndexableFieldPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32AddValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32DivValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32EqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32GreatValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32LessValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32MulValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32NotEqualValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32SubValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popFloat32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToInt64Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float32ToOopValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64AddValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64DivValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64EqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64GreatValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64LessValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64MulValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64NotEqualValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64SubValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popFloat64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt32Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToInt64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> float64ToOopValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> freeValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexable32OopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateIndexableOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> instantiateOopValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> instructionKind [
	^ InstructionKinds at: opcode ifAbsent: [ #operation ]
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32EqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int32ToPointerValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64EqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64NotEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> int64ToPointerValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isFloatObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIndexableValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isIntegerObjectValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isPointersValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsOrBytesValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> isWordsValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #accessing }
LoDisLowcodeInstruction >> jumpAddress: literals [
	"TODO: Improve the encoding algorithm to remove the literals"
	^ literals at: extendA + 1
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> jumpValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> leftShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadFloat64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalAddressValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt16Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadLocalUInt8Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectAtValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadPointerFromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt16FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt32FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt64FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> loadUInt8FromMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> lockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> malloc64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpy64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> memcpyFixedValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #printing }
LoDisLowcodeInstruction >> mnemonic [
	^ LowcodeStreamElement lowcodeMnemonicFor: opcode
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat32ToPhysicalValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveFloat64ToPhysicalValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt32ToPhysicalValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> moveInt64ToPhysicalValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> movePointerToPhysicalValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> mul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> neg64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> not64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopNotEqualValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopSmallIntegerToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToBoolean64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToFloat64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerReinterpretValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToPointerValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt32Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> oopToUInt64Validate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> or64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectFloat64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallIndirectPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> performCallPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> plaftormCodeValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerNotEqualValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerOffset32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerOffset64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt32Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToInt64Validate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopReinterprerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pointerToOopValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> popPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushConstantUInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushNullPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOne64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushOneFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalInt64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushPhysicalPointerValidate: stack forMethod: method [
	stack pushPointer.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushSessionIdentifierValidate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero32Validate: stack forMethod: method [
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZero64Validate: stack forMethod: method [
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat32Validate: stack forMethod: method [
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> pushZeroFloat64Validate: stack forMethod: method [
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnBoolean32AsOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnBoolean64AsOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnFloat32AsOopValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnFloat64AsOopValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnInt32AsOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnInt64AsOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnPointerAsOopValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnSmallIntegerValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnUInt32AsOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> returnUInt64AsOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> rightShift64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> signExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> smallInt32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat32ToMemoryValidate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeFloat64ToMemoryValidate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt16ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt32ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt64ToMemoryValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeInt8ToMemoryValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat32Validate: stack forMethod: method [
	stack popFloat32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalFloat64Validate: stack forMethod: method [
	stack popFloat64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalInt8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeLocalPointerValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldAtValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storeObjectFieldValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> storePointerToMemoryValidate: stack forMethod: method [
	stack popPointer ifFalse: [^ false ].
	stack popPointer ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> sub64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate32To8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> truncate64To8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> udiv64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32GreatValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessEqualValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32LessValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToFloat64Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint32ToOopValidate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64GreatValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessEqualValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64LessValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToFloat64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushFloat64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> uint64ToOopValidate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushOop.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> umul64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockRegistersValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unlockVMValidate: stack forMethod: method [
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> unpinValidate: stack forMethod: method [
	stack popOop ifFalse: [^ false ].
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> urem64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor32Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> xor64Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From16Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend32From8Validate: stack forMethod: method [
	stack popInt32 ifFalse: [^ false ].
	stack pushInt32.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From16Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From32Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]

{ #category : #'validation generated' }
LoDisLowcodeInstruction >> zeroExtend64From8Validate: stack forMethod: method [
	stack popInt64 ifFalse: [^ false ].
	stack pushInt64.
	^ true
]
