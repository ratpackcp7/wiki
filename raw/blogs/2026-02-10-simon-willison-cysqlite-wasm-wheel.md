---
source_url: https://simonwillison.net/2026/Feb/10/cysqlite-wasm-wheel/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-10-simon-willison-cysqlite-wasm-wheel
---

# Research: cysqlite WebAssembly Wheel

10th February 2026

Research [cysqlite WebAssembly Wheel](https://github.com/simonw/research/tree/main/cysqlite-wasm-wheel#readme) — By cross-compiling cysqlite, a high-performance Cython-based SQLite3 binding, to WebAssembly with Emscripten, this project delivers a ready-to-use wheel for Pyodide that enables rapid, native-like SQLite operations directly in browser-based Python environments. The build pipeline automates all necessary steps, from fetching dependencies to ensuring compatibility with Pyodide 0.25.x (Python 3.11, Emscripten 3.1.46).
