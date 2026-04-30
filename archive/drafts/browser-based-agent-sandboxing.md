---
title: Browser-Based Agent Sandboxing
created: 2026-04-11
updated: 2026-04-11
type: sandbox-technology
tags: [browser, sandboxing, security, ai-agents, wasm, csp, wasm, python, rust, monty]
sources:
  - url: https://aifoc.us/the-browser-is-the-sandbox/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/25/the-browser-is-the-sandbox/
    fetched: 2026-04-11
  - url: https://news.ycombinator.com/item?id=46762150
    fetched: 2026-04-11
  - url: https://github.com/pydantic/monty
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/6/pydantic-monty/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/monty-wasm-pyodide
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/pyo3-pyodide-wasm
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
related_pages:
  - drafts/prompt-injection-agent-exfiltration.md
  - drafts/2025-12-23-microquickjs-sandboxing.md
  - drafts/2026-01-16-database-sandboxing.md
---

# Browser-Based Agent Sandboxing

## The principle

The modern web browser — designed over 30 years to run hostile untrusted code — can serve as a lightweight sandbox for AI coding agents, replacing heavyweight container-based isolation (Docker, VMs) for many agentic tasks. Three browser primitives compose the sandbox: File System Access API (filesystem), CSP + iframe sandbox (network), and Web Workers + WASM (code execution).

## Why

Container-based sandboxing (Claude Cowork, `dangerously-skip-permissions`) requires multi-GB images, VM orchestration, and is complex to configure per-user. The browser's security model is already battle-tested by billions of users. For tasks that don't need CLI access, background processing, or hardware access, the browser provides a zero-install, zero-config sandbox.

## Three pillars

### 1. Filesystem isolation
- **Read-only:** `<input type="file" webkitdirectory>` — works cross-browser (Chrome, Firefox, Safari)
- **Full read/write:** File System Access API — provides a folder handle that acts as a chroot (no parent/sibling directory access). Chrome-only currently.
- **Origin-private filesystem (OPFS):** Safari/Firefox alternative, more restrictive

### 2. Network isolation
- **CSP:** `default-src 'none'` + selectively whitelist only the LLM provider API endpoint
- **Double-iframe technique:** Outer frame defines CSP policy, inner frame holds LLM-generated content. Isolates content from network access entirely.
- **Fenced Frames (Chrome):** `disableUntrustedNetwork()` for complete network lockdown (experimental)

### 3. Safe code execution
- **Web Workers:** Isolate execution from UI thread, inherit CSP, can be terminated (kills infinite loops)
- **WebAssembly:** Run compiled binaries (SQLite, ffmpeg, Python via Pyodide, Node.js via WebContainers) without host compromise

## Key projects

| Project | What it does |
|---------|-------------|
| [Co-do](http://co-do.xyz/) | Proof-of-concept browser-based AI file manager — File System Access API for boundary control, CSP for network lockdown, WASM tools in Web Workers |
| [WebVM / CheerpX](https://webvm.io/) | Full Linux x86 environment in browser via WASM |
| [Pyodide](https://pyodide.org/) | Python + scientific stack compiled to WebAssembly |
| [Monty](https://github.com/pydantic/monty) | Rust-based sandboxed Python interpreter — 0.06ms startup, WASM + Pyodide wheel support |
| [v86](https://copy.sh/v86/) | x86 emulator running entirely in browser |

## Monty: Python-in-WASM sandboxing

Pydantic's **Monty** is a Python subset interpreter written in Rust, designed for running LLM-generated code with microsecond startup. Key for browser sandboxing:

- **Direct WASM module**: Load from JS, no CPython needed. Strict sandbox by default (no filesystem/network/env access).
- **Pyodide wheel**: Install into Pyodide for full CPython-in-WASM + Monty hybrid. Best of both worlds — full stdlib for setup, Monty for untrusted execution.
- **Snapshotting**: `dump()`/`load()` serializes interpreter state — enables "pause and resume" across browser tabs or Web Workers.
- **Resource control**: Tracks memory, allocations, stack depth, execution time. Cancels on limit breach.
- **Host function injection**: Developer-defined external functions are the only way out of the sandbox. Clean security boundary.

Simon Willison's research repo has [build scripts](https://github.com/simonw/research/tree/main/monty-wasm-pyodide) for compiling Rust→WASM Pyodide wheels (via PyO3/maturin) — reusable template for other Rust projects.

## Limitations

1. **No background work** — execution pauses when tab is suspended/closed
2. **No direct hardware/syscalls** — limited to Web APIs
3. **Third-party trust** — file contents still sent to LLM provider
4. **Downstream malware** — AI-generated files with macros are dangerous outside the sandbox
5. **Browser support gaps** — File System Access API is Chrome-only; `csp` attribute only in Blink
6. **No undo** — destructive file operations are permanent without separate backups

## Relevance to Chris's stacks

- **Hermes Agent sandboxing:** Current `code_execution_tool` uses local sandboxed execution. Browser-based sandboxing could offer an alternative for web UI (Open WebUI) code execution without Docker-in-Docker overhead.
- **cp7-mobile:** If the app ever needs in-app code execution (AI agent playground), WASM sandboxing is lighter than native sandbox APIs.
- **Prompt injection defense:** Browser CSP + iframe sandbox provides a composable defense layer that's relevant to agent security regardless of the sandboxing approach (see `drafts/prompt-injection-agent-exfiltration.md`).

## Cross-references

- **Agent exfiltration:** `drafts/prompt-injection-agent-exfiltration.md` — Claude Cowork sandboxing, Superhuman AI incident, lethal trifecta
- **JS sandboxing:** `drafts/2025-12-23-microquickjs-sandboxing.md` — lightweight JS sandbox with baked-in resource limits
- **DB sandboxing:** `drafts/2026-01-16-database-sandboxing.md` — DuckDB/SQLite sandboxing for untrusted queries

## Chris's preferences

- See `chris-preferences.md#code-execution` for Chris's stance on sandboxed execution.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- **2026-01-25:** Paul Kinlan publishes "The Browser is the Sandbox" with Co-do proof-of-concept and double-iframe technique (source: aifoc.us)
- **2026-01-25:** Simon Willison covers Kinlan's research, highlights webkitdirectory as hidden gem (source: simonwillison.net)
- **2026-02-06:** Pydantic Monty compiled to WASM + Pyodide wheel — 0.06ms sandboxed Python in browser, two deployment paths (direct WASM + Pyodide wheel). PyO3/maturin→WASM build scripts published. (sources: [blog](https://simonwillison.net/2026/Feb/6/pydantic-monty/), [monty repo](https://github.com/pydantic/monty), [research](https://github.com/simonw/research/tree/main/monty-wasm-pyodide), [pyo3-pyodide](https://github.com/simonw/research/tree/main/pyo3-pyodide-wasm))
