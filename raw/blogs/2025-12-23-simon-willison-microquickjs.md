---
source_url: https://simonwillison.net/2025/Dec/23/microquickjs/
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-23-simon-willison-microquickjs
---

# MicroQuickJS: A Tiny, Secure JavaScript Engine for Sandboxing

## Overview
**MicroQuickJS (MQuickJS)** is a new JavaScript engine by Fabrice Bellard (creator of ffmpeg, QEMU, and QuickJS). It is specifically designed for embedded systems and high-efficiency environments where memory and storage are extremely limited.

### Key Specifications
> "MicroQuickJS (aka. MQuickJS) is a Javascript engine targetted at embedded systems. It compiles and runs Javascript programs with as low as **10 kB of RAM**. The whole engine requires about **100 kB of ROM** (ARM Thumb-2 code) including the C library. The speed is comparable to QuickJS."

---

## Sandboxing Potential
Simon Willison investigated MicroQuickJS as a solution for executing untrusted code (e.g., user-submitted scripts or LLM-generated code) within a restricted environment.

### Security Features
*   **Resource Limits:** Robust memory and time limits are "baked in."
*   **Isolation:** No native exposure to dangerous primitives like filesystem or network access.
*   **Regex Safety:** Unlike many engines, its regular expression engine calls the interrupt handler during backtracking. This prevents "ReDoS" (Regular Expression Denial of Service) attacks, as the configured time limit will still trigger.

---

## Research & Implementation (via Claude Code)
Willison used **Claude Code** to perform asynchronous research, testing the engine's viability across different platforms.

### 1. Python Integration
Claude successfully built three types of Python integrations:
*   A library calling a MicroQuickJS shared library via FFI.
*   A native Python C extension.
*   A wrapper for the MicroQuickJS CLI tool.

### 2. WebAssembly (Wasm) Challenges
Compiling to Wasm proved more difficult due to the engine's architecture:
*   **The Issue:** MicroQuickJS uses `setjmp`/`longjmp` for error handling, which is notoriously difficult to map to standard WebAssembly.
*   **Status:** Working versions were achieved for **Node.js, Deno, and Pyodide**.
*   **The "Gross Hack":** A workaround was required to get it running in `wasmtime` and `wasmer`.

### 3. Size Comparison (Web Playground)
Willison built an interactive playground to compare MicroQuickJS against the original QuickJS:
*   **QuickJS:** 2.28 MB (675 KB transferred).
*   **MicroQuickJS:** 303 KB (120 KB transferred).

---

## Resources
*   **Project Link:** [MicroQuickJS on GitHub](https://github.com/bellard/mquickjs)
*   **Interactive Playground:** [tools.simonwillison.net/microquickjs](https://tools.simonwillison.net/microquickjs)
*   **Research Transcript:** [Full Claude Code Session](https://gistpreview.github.io/?6e07c54db7bb8ed8aa0eccfe4a384679)

**Final Verdict:** MicroQuickJS is a "very solid new entrant" for robust sandboxing, offering a rich subset of JavaScript with a tiny footprint and built-in protections against CPU and memory exhaustion.

Posted 23rd December 2025.

This is a **blog post** by Simon Willison.