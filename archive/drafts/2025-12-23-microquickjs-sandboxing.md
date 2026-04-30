---
title: MicroQuickJS — Lightweight JS Sandboxing Engine
created: 2026-04-11
updated: 2026-04-11
type: sandbox-technology
tags: [javascript, sandboxing, security, quickjs, embedded, code-execution]
sources:
  - url: https://github.com/bellard/mquickjs
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/mquickjs-sandbox
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/23/microquickjs/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/23/mquickjs-sandbox/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# MicroQuickJS — Lightweight JS Sandboxing Engine

## The technology

**MicroQuickJS (MQuickJS)** is a JavaScript engine by Fabrice Bellard (ffmpeg, QEMU, QuickJS creator) designed for embedded systems. Runs JS in as little as **10 kB RAM**, with ~100 kB ROM footprint. Speed comparable to full QuickJS.

Key value for sandboxing: **memory limits, time limits, and isolation are baked into the engine design** — not bolted on after the fact.

## Why it matters

Running untrusted code (user scripts, LLM-generated code) requires sandboxing with guaranteed resource bounds. MicroQuickJS provides:

1. **Memory isolation** — `JS_NewContext(mem_buf, mem_size)` allocates within a pre-provided buffer. OOM triggers clean exception, not crash.
2. **Time limits** — `JS_SetInterruptHandler` halts execution after `time_limit_ms`. Called during regex backtracking too (prevents ReDoS).
3. **No OS exposure** — no filesystem, no network, no native primitives by default.
4. **Tiny attack surface** — 100 kB engine vs multi-MB alternatives.

## Integration options (benchmarked by Simon Willison via Claude Code)

| Implementation | Startup | Simple Op | Loop 1000 | Recursion (fib 15) |
| :--- | :--- | :--- | :--- | :--- |
| **C Extension** | **0.01ms** | **0.003ms** | **0.033ms** | **0.083ms** |
| **FFI (ctypes)** | 0.04ms | 0.007ms | 0.039ms | 0.086ms |
| **Subprocess** | 0.13ms | 4.9ms | 4.6ms | 4.5ms |
| **Wasmtime** | 56.6ms | 2.8ms | 5.6ms | 6.2ms |

- **FFI (ctypes)** — recommended for general use. High performance, no complex compilation.
- **C Extension** — fastest startup (4x faster than FFI). Best for performance-critical paths.
- **Wasmtime/WASM** — slower but provides WASM-level isolation. Best for security-critical/serverless.
- **Subprocess** — simplest isolation model. 300x+ slower.

### Python FFI example

```python
from mquickjs_ffi import MQuickJSFFI, execute_js
sandbox = MQuickJSFFI(memory_limit_bytes=1024*1024, time_limit_ms=1000)
sandbox.execute("var x = 42")
result = sandbox.execute("x * 2")  # Returns 84
```

### WASM builds
- Standard: 229 KB (`-O2`)
- Optimized: 148 KB (`-Oz`) — 35% smaller
- Works in Node.js, Deno, Browsers, Pyodide

## JavaScript dialect (ES5 subset — "stricter mode")

What's **missing** (important to know):
- No `async/await`, Promises, or Generators
- No Modules, Proxy/Reflect, or Symbols
- `Date` only supports `Date.now()`
- `toLowerCase/toUpperCase` are ASCII-only
- Strict mode always enabled
- No array holes (`a[10] = 2` on empty array → TypeError)
- Indirect eval only: `(1, eval)('code')`

## ReDoS mitigation

MicroQuickJS's regex engine uses backtracking NFA, vulnerable to patterns like `(a+)+$`. BUT the interrupt handler is called during regex backtracking (`LRE_POLL_INTERRUPT()`), so the configured time limit still fires. Recommendation: keep time limits at 100-1000ms.

## Size comparison

- QuickJS Wasm: 2.28 MB (675 KB transferred)
- MicroQuickJS Wasm: 303 KB (120 KB transferred) — **7.5x smaller**

## Salvatore Sanfilippo (Redis creator) on MicroQuickJS

> "If this had been available in 2010, Redis scripting would have been JavaScript and not Lua."

## Relevance to Chris's stack

- `code_execution_tool` in Hermes uses sandboxed execution. MicroQuickJS could offer a lightweight alternative for JS execution with guaranteed resource bounds.
- The FFI approach is the most practical for Python-based tools (Hermes runs on Python).
- The WASM path enables browser-based execution (relevant if cp7-mobile needs in-app JS sandboxing).

## Chris's preferences

- See `chris-preferences.md#code-execution` for Chris's stance on sandboxed execution.
- Delta from best practice: Chris prefers practical solutions over theoretical security. FFI is likely the right fit — fast, simple, no complex compilation.
- Last sync with chris-preferences: 2026-04-11

## Sources

- Primary: https://github.com/bellard/mquickjs (MIT, Fabrice Bellard + Charlie Gordon)
- Research: https://github.com/simonw/research/tree/main/mquickjs-sandbox (Simon Willison, Claude Code)
- Blog: https://simonwillison.net/2025/Dec/23/microquickjs/
