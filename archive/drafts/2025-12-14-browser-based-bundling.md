---
title: Browser-Based Bundling
created: 2026-04-11
updated: 2026-04-11
type: draft
tags: [javascript, vite, esbuild, wasm, bundling, frontend]
confidence: unverified
sources:
  - url: https://github.com/simonw/research/tree/main/vite-wasm-browser-compiler
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/14/vite-wasm-browser-compiler/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
---

# Browser-Based Bundling

## Summary

Running full Vite in the browser is not possible — it depends on Node.js filesystem APIs, child processes, and native esbuild bindings. Three practical alternatives exist:

1. **Pure JS inlining** — fetch HTML, inline CSS/JS/images into data URLs. Lightweight, no dependencies. Cannot handle ES modules.
2. **esbuild-wasm** — browser-compatible bundler via WASM (~10MB). Handles ES modules. ~10x slower than native, needs custom HTTP fetch plugin for module resolution.
3. **StackBlitz WebContainers** — full Node.js runtime in the browser. The only way to run real Vite + vite-plugin-singlefile client-side. Requires Cross-Origin-Isolation headers (`COEP: require-corp`, `COOP: same-origin`).

## When to use

- **Single-file HTML export**: Simple inliner for basic pages (no modules)
- **Client-side module bundling**: esbuild-wasm when you need ES module support without a server
- **Full Vite in browser**: WebContainers when you need the complete Vite ecosystem (plugins, transforms, HMR)

## Gotchas

- CORS: target pages must allow cross-origin fetching
- Memory: large pages with many assets can crash the browser tab
- WebContainers need specific COI headers served by the host page
- esbuild-wasm 10MB initial download is significant for mobile

## Chris's preferences

- See `chris-preferences.md` for frontend bundling preferences.
- Delta from best practice: This is a research topic, not a current stack decision. Filed as draft pending Chris interest.
- Last sync with chris-preferences: 2026-04-11
