---
source_url: https://fly.io/blog/litestream-revamped/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-litestream-revamped
---

# Litestream: Revamped

Architecture deep-dive on Litestream's update integrating LiteFS lessons.

LTX and Compaction:
- New approach uses LTX (Log-structured Transaction) files — sorted changesets for time periods
- Multiple LTX files merge into single file with only latest page versions
- Functions like LSM tree for faster PITR with minimal duplicates

CASAAS (Compare-and-Swap as a Service):
- Uses conditional write support in modern object stores (S3, Tigris)
- Time-based lease ensures only one instance replicates at a time
- Enables ephemeral nodes with overlapping run times without corruption

LiteVFS:
- SQLite Virtual Filesystem for read replicas (vs LiteFS's FUSE approach)
- Library loaded into app code, fetches/caches DB pages from S3/Tigris
- Works in environments where FUSE unavailable (e.g., WASM)

Mass Database Sync:
- Wildcard support: `litestream replicate /data/*.db`
- Can handle hundreds/thousands of databases from single process

Future: AI agents benefit from PITR primitives — experiment, fail, rollback code+state.

Open source. LTX format: github.com/superfly/ltx. VFS: github.com/superfly/litevfs.
