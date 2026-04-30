---
source_url: https://simonwillison.net/2026/Feb/27/unicode-explorer-binary-search/
fetched: 2026-04-11T00:00:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-02-27-simon-willison-unicode-explorer-binary-search
---

# Research: Unicode Explorer — Binary Search Over HTTP

By leveraging HTTP Range requests and fixed-width binary records, Unicode Explorer demonstrates efficient binary search for Unicode data directly from a static file with zero backend or dependencies. The client fetches only one 256-byte record per step, using signposts from `meta.json` to optimize initial narrowing, then performs real-time network-driven binary search, visualized in an interactive log.

Tags: unicode, http-range-requests.
