---
title: Claude Sonnet 4.6
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [llm, anthropic, claude, sonnet]
sources:
  - url: https://platform.claude.com/docs/en/about-claude/models/migration-guide
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/17/claude-sonnet-46/
    fetched: 2026-04-11
  - url: https://github.com/simonw/llm-anthropic/releases/tag/0.24
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Claude Sonnet 4.6

Released February 17, 2026 by Anthropic. Performance comparable to previous Opus 4.5 at Sonnet pricing.

## Specifications

| Feature | Sonnet 4.6 | Opus 4.5/4.6 | Haiku 4.5 |
| :--- | :--- | :--- | :--- |
| Input price | $3/M | $5/M | — |
| Output price | $15/M | $25/M | — |
| Knowledge cutoff | Aug 2025 | May 2025 | Feb 2025 |
| Context | 200K (1M beta) | 200K (1M beta) | — |

## Migration notes

- **Prefix support dropped** — new models no longer support prefixes. See [migration guide](https://platform.claude.com/docs/en/about-claude/models/migration-guide).
- **Adaptive thinking** — new models include specific details around adaptive thinking.
- **llm-anthropic 0.24** released same day with support for `claude-opus-4.6` and `claude-sonnet-4.6`.

## Dynamic filtering (shipped alongside)

Anthropic released improved web search and web fetch tools with dynamic filtering:
- Claude writes and executes code to filter search results before loading into context
- +11% accuracy on average, -24% input tokens
- Enabled by default with tool types `web_search_20260209` and `web_fetch_20260209`
- Full details: [Anthropic blog](https://claude.com/blog/improved-web-search-with-dynamic-filtering)

## Relevance to Chris's stacks

- Directly relevant — Chris uses Anthropic models via Hermes (gateway default provider)
- Sonnet 4.6 at $3/M input is a strong default vs Opus at $5/M for many tasks
- Dynamic filtering affects `web_search` tool performance in Hermes

## Chris's preferences

- See `chris-preferences.md#llm-models` for Chris's stance on model selection.
- Delta: Chris's gateway currently defaults to xiaomi/mimo-v2-pro/nous. Anthropic models are the primary provider.
- Last sync with chris-preferences: 2026-04-11
