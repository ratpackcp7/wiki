---
source_url: https://simonwillison.net/2025/Dec/14/js-api-tagger/
fetched: 2026-04-11T09:45:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-14-simon-willison-js-api-tagger
---

# Research: Automatic JavaScript API Tagging for simonw/tools

Efficiently categorizing the 155 HTML tools in simonw/tools by their JavaScript API usage, this project developed an automated pipeline combining Cheerio for HTML parsing and Acorn for JavaScript AST analysis. The solution robustly filters out false positives from comments, strings, and non-code regions, accurately tagging over 60 Web APIs and handling modern ES modules and edge script types.

Source: [simonw/research — js-api-tagger](https://github.com/simonw/research/tree/main/js-api-tagger#readme)
