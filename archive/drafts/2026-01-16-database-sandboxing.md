---
title: Database Sandboxing for Untrusted Query Execution
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [sqlite, duckdb, security, sandboxing, python]
sources:
  - url: https://github.com/simonw/research/tree/main/duckdb-security
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/16/duckdb-security/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# Database Sandboxing for Untrusted Query Execution

## The principle

When exposing a database engine to untrusted users or code, layer native security controls (read-only mode, path allowlisting, network blocking, configuration locking) and add manual resource limits (memory caps, thread limits, query timeouts) to create a defense-in-depth sandbox that prevents data exfiltration, data modification, and denial-of-service.

## Why

Database engines like DuckDB and SQLite are designed for trusted environments. Without explicit hardening, a single `ATTACH` or `COPY` statement can read arbitrary files, network access can exfiltrate data, and a crafted query can exhaust memory or CPU. The sandbox approach limits blast radius at every layer so that bypassing one control doesn't compromise the whole system.

## How to apply

1. **Read-only mode first** — use `read_only=True` (DuckDB) or `immutable=1` pragma (SQLite) to prevent all writes.
2. **Disable external access** — set `enable_external_access=false` (DuckDB) or avoid compiling SQLite with extension loading.
3. **Allowlist specific data paths** — if the user needs data access, use `allowed_paths` to restrict to known files only.
4. **Lock configuration** — `lock_configuration=true` (DuckDB v0.8.1+) prevents untrusted queries from reversing security settings. Apply this LAST after all other SET statements.
5. **Set resource limits** — cap threads, memory, and temp disk. Wrap execution in a timer thread with `interrupt()` for query timeouts (DuckDB has no native timeout).

## Anti-patterns

- Relying on application-layer validation alone — the database engine itself must be hardened.
- Setting `lock_configuration` before other settings — it freezes the config and blocks further SET statements.
- Assuming SQLite's WAL mode is safe for multi-user untrusted access — SQLite has no built-in user-level permissions.

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on security defaults.
- Chris uses SQLite heavily (Empower, state.db) — if exposing query access to untrusted users, apply the allowlist + read-only pattern.
- Last sync with chris-preferences: 2026-04-11

## Sources

- Simon Willison research: https://github.com/simonw/research/tree/main/duckdb-security
- Blog attention signal: https://simonwillison.net/2026/Jan/16/duckdb-security/
