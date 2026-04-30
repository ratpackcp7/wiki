---
source_url: https://simonwillison.net/2026/Feb/27/unicode-explorer/
fetched: 2026-04-11T00:00:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-02-27-simon-willison-unicode-explorer
---

# Unicode Explorer using binary search over fetch() HTTP range requests

Simon Willison developed a prototype tool that performs a binary search against a large remote file using HTTP range requests. This allows for efficient data retrieval from a 76.6MB file without downloading the entire dataset.

**Core Concept:** Using `fetch()` with the `Range` header to query sorted data stored in a static file. Searching Unicode codepoint metadata (naturally sorted, large). Finding a character like `&` (U+0026) took only 17 steps and transferred just 3,864 bytes out of the 76.6MB total.

**Critical Discovery:** Range request tricks aren't compatible with HTTP compression because they mess with byte offset calculations. Solution: added `'Accept-Encoding': 'identity'` to `fetch()` calls. Many CDNs (like Cloudflare) automatically skip compression if a `content-range` header is present.

**Development Workflow:** Brainstorming with Claude → spec writing → Claude Code for async research project → deployment to tools.simonwillison.net.

Live tool: https://tools.simonwillison.net/unicode-binary-search
Code: https://github.com/simonw/research/tree/main/unicode-explorer-binary-search#readme
Tags: unicode, http-range-requests, binary-search.
