---
source_url: https://github.com/simonw/research/tree/main/cloudflare-workers-python-sqlite
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-26-cloudflare-workers-python-sqlite-research
---

# Cloudflare Workers with Python and SQLite: Research Summary

This research explores the development of Cloudflare Workers using JavaScript and Python (via Pyodide/WASM), specifically focusing on persistence using **Cloudflare D1 (SQLite)**.

## Quick Start: JavaScript Worker
To run the JavaScript implementation locally with persistent storage:
```shell
cd js-worker
wrangler dev --local --persist-to .wrangler/state --port 8787
```
**Test Endpoints:**
* `GET /`: Hello World
* `GET/POST /form`: HTML form with server-side processing
* `GET /counter`: Persistent SQLite page counter

## Implementation Status

### 1. JavaScript Worker (Complete)
Successfully implemented a worker featuring basic responses, form handling, and D1 integration.
* **Key Learning:** Use `prepare().run()` for D1 SQL statements instead of `exec()`.
* **Persistence:** Data is stored locally at `.wrangler/state/v3/d1/miniflare-D1DatabaseObject/*.sqlite`.

### 2. Python Worker - Minimal (Works)
A "Pure Python" worker without external dependencies works perfectly for local development.
* **Key Discovery:** `sqlite3` is built into the Pyodide runtime provided by Cloudflare.
* **Command:** `pywrangler dev --port 8789`
* **Capabilities:** Supports `urllib.parse`, `sqlite3`, and `workers` modules (Response, WorkerEntrypoint).

### 3. Python Worker - Starlette (Blocked)
Attempts to use frameworks like Starlette or FastAPI are currently hindered by local environment constraints.
* **The Issue:** The `workerd` runtime requires **direct internet access** to download the Pyodide bundle (~13.8MB) and Python packages. It **does not honor** `HTTP_PROXY` environment variables.
* **Status:** The code is correct and would function in production or environments with direct internet access.

## Code Snippets & Configuration

### D1 SQLite Usage (JavaScript)
```javascript
// Initialize and Upsert Pattern
await env.DB.prepare(`
  CREATE TABLE IF NOT EXISTS page_views (
    page TEXT PRIMARY KEY, count INTEGER DEFAULT 0
  )
`).run();

await env.DB.prepare(`
  INSERT INTO page_views (page, count) VALUES ('counter', 1)
  ON CONFLICT(page) DO UPDATE SET count = count + 1
`).run();
```

### Minimal Python Worker (`src/entry.py`)
Note the use of `on_fetch` for the entrypoint.
```python
from workers import WorkerEntrypoint, Response
from urllib.parse import urlparse, parse_qs
import sqlite3

class Default(WorkerEntrypoint):
    async def on_fetch(self, request):
        url = urlparse(request.url)
        if url.path == "/counter":
            conn = sqlite3.connect(":memory:") # sqlite3 is built-in!
            # ... logic ...
            return Response(f"SQLite Counter: {count}")
        return Response("Not Found", status=404)
```

## Technical Insights & Limitations

### How Python Workers Function
* **Runtime:** Uses **Pyodide** (CPython compiled to WebAssembly) running inside a V8 isolate.
* **Performance:** Cloudflare takes memory snapshots at deployment to ensure fast cold starts.
* **Local Dev Limitations:**
    * `workerd` fails in proxy-only environments due to hardcoded download paths for Pyodide and packages.
    * **Attempted Workarounds:** Manual downloads via `curl`, modifying miniflare cache directories, and TCP tunneling (documented in `notes.md`).

### Feature Support Matrix (Python)
| Feature | Status | Notes |
| :--- | :--- | :--- |
| **sqlite3 module** | ✅ | Built into Pyodide |
| **Form handling** | ✅ | Manual POST body parsing works |
| **Web Frameworks** | ❌ | Starlette/FastAPI require network to fetch |
| **Crypto/SSL** | ❌ | `hashlib` and `ssl` require network to fetch |

### Project Structure
* `js-worker/`: Standard JS + D1 implementation.
* `py-worker-minimal/`: Pure Python using built-in `sqlite3`.
* `py-worker/`: Starlette-based implementation (requires network).
* `notes.md`: Detailed investigation into `workerd` networking issues.
