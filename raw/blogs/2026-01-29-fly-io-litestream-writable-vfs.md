---
source_url: https://fly.io/blog/litestream-writable-vfs/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-29-fly-io-litestream-writable-vfs
---

# Litestream Writable VFS

**Litestream** is an open-source backup/restore system for SQLite that synchronizes databases with S3-compatible object storage. This update details how Litestream has been integrated into the core storage stack of **Fly.io Sprites** to enable sub-second boot times with durable storage.

---

## Litestream in the Sprites Architecture
Sprites (Fly.io's high-speed compute units) rely on Litestream in two primary ways:
1. **Global Orchestrator:** Every organization in Sprites has its own SQLite database synchronized by Litestream, avoiding the need for a centralized Postgres cluster.
2. **Disk Storage Stack:** Sprites boot with 100GB of durable storage. The "block map" (metadata store) for this storage is a Litestream SQLite database.

### The "Cold Start" Challenge
Sprites must respond to web requests almost instantly. If a machine bounces, the block map must be reconstituted from object storage within milliseconds. To solve this, Fly.io developed the **Litestream VFS (Virtual File System)**.

---

## The Litestream VFS
The VFS is a dynamic library loaded into an app that allows SQLite to query databases directly from object storage without downloading the full file first.

### Key Code Snippet: Point-in-Time Queries
```sql
sqlite> .open file:///my.db?vfs=litestream
sqlite> PRAGMA litestream_time = '5 minutes ago';
sqlite> SELECT * FROM sandwich_ratings ORDER BY RANDOM() LIMIT 3 ;
```

### 1. Writable VFS
Previously read-only, the VFS now supports an optional **read-write mode**.
*   **Single Writer Only:** To avoid distributed complexity, the VFS assumes a single writer and disables polling for remote changes.
*   **Write Buffering:** Writes go to a local temporary buffer and sync to object storage approximately every second or upon clean shutdown.
*   **Durability:** Data is "eventually durable." It is not guaranteed until the sync to S3 occurs.
*   **Activation:** Set the environment variable `LITESTREAM_WRITE_ENABLED="true"`.

### 2. Background Hydration
While querying S3 is fast for cold starts, it is too slow for steady-state operations. Litestream now uses **background hydration** (similar to `dm-clone`):
*   **Mechanism:** The VFS serves queries from S3 immediately while simultaneously downloading the full database in the background.
*   **Switchover:** Once the local file is ready, the VFS transparently switches from S3 reads to local file reads.
*   **Efficiency:** Uses **LTX compaction** to write only the latest versions of each database page.
*   **Activation:** Set the environment variable `LITESTREAM_HYDRATION_PATH`.

---

## Important Considerations
*   **Use Case Specific:** These features are narrowly scoped for the Sprites storage stack. The "eventual durability" and "temporary hydration file" (deleted on exit) may not suit standard applications.
*   **Standard Workloads:** For most users, the standard Litestream sidecar configuration (running alongside an unmodified app) remains the recommended approach for read/write workloads.
*   **Performance:** The VFS works by keeping an index of `(file, offset, size)` for every database page in object storage, using LTX files for rapid reconstitution.

> *"Litestream VFS lets us run point-in-time SQLite queries hot off object storage blobs, answering queries before we've downloaded the database."* — Ben Johnson
