---
source_url: https://simonwillison.net/2026/Feb/17/sqlite-hamming-extension/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-sqlite-hamming-extension
---

# Research: SQLite Hamming Distance Extension: Scalar vs Virtual Table

Research [SQLite Hamming Distance Extension: Scalar vs Virtual Table](https://github.com/simonw/research/tree/main/sqlite-hamming-extension#readme) — Exploring efficient Hamming distance search in SQLite for binary embeddings, this project implements both a scalar function extension and a virtual table extension as described in "Hamming Distance for Hybrid Search in SQLite". The scalar function scans and sorts rows to locate nearest matches, while the virtual table caches embeddings and leverages a max-heap to deliver top-k results up to seven times faster.
