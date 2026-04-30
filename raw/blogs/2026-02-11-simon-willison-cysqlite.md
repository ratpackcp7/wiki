---
source_url: https://simonwillison.net/2026/Feb/11/cysqlite/
fetched: 2026-04-11T13:36:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-02-11-simon-willison-cysqlite
---

# cysqlite: A New Cython-based SQLite Driver

**Source:** Simon Willison's Weblog  
**Author:** Simon Willison (referencing work by Charles Leifer)  
**Date:** February 11, 2026

## Overview
Charles Leifer, the maintainer of `pysqlite3`, has released **cysqlite**, a ground-up rewrite of the SQLite driver using Cython. While it has been in development for years, it is now ready for public testing.

## Key Features & Improvements
*   **Transaction Handling:** Addresses long-standing issues with the standard library's `sqlite3` module. The standard library uses two transaction variants that do not perfectly align with SQLite's native autocommit mechanism; `cysqlite` aims to resolve this discrepancy.
*   **Custom Virtual Tables:** Includes support for custom virtual tables, a feature currently missing from the standard Python `sqlite3` implementation.
*   **Performance:** Built as a Python extension compiled from C via Cython.

## WebAssembly (WASM) & Pyodide Integration
Simon Willison successfully ported `cysqlite` to WebAssembly using **Claude Code**.

### Implementation Details
*   **The Wheel:** A 688KB WASM build (`cysqlite-0.1.4-cp311-cp311-emscripten_3_1_46_wasm32.whl`).
*   **Compatibility Note:** Wheels are strictly tied to the Emscripten version used by Pyodide.
    *   *Works on:* Pyodide 0.25.1 (Emscripten v3.1.46).
    *   *Fails on:* Pyodide 0.27.5 (Emscripten v3.1.58).

### Code Snippet: Loading cysqlite in Pyodide
```python
import micropip
await micropip.install(
    "https://simonw.github.io/research/cysqlite-wasm-wheel/cysqlite-0.1.4-cp311-cp311-emscripten_3_1_46_wasm32.whl"
)
import cysqlite
print(cysqlite.connect(":memory:").execute(
    "select sqlite_version()"
).fetchone())
```

## Resources & Demos
*   **cysqlite GitHub Repository:** https://github.com/coleifer/cysqlite
*   **WASM Demo Page:** https://simonw.github.io/research/cysqlite-wasm-wheel/demo.html
*   **Build Research:** https://github.com/simonw/research/tree/main/cysqlite-wasm-wheel
