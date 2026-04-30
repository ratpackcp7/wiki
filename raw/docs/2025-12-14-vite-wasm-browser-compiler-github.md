---
source_url: https://github.com/simonw/research/tree/main/vite-wasm-browser-compiler
fetched: 2026-04-11T09:50:00-05:00
fetcher: on-demand
content_type: docs
slug: 2025-12-14-vite-wasm-browser-compiler-github
---

# Research: Vite WASM Browser Compiler

Explores the feasibility of running the Vite build tool as WebAssembly (WASM) entirely within a browser to bundle HTML pages into single, self-contained files.

## Core Research Question: Can Vite Run in the Browser?
The short answer is No. Vite is built for Node.js and relies on:
- File system APIs (`fs`, `path`)
- Child processes for its development server
- Native bindings (specifically the native `esbuild` binary)

### Alternative Browser-Based Bundling Methods
While Vite itself cannot run directly, three alternatives achieve similar results:

1. esbuild-wasm: The WASM version of Vite's internal bundler. (~10MB binary, ~10x slower than native, requires custom plugins for HTTP fetching).
2. @rollup/browser: Rollup's browser build using WASM and an in-memory filesystem (memfs).
3. StackBlitz WebContainers: A full Node.js runtime in the browser. This is the only way to run "real" Vite (including vite-plugin-singlefile) client-side.

## Proof of Concept Implementations

### 1. Simple Bundler (index-simple.html)
- Tech: Pure JavaScript, no external dependencies.
- Mechanism: Fetches HTML via CORS, inlines CSS/JS, and converts images to data URLs.
- Pros: Lightweight, fast.
- Cons: Cannot handle ES module bundling.

### 2. esbuild-wasm Bundler (index.html)
- Tech: esbuild-wasm.
- Mechanism: Uses an HTTP fetch plugin for module resolution.
- Pros: Handles complex ES module bundling.
- Cons: Heavy 10MB download; slower initialization.

### 3. WebContainer Bundler (index-webcontainer.html)
- Tech: StackBlitz WebContainers + Real Vite.
- Mechanism: Boots a Node.js environment to run vite-plugin-singlefile.
- Pros: Identical to local Vite; most capable.
- Cons: Requires Cross-Origin Isolation headers; slow initial boot (npm install).

## Limitations
- CORS: Target pages must have CORS enabled to be fetched.
- Performance: WASM bundling is significantly slower than native execution.
- Memory: Large pages may crash the browser tab due to resource inlining.
- Headers: WebContainers require specific server-side headers (Cross-Origin-Embedder-Policy: require-corp and Cross-Origin-Opener-Policy: same-origin).

## Conclusion
Full-featured browser-based bundling is possible today. While simple inlining works for basic pages, WebContainers provide the most robust solution by allowing the standard Vite ecosystem to run unmodified in a browser environment.
