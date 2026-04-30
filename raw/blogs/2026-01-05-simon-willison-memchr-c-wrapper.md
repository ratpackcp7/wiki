---
source_url: https://simonwillison.net/2026/Jan/5/memchr-c-wrapper/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-05-simon-willison-memchr-c-wrapper
---

# Research: pymemchr-c: C Implementation of memchr Library

5th January 2026

Research [pymemchr-c: C Implementation of memchr Library](https://github.com/simonw/research/tree/main/memchr-c-wrapper#readme) — Offering a pure C reimplementation of the Rust-based pymemchr, pymemchr-c delivers high-performance byte and substring search functions to Python with extensive SIMD (SSE2/AVX2/NEON) optimizations and runtime CPU feature detection. Its unique "Packed Pair" substring search algorithm enables the C version to outperform both Python's built-in methods (up to 28x faster) and the original Rust extension (up to 1.5x faster for substring operations), all while removing the need for a Rust toolchain.

Posted 5th January 2026 at 10:05 pm
