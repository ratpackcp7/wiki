---
source_url: https://fly.io/blog/parking-lot-ffffffffffffffff/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-parking-lot-ffffffffffffffff
---

# parking_lot: ffffffffffffffff...

Critical concurrency bug in Fly.io's fly-proxy (Rust) involving parking_lot RWLocks.

Context: fly-proxy uses Corrosion for service discovery, Catalog in-memory aggregation protected by RWLocks.

Evolution: 
1. If-let lock persistence bug (Rust syntax footgun)
2. Switched to parking_lot with try_write_for timeouts
3. Explicit closures for lock scoping

The "Non-Euclidean" Bug: Ghost deadlocks — core dumps showed threads waiting for lock, no thread held it. Lock word corrupted to 0xFFFFFFFFFFFFFFFF.

Root cause: Atomic bitwise "double free" — parking_lot's optimization of clearing bits by adding inverse values. Thread 1 releases lock, unparks Thread 2. Thread 2 believes it timed out, tries to clear already-cleared WRITER_PARKED bit. Math fails → massive value added → lock word saturated.

Fix: parking_lot maintainers confirmed bug. Writer bit now cleared separately in wakeup queue.

Lessons: Complex systems fail in degraded modes. Instrumentation vital. Question the foundations when core dumps show impossible states. Regional variance (WAW hit hardest).

Improved: Labeled writes, lock holder tracking.
