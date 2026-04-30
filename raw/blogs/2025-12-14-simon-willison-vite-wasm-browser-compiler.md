---
source_url: https://simonwillison.net/2025/Dec/14/vite-wasm-browser-compiler/
fetched: 2026-04-11T09:45:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-14-simon-willison-vite-wasm-browser-compiler
---

# Research: Browser-Based Single File Bundler

Investigating the feasibility of Vite as a browser-based bundler, this project demonstrates that while Vite itself cannot operate directly in the browser due to its Node.js dependencies, client-side file bundling is achievable using alternative strategies. Three approaches were prototyped: a pure JavaScript "simple" bundler for inlining assets, an esbuild-wasm browser integration for ES module support, and full Vite bundling via StackBlitz WebContainers using vite-plugin-singlefile.

Source: [simonw/research — vite-wasm-browser-compiler](https://github.com/simonw/research/tree/main/vite-wasm-browser-compiler#readme)
