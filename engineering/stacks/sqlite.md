---
title: SQLite
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [sqlite, python, database, sql, audit]
sources:
  - url: https://github.com/simonw/research/tree/main/sqlite-ripgrep-function
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/7/sqlite-ripgrep-function/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/sqlite-time-limit-extension
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/3/sqlite-time-limit-extension/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-ast
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/30/sqlite-ast-2/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-ast-conformance/releases/tag/0.1
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/30/sqlite-ast-conformance/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-scanner/releases/tag/v0.1.0
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/3/sqlite-scanner/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-history-json
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json-3/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json-2/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json/
    fetched: 2026-04-11
  - url: https://github.com/coleifer/cysqlite
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/11/cysqlite/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
sources:
  - url: https://github.com/simonw/research/tree/main/sqlite-ripgrep-function
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/7/sqlite-ripgrep-function/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/sqlite-time-limit-extension
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/3/sqlite-time-limit-extension/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-ast
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/30/sqlite-ast-2/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-ast-conformance/releases/tag/0.1
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/30/sqlite-ast-conformance/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-scanner/releases/tag/v0.1.0
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/3/sqlite-scanner/
    fetched: 2026-04-11
  - url: https://github.com/simonw/sqlite-history-json
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json-3/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json-2/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/8/sqlite-history-json/
    fetched: 2026-04-11
  - url: https://github.com/coleifer/cysqlite
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/11/cysqlite/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/sqlite-hamming-extension
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/17/sqlite-hamming-extension/
    fetched: 2026-04-11
---

# SQLite

## Version in use

- **System:** 3.45.1 (2024-01-30, 64-bit)
- **Python `sqlite3` module:** 3.50.4 (bundled, may differ from system)
- **Used by:** Empower (`~/projects/empower/data/empower.db`), Hermes (`state.db`), wiki search index

## Key concepts

1. **WAL mode** — Write-Ahead Logging enables concurrent readers with a single writer. Critical for Empower's multi-process access. **Never copy a WAL-mode database with `cp`** — use `sqlite3 .backup`.
2. **FTS5** — Full-text search extension. Used by Hermes `state.db` for session search. Supports boolean operators, phrase queries, and prefix queries.
3. **Extensions** — SQLite supports loadable extensions (`.load` in CLI, `conn.load_extension()` in Python). Enables custom functions, virtual tables, and integration with external tools.
4. **Virtual tables** — Tables backed by external data sources or custom logic. Examples: FTS5, `json_each()`, and community extensions like `sqlite-ripgrep`.
5. **JSON support** — Built-in `json_extract()`, `json_each()`, `json_group_array()` since 3.38+. Essential for working with JSON columns or parsing structured results.

## Conventions

- **WAL mode always** for databases with concurrent access: `PRAGMA journal_mode=WAL;`
- **Backup:** `sqlite3 <db> ".backup <dest>"` — never `cp` a live database
- **Connection strings:** Empower DB at `~/projects/empower/data/empower.db`
- **Python:** Use `sqlite3` stdlib (no pip package needed). Context managers for transactions.

## Gotchas

- **WAL + `cp` = corruption** — WAL mode has a separate `-wal` and `-shm` file. Copying only the `.db` file loses uncommitted transactions. Always use `.backup`.
- **Python `sqlite3` version mismatch** — The module bundles its own SQLite (currently 3.50.4), which may be newer than the system `sqlite3` CLI (3.45.1). Features like new JSON functions may work in Python but not in the CLI.
- **`check_same_thread=True` default** — Python's `sqlite3` defaults to thread-safe mode. Disable with `check_same_thread=False` for multi-threaded Flask/FastAPI apps.
- **No `UPSERT` before 3.24** — `INSERT ... ON CONFLICT DO UPDATE` requires SQLite 3.24+ (2018). Not an issue for current versions but matters for older embedded systems.
- **Table-valued function limitations** — Python's `sqlite3` module does not support true table-valued functions. Workaround: return JSON and use `json_each()` to unpack. C extensions can register proper virtual tables.

## Chris's preferences

- See `chris-preferences.md#sql--sqlite` for Chris's stance.
- Delta from best practice: Chris uses WAL mode (matches best practice). Backup rule (`.backup` not `cp`) is explicitly enforced.
- Last sync with chris-preferences: 2026-04-11

## Backup & replication

