---
source_url: https://simonwillison.net/2025/Dec/23/mquickjs-sandbox/
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-23-simon-willison-mquickjs-sandbox
---

# mquickjs Sandbox Investigation

Source: https://github.com/simonw/research/tree/main/mquickjs-sandbox

This research explores mquickjs (a minimal JS engine by Fabrice Bellard) as a secure, lightweight sandboxing environment for executing untrusted JavaScript code.

## 1. Core Overview
mquickjs is designed to run in as little as **10KB of RAM**. This investigation focuses on three primary security pillars:
*   **Memory Limits:** Engine allocates strictly within a user-provided buffer.
*   **Time Limits:** Uses an interrupt handler to control CPU time.
*   **Isolation:** Minimal runtime with no native OS, file, or network access.

---

## 2. Implementation Methods

### FFI Bindings (ctypes)
**Files:** `mquickjs_ffi.py`, `build_ffi.py`
Recommended for most use cases due to high performance and ease of use without complex compilation.
```python
from mquickjs_ffi import MQuickJSFFI, execute_js
# Reusable sandbox
sandbox = MQuickJSFFI(memory_limit_bytes=1024*1024, time_limit_ms=1000)
sandbox.execute("var x = 42")
result = sandbox.execute("x * 2")  # Returns 84
```

### Python C Extension
**Files:** `mquickjs_ext.c`, `setup.py`
The fastest implementation with the lowest startup overhead.
```python
import mquickjs_ext
sandbox = mquickjs_ext.Sandbox(memory_limit_bytes=1024*1024, time_limit_ms=1000)
result = sandbox.execute("Math.sqrt(16)")
```

### WebAssembly (WASM)
**Files:** `mquickjs.wasm`, `mquickjs_optimized.wasm`
Enables execution in Node.js, Deno, Browsers, and Python (via Wasmtime).
*   **Standard Build:** 229 KB (`-O2`)
*   **Optimized Build:** 148 KB (`-Oz`) — **35% smaller**

---

## 3. Performance Benchmarks

| Implementation | Startup | Simple Op | Loop 1000 | Recursion (fib 15) |
| :--- | :--- | :--- | :--- | :--- |
| **C Extension** | **0.01ms** | **0.003ms** | **0.033ms** | **0.083ms** |
| **FFI (ctypes)** | 0.04ms | 0.007ms | 0.039ms | 0.086ms |
| **Subprocess** | 0.13ms | 4.9ms | 4.6ms | 4.5ms |
| **Wasmtime** | 56.6ms | 2.8ms | 5.6ms | 6.2ms |

**Key Insight:** C Extension and FFI are nearly identical in execution speed, but the C Extension starts 4x faster. Subprocess and Wasmtime are significantly slower (300x-900x) but offer different isolation benefits.

---

## 4. Security & Vulnerability Analysis

### Sandboxing Strengths
*   **Memory Isolation:** `JS_NewContext(mem_buf, mem_size, ...)` ensures explicit bounds. Out-of-memory (OOM) triggers a clean exception rather than a crash.
*   **Time Limits:** `JS_SetInterruptHandler` allows the host to halt execution if it exceeds the `time_limit_ms`.

### ReDoS Vulnerability
*   **Finding:** mquickjs uses a backtracking NFA regex engine, vulnerable to patterns like `(a+)+$`.
*   **Mitigation:** The interrupt handler is called during regex backtracking (`LRE_POLL_INTERRUPT()`).
*   **Recommendation:** Keep time limits low (100-1000ms) to prevent Denial of Service via regex.

---

## 5. JavaScript Dialect Differences
mquickjs implements an **ES5-like subset**. Key omissions include:
*   **No Async:** No `async/await`, `Promises`, or `Generators`.
*   **No Modern Syntax:** No `Modules`, `Proxy/Reflect`, or `Symbols`.
*   **Limited Standard Lib:** `Date` only supports `Date.now()`; `toLowerCase/toUpperCase` are ASCII-only.
*   **Strict Mode:** Always enabled.

---

## 6. Technical Deep Dive: Wasmtime Integration
Running mquickjs in Wasmtime required custom "trampolines" to handle `setjmp/longjmp` (used by the mquickjs parser for error handling).

**The Solution:**
The Python host must implement `invoke_*` functions that:
1. Call through the WASM `__indirect_function_table`.
2. Catch "longjmp" exceptions.
3. Manage emscripten state via `setThrew` and `stackRestore`.

```python
# Simplified logic for Wasmtime invoke support
try:
    func = self._table.get(self.store, index)
    return func(self.store, *params)
except (LongjmpException, wasmtime.Trap):
    self._setThrew(self.store, 1, 0)
    self._stackRestore(self.store, stack_ptr)
    return 0
```

---

## 7. Conclusion & Recommendations
mquickjs is an excellent choice for sandboxing due to its tiny attack surface and microsecond-level performance.
*   **Best for General Use:** **FFI implementation** (high performance, no complex compilation).
*   **Best for Security-Critical/Serverless:** **Wasmtime** (provides WASM-level isolation and portability).
*   **Best for Performance:** **C Extension**.

Posted 23rd December 2025 at 3:43 pm.

This is a **research** by Simon Willison.