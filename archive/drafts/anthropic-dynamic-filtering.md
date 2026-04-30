---
title: Anthropic Dynamic Filtering (Web Search)
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [llm, anthropic, web-search, tool-use, agentic]
sources:
  - url: https://claude.com/blog/improved-web-search-with-dynamic-filtering
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/17/dynamic-filtering/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Anthropic Dynamic Filtering (Web Search)

Released February 17, 2026 alongside Claude Opus 4.6 and Sonnet 4.6. Claude can now write and execute code during web searches to filter results before they enter the context window.

## Performance improvements

| Benchmark | Metric | Before | After |
| :--- | :--- | :--- | :--- |
| BrowseComp | Sonnet 4.6 accuracy | 33.3% | 46.6% |
| BrowseComp | Opus 4.6 accuracy | 45.3% | 61.6% |
| DeepsearchQA | Sonnet 4.6 F1 | 52.6 | 59.4 |
| DeepsearchQA | Opus 4.6 F1 | 69.8 | 77.3 |

- Average: +11% accuracy, -24% input tokens
- Note: price-weighted costs decreased for Sonnet but increased for Opus (filtering code adds reasoning cost)

## API implementation

Enabled by default with latest tool versions:
- `web_search_20260209` — search tool with dynamic filtering
- `web_fetch_20260209` — fetch tool with dynamic filtering

## GA agentic tools (shipped alongside)

- **Code Execution** — sandbox for agent data analysis
- **Memory** — persistent file directory across conversations
- **Programmatic Tool Calling** — multi-tool workflows within code
- **Tool Search** — dynamic tool discovery
- **Tool Use Examples** — sample calls in tool definitions

## Relevance to Chris's stacks

- Hermes uses Anthropic's web_search tool — dynamic filtering should improve search quality automatically
- Monitor cost impact: Opus filtering code may increase total cost despite fewer input tokens
- Sonnet 4.6 + dynamic filtering could be a strong default for search-heavy tasks

## Chris's preferences

- See `chris-preferences.md#llm-models` for Chris's stance.
- Last sync with chris-preferences: 2026-04-11
