# Lowcode Runtime
### This repository holds the Lowcode runtime, and spec generation tools.

### Loading the Lowcode memory accessor.

```smalltalk
Metacello new
   baseline: 'Lowcode';
   repository: 'github://ronsaldo/lowcode';
   load: #(#'MemoryAccessors').
```

## Loading the Lowcode memory accessors with tests

```smalltalk
Metacello new
   baseline: 'Lowcode';
   repository: 'github://ronsaldo/lowcode';
   load: #(#'MemoryAccessors' #'MemoryAccessors-Tests').
```

## Loading the Lowcode memory accessors with tests and generators

```smalltalk
Metacello new
   baseline: 'Lowcode';
   repository: 'github://ronsaldo/lowcode';
   load: #(#'MemoryAccessors' #'MemoryAccessors-Tests' #'Generator').
```
