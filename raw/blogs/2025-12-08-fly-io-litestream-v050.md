---
source_url: https://fly.io/blog/litestream-v050-is-here/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-litestream-v050
---

# Litestream v0.5.0 is Here

Litestream v0.5.0 release — open-source backup/restore system for SQLite that streams WAL checkpoints to object storage.

Strategic shift: Pivoted back to Litestream from LiteFS (multi-region replication). v0.5.0 incorporates LiteFS architectural lessons.

New LTX File Format (core change):
- Replaces raw WAL segments with transaction-aware interchange format supporting compaction
- Problem: High-write scenarios duplicate same page backups repeatedly
- Solution: Hierarchical compaction — L1 (30s), L2 (5min), L3 (1hr)
- Result: PITR using average of only a dozen files

Key improvements:
- No more "generations" — replaced by monotonically incrementing TXID
- Removed CGO: switched from mattn/go-sqlite3 to modernc.org/sqlite (easier cross-compilation)
- Per-page compression with index at end
- New replica type: NATS JetStream
- Updated S3, Google Storage, Azure Blob clients

Breaking changes:
- v0.5.0 cannot restore from old v0.3.x WAL segment files
- Single replica destination per database only
- `litestream wal` → `litestream ltx`
- generation/index/offset → TXID

Future: Litestream VFS for read replicas — instant spin-up, immediate reading from S3 while hydrating.
