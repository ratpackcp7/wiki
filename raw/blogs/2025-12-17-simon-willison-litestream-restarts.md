---
source_url: https://simonwillison.net/2025/Dec/17/litestream-restarts/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-17-simon-willison-litestream-restarts
---

# Research: Litestream S3 Replication Experiments

# Litestream S3 Replication Experiments

**Source:** https://github.com/simonw/research/tree/main/litestream-restarts

Experiments evaluating Litestream's robustness when SQLite writes occur while Litestream is stopped and later restarted, with focus on replication to S3.

## Key Findings
*   **Simple restart scenario:** No data loss. Upon restart, Litestream streams pending WAL changes.
*   **WAL checkpoint while offline:** No data loss. Litestream detects a database change and uploads a new full snapshot ("generation").
*   **Conclusion:** Both scenarios confirm no data loss — Litestream is robust against restarts and offline WAL checkpoints.

Note: Content reconstructed from daily archive page (individual post returned only sidebar template).
