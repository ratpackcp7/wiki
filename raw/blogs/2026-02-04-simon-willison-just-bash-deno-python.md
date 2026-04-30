---
source_url: https://simonwillison.net/2026/Feb/4/just-bash-deno-python/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-04-simon-willison-just-bash-deno-python
---

# just-bash: Deno JSONL Server + Python Client

Exploring the capabilities of just-bash, this project integrates the TypeScript-based bash emulator into a persistent, JSONL-over-stdio server in Deno, accessible via a robust Python client library. The solution enables sandboxed bash scripting with comprehensive built-in commands, a virtual filesystem, and optional network access, with persistent state and fine-grained request control (env, cwd, timeout) supported.

Source: https://github.com/simonw/research/tree/main/just-bash-deno-python