- **Current approach:** `sqlite3 .backup` + restic nightly (24h RPO). See `restic-backup-to-gdrive.md`.
- **Litestream** — streaming backup to S3/object storage with PITR. v0.5.0 introduced LTX format with hierarchical compaction. Not yet adopted. See `stacks/litestream.md`.
- **Production patterns:** Fly.io runs SQLite at distributed scale — Corrosion (CRDT+gossip) and tkdb (Macaroons token DB via LiteFS+Litestream). Both use `cr-sqlite` for conflict-free replication.

## Recent changes
- **SQLite Hamming Distance Extension** (2026-02-17): Research comparing scalar function vs virtual table for binary embedding search. Virtual table with contiguous C memory buffer delivers top-k results 6-7x faster than scalar (12ms vs 80ms for 1M rows). Build: `gcc -g -fPIC -shared hamming_vtab.c -o hamming_vtab.so -O3 -mpopcnt`. [GitHub](https://github.com/simonw/research/tree/main/sqlite-hamming-extension) | [blog](https://simonwillison.net/2026/Feb/17/sqlite-hamming-extension/)
- **cysqlite 0.1.4** (2026-02-11): New Cython-based SQLite driver by Charles Leifer (Peewee author). DB-API 2.0 compatible, async support, virtual tables, custom functions/aggregates. WASM build available for Pyodide. Alternative to stdlib `sqlite3` with better transaction handling and no virtual table limitations. [GitHub](https://github.com/coleifer/cysqlite) | [blog](https://simonwillison.net/2026/Feb/11/cysqlite/)
- **sqlite-history-json 0.1a0–0.3a0** (2026-02-08): Python library + CLI for SQLite table history tracking via JSON audit log. Uses triggers to record INSERT/UPDATE/DELETE into companion `_history_json` tables with "updated values" approach (stores only changed columns). Supports change grouping, point-in-time restore, and SQL-only reconstruction via recursive CTE with `json_patch()`. Relevant to Empower transaction auditing. [GitHub](https://github.com/simonw/sqlite-history-json) | [blog 0.1](https://simonwillison.net/2026/Feb/8/sqlite-history-json-3/) | [blog 0.2](https://simonwillison.net/2026/Feb/8/sqlite-history-json-2/) | [blog 0.3](https://simonwillison.net/2026/Feb/8/sqlite-history-json/)
- **sqlite-scanner v0.1.0** (2026-02-03): CLI tool to scan folders for SQLite database files. Cross-platform (Go-based, linux/arm64+amd64). Useful for forensics/audit of SQLite file sprawl. [GitHub](https://github.com/simonw/sqlite-scanner/releases/tag/v0.1.0) | [blog](https://simonwillison.net/2026/Feb/3/sqlite-scanner/)
- **sqlite-ast 0.1a0** (2026-01-30): Python library for parsing SQLite SELECT queries into an AST. Dictionary-based `parse()` and dataclass-based `parse_ast()` output. Includes conformance suite (`sqlite-ast-conformance 0.1`) for language-independent parser validation. Browser playground via Pyodide. [GitHub](https://github.com/simonw/sqlite-ast) | [blog](https://simonwillison.net/2026/Jan/30/sqlite-ast-2/) | [conformance](https://github.com/simonw/sqlite-ast-conformance/releases/tag/0.1)
- **Django production SQLite guide** (2026-01-27): Production-ready PRAGMA settings (WAL, IMMEDIATE transaction mode, 128MB mmap, cache separation), Litestream deployment pattern. See `stacks/django.md`. [source](https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production)
- **Fly.io Sprites** (2026-01-15): Production use of SQLite as metadata store for global VM orchestrator, replicated via Litestream to S3. Modified JuiceFS for data/metadata split. [Fly blog](https://fly.io/blog/design-and-implementation/) | [Simon Willison](https://simonwillison.net/2026/Jan/15/the-design-implementation-of-sprites/)

- *Last notable item outside 90-day window: 2026-01-03 Simon Willison's `sqlite-time-limit-extension` — Python C extension using SQLite progress handler to enforce query execution time limits in milliseconds. ([source](https://github.com/simonw/research/tree/main/sqlite-time-limit-extension))*

## Sources

- SQLite Ripgrep Function (GitHub): https://github.com/simonw/research/tree/main/sqlite-ripgrep-function (fetched: 2026-04-11)
- Simon Willison blog post: https://simonwillison.net/2025/Dec/7/sqlite-ripgrep-function/ (fetched: 2026-04-11)
- Litestream v0.5.0: https://fly.io/blog/litestream-v050-is-here/ (fetched: 2026-04-11)
- Corrosion (distributed SQLite): https://fly.io/blog/corrosion/ (fetched: 2026-04-11)
