---
title: Litestream
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [sqlite, backup, replication, devops]
sources:
  - url: https://litestream.io
    fetched: 2026-04-11
  - url: https://github.com/benbjohnson/litestream/releases
    fetched: 2026-04-11
  - url: https://fly.io/blog/litestream-v050-is-here/
    fetched: 2026-04-11
  - url: https://fly.io/blog/litestream-revamped/
    fetched: 2026-04-11
  - url: https://fly.io/blog/litestream-writable-vfs/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Litestream

Standalone disaster recovery tool for SQLite. Runs as a sidecar process, intercepts WAL checkpoints and streams them to object storage in real-time. No code changes to existing applications.

## Version in use

- **Current release:** v0.5.x (actively maintained)
- **Previous stable:** v0.3.13 (legacy, no longer recommended)
- **Status:** Not currently deployed on acerserver — Chris uses `sqlite3 .backup` + restic for Empower DB backup

## Key concepts

1. **LTX file format** — v0.5.0 replaced raw WAL segments with transaction-aware LTX (Log-structured Transaction) files. Supports **hierarchical compaction**: L1 (30s) → L2 (5min) → L3 (1hr). Restores use average of ~12 files instead of replaying every change.

2. **Point-in-time recovery (PITR)** — Can restore to any moment using compacted LTX files. Per-page compression with index at end allows fetching individual pages without downloading entire files.

3. **VFS extension** (read-only → writable in Jan 2026) — SQLite loadable extension for access to Litestream replicas without full restore. Supports point-in-time queries (`PRAGMA litestream_time = '5 minutes ago'`), background hydration, and page caching. Now supports **read-write mode** with `LITESTREAM_WRITE_ENABLED="true"` — writes buffer locally and sync to S3 ~1s (eventually durable, single writer only). Background hydration downloads full DB in background while serving from S3 initially (`LITESTREAM_HYDRATION_PATH`). Available as pip/npm/gem package (`litestream-vfs`).

4. **TXID (Transaction ID)** — Replaces old "generations" model. Monotonically incrementing, eliminates complex parallel-dimension tracking.

5. **Distributed leasing** — S3-based `If-Match` conditional writes prevent multiple nodes from corrupting the same replica. Enables ephemeral nodes with overlapping run times.

## Storage backends

- S3, Google Cloud Storage, Azure Blob Storage
- Tigris, Cloudflare R2, Supabase, Alibaba Cloud OSS (auto-detected)
- NATS JetStream (new in v0.5.0 — avoids object storage dependency)
- Local file system

## Conventions

- Runs as sidecar process — separate from application, no code changes needed
- Single replica destination per database (enforced in v0.5.0+)
- Config file at `/etc/litestream.yml` or pass via `-config` flag
- Continuous replication: `litestream replicate /path/to/db`
- Directory watching: `litestream replicate /data/*.db` (mass DB support)
- Restore: `litestream restore -o restored.db /path/to/db`
- Continuous restore: `litestream restore -f` (follow mode, stays in sync)

## Gotchas

- **v0.5.0 cannot restore from v0.3.x WAL files** — breaking change. Must keep v0.3.x binaries available if you have legacy backups. ([source](https://github.com/benbjohnson/litestream/releases))
- **Single replica only** — v0.5.0 dropped multi-replica support. One destination per database to ensure single source of truth.
- **CLI changes** — `litestream wal` → `litestream ltx`. `generation/index/offset` → `TXID`.
- **CGO removed** — switched from `mattn/go-sqlite3` to `modernc.org/sqlite`. Enables cross-compilation without C toolchain, but the pure-Go SQLite implementation may have subtle differences from the C version.
- **VFS extension is experimental** — not production-ready. Writable VFS is narrowly scoped for Fly.io Sprites use case (eventual durability, temporary hydration file deleted on exit). For standard workloads, use the sidecar approach.

## Chris's preferences

- See `chris-preferences.md#sql--sqlite` for Chris's stance.
- Delta from best practice: Chris currently uses `sqlite3 .backup` + restic nightly backup for Empower DB. Litestream would provide real-time streaming backup (minutes of data loss vs up to 24h with nightly restic). Not yet adopted — evaluate if Empower data volume or access patterns change.
- Last sync with chris-preferences: 2026-04-11

## Related: Corrosion & Macaroons

Fly.io uses SQLite in production distributed systems at scale:
- **Corrosion** — service discovery via SQLite + CRDT + SWIM gossip across WireGuard mesh. Uses `cr-sqlite` for conflict-free replication. ([source](https://github.com/superfly/corrosion))
- **tkdb** (Macaroons) — token database using SQLite + LiteFS (replication) + Litestream (PITR). ~5000 lines Go, few dozen MB, sub-second cross-region replication. Cache hit ratio >98%. ([source](https://github.com/superfly/macaroon))

These are notable production patterns showing SQLite handling distributed state — useful reference if Chris ever needs local-first sync for any project.

## Recent changes
- **Litestream Writable VFS** (2026-01-29): VFS extension now supports read-write mode (`LITESTREAM_WRITE_ENABLED`), write buffering to S3 ~1s, and background hydration (`LITESTREAM_HYDRATION_PATH`). Scoped for Sprites — eventual durability, single writer only. [Fly.io blog](https://fly.io/blog/litestream-writable-vfs/)

- **Fly.io Sprites** (2026-01-15): Litestream used as core durability layer for SQLite metadata in global VM orchestrator. Each account gets independent SQLite DB replicated to S3 via Litestream. [Fly blog](https://fly.io/blog/design-and-implementation/)

- **2025-12-17:** Litestream S3 replication restart experiments — confirmed no data loss when writes occur while Litestream is offline. Simple restart: streams pending WAL changes. WAL checkpoint while offline: detects database change, uploads new full "generation" snapshot. ([source: simonw/research](https://github.com/simonw/research/tree/main/litestream-restarts))
- **2025-12-08:** Litestream v0.5.0 release — LTX file format, hierarchical compaction, NATS JetStream replica type, CGO removal, per-page compression. ([source: Fly.io blog](https://fly.io/blog/litestream-v050-is-here/))
- **2025-12-08:** Architecture deep-dive — CASAAS (compare-and-swap via S3 conditional writes), LiteVFS for read replicas, mass database sync support. ([source: Fly.io blog](https://fly.io/blog/litestream-revamped/))

## Sources

- litestream.io: https://litestream.io (fetched: 2026-04-11)
- GitHub releases: https://github.com/benbjohnson/litestream/releases (fetched: 2026-04-11)
- Fly.io v0.5.0 announcement: https://fly.io/blog/litestream-v050-is-here/ (fetched: 2026-04-11)
- Fly.io architecture deep-dive: https://fly.io/blog/litestream-revamped/ (fetched: 2026-04-11)
- simonw/research litestream-restarts: https://github.com/simonw/research/tree/main/litestream-restarts (fetched: 2026-04-11)
- Simon Willison blog: https://simonwillison.net/2025/Dec/17/litestream-restarts/ (fetched: 2026-04-11)
