---
source_url: https://github.com/simonw/research/tree/main/sqlite-hamming-extension
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-17-sqlite-hamming-extension
---

# SQLite Hamming Distance Extension: Scalar vs Virtual Table

Explores optimizing binary embedding searches in SQLite by comparing a standard **scalar function** approach against a custom **virtual table** implementation.

## Core Concept: Binary Embeddings
Binary embeddings represent text as bit vectors (e.g., 1024 bits = 128 bytes). Similarity via Hamming distance: XOR vectors, count 1-bits (popcount), lower distance = higher similarity.

## Scalar Function Extension (`hamming.c`)
- Uses `__builtin_popcountll` for hardware-accelerated bit counting
- Usage: `SELECT rowid, hamming_distance(:query, embedding) as dist FROM documents ORDER BY dist LIMIT 10;`

## Virtual Table Extension (`hamming_vtab.c`)
- Lazy-loads all embeddings into contiguous C memory buffer on first query
- Uses max-heap for top-k results without full sort
- Usage: `CREATE VIRTUAL TABLE search USING hamming_topk(documents, embedding);`

## Benchmark Results (1M rows, 128-byte vectors, in-memory SQLite)
| Method | Performance | Notes |
| :--- | :--- | :--- |
| Pure Python | ~11,478ms | Baseline |
| Scalar Function | 80ms | ~200x faster than Python |
| Virtual Table | 12ms | 6-7x faster than Scalar |

## Key Insight
The 6-7x speedup of the Virtual Table is primarily from the **contiguous C memory buffer** (cache-friendly, avoids B-tree navigation and value deserialization overhead), not just the heap sort.

## Trade-offs
- Scalar: no memory overhead, always current, simple
- Virtual Table: ~136MB for 1M rows, stale if source table changes, complex C code

## Build
```shell
gcc -g -fPIC -shared hamming.c -o hamming.so -O3 -mpopcnt
gcc -g -fPIC -shared hamming_vtab.c -o hamming_vtab.so -O3 -mpopcnt
```
