---
source_url: https://simonwillison.net/2025/Dec/18/swift-justhtml/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-18-simon-willison-swift-justhtml
---

# swift-justhtml

18th December 2025 - Link Blog

**[swift-justhtml](https://github.com/kylehowells/swift-justhtml)**. First there was Emil Stenström's [JustHTML in Python](https://simonwillison.net/2025/Dec/14/justhtml/), then my [justjshtml in JavaScript](https://simonwillison.net/2025/Dec/15/porting-justhtml/), then Anil Madhavapeddy's [html5rw in OCaml](https://simonwillison.net/2025/Dec/17/vibespiling/), and now Kyle Howells has built a vibespiled dependency-free HTML5 parser for Swift using the same coding agent tricks against the [html5lib-tests](https://github.com/html5lib/html5lib-tests) test suite.

Kyle ran [some benchmarks](https://github.com/kylehowells/swift-justhtml/blob/master/Benchmarks/BENCHMARK_RESULTS.md#performance-comparison) to compare the different implementations:

> *   **Rust (html5ever)** total parse time: 303 ms
> *   **Swift** total parse time: 1313 ms
> *   **JavaScript** total parse time: 1035 ms
> *   **Python** total parse time: 4189 ms

Tags: html5, ai, generative-ai, llms, ai-assisted-programming, vibe-coding, swift
