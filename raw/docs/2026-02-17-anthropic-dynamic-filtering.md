---
source_url: https://claude.com/blog/improved-web-search-with-dynamic-filtering
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-17-anthropic-dynamic-filtering
---

# Improved Web Search with Dynamic Filtering

Anthropic has introduced **dynamic filtering** for its web search and web fetch tools, released alongside Claude Opus 4.6 and Sonnet 4.6 on February 17, 2026.

This feature allows Claude to natively write and execute code to post-process search results before they enter the context window. By filtering out irrelevant HTML and data, the model increases accuracy while reducing token consumption.

## Key Performance Improvements
- **Accuracy:** Improved by an average of **11%**.
- **Efficiency:** Used **24% fewer input tokens** on average.
- **BrowseComp** (Finding specific hard-to-find info): Sonnet 4.6: 33.3% → 46.6%, Opus 4.6: 45.3% → 61.6%
- **DeepsearchQA** (Multi-step research/completeness): Sonnet 4.6 F1: 52.6 → 59.4, Opus 4.6 F1: 69.8 → 77.3

## Implementation in the API
Dynamic filtering is enabled by default when using the latest versions of the search and fetch tools (type `web_search_20260209` and `web_fetch_20260209`).

## General Availability of Agentic Tools
- **Code Execution:** Sandbox for agents to run code for data analysis.
- **Memory:** Persistent file directory for cross-conversation storage.
- **Programmatic Tool Calling:** Multi-tool workflows within code.
- **Tool Search:** Dynamic tool discovery from large libraries.
- **Tool Use Examples:** Sample calls within tool definitions.

## Developer Notes
- Monitor costs: Opus 4.6 writes filtering code which may offset input token savings.
- Optimized for sifting through technical documentation and verifying citations.
