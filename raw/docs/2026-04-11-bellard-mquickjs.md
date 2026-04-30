---
source_url: https://github.com/bellard/mquickjs
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-04-11-bellard-mquickjs
---

# MicroQuickJS (MQuickJS) — Primary Source

**MicroQuickJS** is a lightweight JavaScript engine developed by Fabrice Bellard and Charlie Gordon, specifically optimized for embedded systems with extreme memory constraints.

## 1. Key Specifications & Performance
*   **RAM Usage:** Can run programs in as little as **10 kB**.
*   **ROM Footprint:** Approximately **100 kB** (ARM Thumb-2 code), including the C library.
*   **Speed:** Comparable to the standard QuickJS engine.
*   **Language Support:** A subset of JavaScript close to **ES5**, operating exclusively in a "stricter mode."
*   **Architecture:** Tracing/compacting garbage collector; VM does not use the CPU stack; strings are stored in WTF-8.

## 2. The "Stricter Mode" (Subset Reference)
MQuickJS enforces a subset of ES5 to ensure efficiency and reduce error-prone constructs.
*   **Strict Mode Only:** No `with` keyword; global variables must be declared with `var`.
*   **No Array Holes:** Arrays must be contiguous.
*   **Indirect Eval Only:** Direct `eval` (accessing local scope) is forbidden. Use `(1, eval)('code')` for global scope.
*   **No Value Boxing:** `new Number(1)` or `new String()` are unsupported.
*   **Prototypes:** `for in` only iterates over an object's own properties. `for of` is supported for arrays.
*   **Standard Library in ROM:** Most of the library resides in ROM to save RAM and speed up instantiation.

## 3. REPL and CLI Usage (`mqjs`)
*   **Run with memory limit:** `./mqjs --memory-limit 10k tests/mandelbrot.js`
*   **Compile to bytecode:** `./mqjs -o mandelbrot.bin tests/mandelbrot.js`
*   **Run bytecode:** `./mqjs -b mandelbrot.bin`
*   **Cross-compilation:** Use `-m32` on a 64-bit machine to generate 32-bit bytecode for embedded targets.

## 4. C API & Integration
MQuickJS is designed for portability and has almost no dependencies on the standard C library (no `malloc`, `free`, or `printf`).

### Engine Initialization
```c
JSContext *ctx;
uint8_t mem_buf[8192];
ctx = JS_NewContext(mem_buf, sizeof(mem_buf), &js_stdlib);
// ... use context ...
JS_FreeContext(ctx);
```

### Memory Management (GC)
Unlike QuickJS, MQuickJS uses a **compacting GC**. Object addresses can move.
*   **Rule:** Avoid storing `JSValue` in C variables. Use `JSGCRef` to track moving pointers.

## 5. Technical Internals
*   **Garbage Collection:** Tracing and compacting. Avoids fragmentation and allows for smaller object headers.
*   **Value Representation:**
    *   32-bit word size on 32-bit CPUs.
    *   Supports 31-bit integers, single Unicode codepoints, and pointers.
*   **Objects:** Minimum size is 3 CPU words (12 bytes on 32-bit).
*   **Strings:** Stored in **WTF-8** (UTF-8 + unpaired surrogates), maintaining compatibility with JS 16-bit code unit iteration.
*   **Math:** Includes a custom tiny math library (`libm.c`) and a floating-point emulator for CPUs without an FPU.
*   **Bytecode:** Stack-based; uses exponential-Golomb codes to compress debug information (line/column numbers).

## 6. Repository Structure
*   `mquickjs.c / .h`: Core engine.
*   `mqjs.c`: REPL implementation.
*   `mquickjs_build.c`: Tool to compile the JS standard library into C structures for ROM.
*   `libm.c`: Minimal math library.
*   `tests/`: Basic test suite and benchmarks.

**License:** MIT License (Copyright Fabrice Bellard and Charlie Gordon).
