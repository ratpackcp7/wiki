---
source_url: https://simonwillison.net/2026/Feb/6/pyo3-pyodide-wasm/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-06-simon-willison-pyo3-pyodide-wasm
---

# Research: Building PyO3/Maturin Rust Extension Modules as WebAssembly Wheels for Pyodide

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/6/pyo3-pyodide-wasm/)  
**Date:** February 6, 2026

Research [Building PyO3/Maturin Rust Extension Modules as WebAssembly Wheels for Pyodide](https://github.com/simonw/research/tree/main/pyo3-pyodide-wasm#readme) — Compiling Rust-based Python extension modules (via PyO3 and maturin) into WebAssembly wheels for Pyodide involves precise coordination of toolchain versions and build flags to ensure compatibility. The process relies on maturin (≥1.0) for packaging, the Emscripten SDK (with the exact version used by Pyodide), and a Rust nightly toolchain matching Pyodide's ABI, particularly the `-Z emscripten-wasm-eh` flag and a compatible sysroot for Python 3.13 (Pyodide 0.28+).

Primary source: https://github.com/simonw/research/tree/main/pyo3-pyodide-wasm

Tags: rust
