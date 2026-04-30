---
source_url: https://simonwillison.net/2026/Jan/5/memchr-python-wrapper/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-05-simon-willison-memchr-python-wrapper
---

# Research: pymemchr

5th January 2026

Research [pymemchr](https://github.com/simonw/research/tree/main/memchr-python-wrapper#readme) — pymemchr is a Python library that provides ultra-fast byte and substring search functions by binding to the memchr Rust crate, leveraging SIMD optimizations for superior performance. Using PyO3 and Maturin for cross-language integration, pymemchr offers efficient routines for finding single bytes, searching for multiple bytes, and locating substring patterns, both forwards and backwards, with highly competitive speedup over native Python methods.

Posted 5th January 2026 at 7:38 pm
