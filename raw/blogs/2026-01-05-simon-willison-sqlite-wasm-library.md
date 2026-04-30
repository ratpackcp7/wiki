---
source_url: https://simonwillison.net/2026/Jan/5/sqlite-wasm-library/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-05-simon-willison-sqlite-wasm-library
---

# Research: sqlite3-wasm Investigation Report

5th January 2026

Research [sqlite3-wasm Investigation Report](https://github.com/simonw/research/tree/main/sqlite-wasm-library#readme) — Seeking to enable Python's SQLite interface with WebAssembly, the project developed a `sqlite3_wasm` library—a drop-in replacement for Python's standard `sqlite3` module. By compiling SQLite 3.45.3 to WASM with wasi-sdk and wrapping the resulting binary with a Python API, the solution delivers fully functional, in-memory, WASM-powered database operations using the wasmtime runtime.

Posted 5th January 2026 at 7:59 pm
