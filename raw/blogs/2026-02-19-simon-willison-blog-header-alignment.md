---
source_url: https://simonwillison.net/2026/Feb/19/blog-header-alignment/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-19-simon-willison-blog-header-alignment
---

# Research: Header Alignment Investigation

Research: Header Alignment Investigation — Addressing a subtle header alignment issue on simonwillison.net, this investigation tracked down a persistent ~1px height mismatch between left and right headers caused by anchor elements generating taller inline boxes than plain text due to font metrics. Multiple fixes—including removing position:relative/top:1px hacks and setting explicit heights—proved fragile.

Research repo: https://github.com/simonw/research/tree/main/blog-header-alignment#readme
