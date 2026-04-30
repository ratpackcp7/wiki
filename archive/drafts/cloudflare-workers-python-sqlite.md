---
title: Cloudflare Workers + Python + SQLite (D1)
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [cloudflare, workers, python, sqlite, d1, pyodide, serverless]
sources:
  - url: https://simonwillison.net/2026/Jan/26/cloudflare-workers-python-sqlite/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/cloudflare-workers-python-sqlite
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
version_pinned: "N/A — research as of Jan 2026"
---

# Cloudflare Workers + Python + SQLite (D1)

## Overview
Cloudflare Workers support Python via Pyodide (CPython compiled to WebAssembly). The `sqlite3` module is built into the Pyodide runtime, making D1 (Cloudflare's SQLite) accessible from Python workers.

## Key concepts
1. **Pyodide runtime** — Python runs inside a V8 isolate via WebAssembly; Cloudflare snapshots memory for fast cold starts
2. **D1 for persistence** — Cloudflare's managed SQLite, accessed via JS `env.DB.prepare().run()` or Python's built-in `sqlite3`
3. **`sqlite3` is built-in** — no pip install needed; available in the Pyodide runtime out of the box
4. **No framework support yet** — Starlette/FastAPI require network access to download Pyodide bundle, which `workerd` doesn't support in local dev

## Gotchas
- **D1 uses `prepare().run()`, not `exec()`** — JavaScript D1 API requires prepared statements
- **Local dev needs `--persist-to`** — `wrangler dev --local --persist-to .wrangler/state` for data persistence across restarts
- **Python workers: no `HTTP_PROXY`** — `workerd` runtime doesn't honor proxy env vars; Pyodide bundle download fails in proxy-only environments
- **Pure Python only in local dev** — frameworks like Starlette work in production but not locally due to download requirements

## Status matrix (Python)
| Feature | Status |
| :--- | :--- |
| sqlite3 module | ✅ Built into Pyodide |
| Form handling | ✅ |
| Web frameworks (Starlette/FastAPI) | ❌ Blocked in local dev |
| Crypto/SSL | ❌ Requires network fetch |

## Chris's preferences
- See `chris-preferences.md` for Chris's stance on Cloudflare and SQLite.
- Chris uses Cloudflare Zero Trust tunnel for *.cp7.dev routing.
- Chris's projects use SQLite extensively (Empower, Hermes state.db).
- Last sync with chris-preferences: 2026-04-11

## Sources
- Simon Willison research: https://github.com/simonw/research/tree/main/cloudflare-workers-python-sqlite
- Blog post: https://simonwillison.net/2026/Jan/26/cloudflare-workers-python-sqlite/
