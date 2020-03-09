# Lowcode Runtime
### This repository holds the Lowcode runtime, and spec generation tools.

### Loading the Lowcode memory accessor.

```smalltalk
Metacello new
   baseline: 'Lowcode';
   repository: 'github://ronsaldo/lowcode';
   load: #(#'MemoryAccessors').
```

