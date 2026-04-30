---
source_url: https://simonwillison.net/2026/Feb/20/taalas/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-20-simon-willison-taalas
---

# Taalas serves Llama 3.1 8B at 17,000 tokens/second

This new Canadian hardware startup just announced their first product - a custom hardware implementation of the Llama 3.1 8B model (from July 2024) that can run at a staggering 17,000 tokens/second.

They describe their Silicon Llama as "aggressively quantized, combining 3-bit and 6-bit parameters." Their next generation will use 4-bit - presumably they have quite a long lead time for baking out new models!

Demo at [chatjimmy.ai](https://chatjimmy.ai/).

Primary source: [Taalas - The path to ubiquitous AI](https://taalas.com/the-path-to-ubiquitous-ai/)

Key metrics vs SOTA GPU inference:
- Speed: 17,000 tokens/sec per user (~10x faster)
- Cost: 20x less to build
- Power: 10x lower consumption
- Development: Any AI model → custom silicon in 2 months

First product delivered by team of 24 people, spent only $30M of $200M+ raised.
