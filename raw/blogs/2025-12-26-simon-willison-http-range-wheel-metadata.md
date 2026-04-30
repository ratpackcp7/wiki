---
source_url: https://simonwillison.net/2025/Dec/26/http-range-wheel-metadata/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-26-simon-willison-http-range-wheel-metadata
---

# Research: HTTP Range Requests for Wheel Metadata

Leveraging ZIP file structure and HTTP range requests, tools like uv efficiently extract wheel metadata for Python packages without downloading entire archives. By fetching just the last 16KB of the wheel (central directory and EOCD), parsing for the METADATA file offset, and then requesting exactly its byte range, uv and the accompanying Python prototype routinely reduce bandwidth usage by over 70%.

**Research repo:** https://github.com/simonw/research/tree/main/http-range-wheel-metadata
