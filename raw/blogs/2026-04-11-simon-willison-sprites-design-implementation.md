---
source_url: https://simonwillison.net/2026/Jan/15/the-design-implementation-of-sprites/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-04-11-simon-willison-sprites-design-implementation
---

# The Design & Implementation of Sprites

Sprites are a new architectural primitive from Fly.io designed to function as "disposable computers." They address the latency issues of traditional cloud provisioning by providing near-instant access to compute resources through pre-warmed pools and a novel storage architecture.

> "Sprites are ball-point disposable computers. Whatever mark you mean to make, we've rigged it so you're never more than a second or two away from having a Sprite to do it with." — Thomas Ptacek

## Key Architectural Features

### 1. Instant Provisioning via Warm Pools
- All Sprites run from a standard container image.
- Physical workers maintain pools of "empty" Sprites standing by.
- Creating a Sprite avoids "heavy lifting" and only executes the final start-up steps.

### 2. Innovative Storage Stack
- Sprites are backed by S3-compatible storage.
- Uses a modified JuiceFS model: data ("chunks") on object stores, metadata in fast local storage.
- Metadata store kept durable with Litestream (SQLite backend).
- NVMe utilized as a read-through cache rather than primary storage.

> "The Sprite storage stack... works by splitting storage into data ('chunks') and metadata (a map of where the 'chunks' are). Data chunks live on object stores; metadata lives in fast local storage. In our case, that metadata store is kept durable with Litestream."

### 3. Performance & Billing
- ~300ms checkpointing and restores.
- Differential billing: only charged for data written that differs from the base image.

## Technical Stack

| Component | Technology |
|---|---|
| Base Infrastructure | Fly Machines |
| Primary Storage | S3-compatible Object Storage |
| Caching | Local NVMe (Read-through) |
| Filesystem Logic | Modified JuiceFS |
| Metadata Management | SQLite |
| Metadata Replication | Litestream |

**Blog:** Simon Willison  
**Date:** 2026-01-15  
**Tags:** architecture, sandboxing, sqlite, fly, litestream
