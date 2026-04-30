---
source_url: https://simonwillison.net/2026/Feb/4/wasm-repl-cli/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-04-simon-willison-wasm-repl-cli
---

# WASM REPL CLI Tools

WASM REPL CLI Tools enable JavaScript and Python REPLs from the command line by leveraging WebAssembly runtimes in Go, built on the wazero engine. The project supplies separate binaries for each language—one using QuickJS WASI and the other CPython WASI—offering direct code execution, interactive shells, and a JSONL mode. JSONL mode lets external applications submit code for execution while maintaining persistent state across requests, facilitating programmatic integration.

Source: https://github.com/simonw/research/tree/main/wasm-repl-cli