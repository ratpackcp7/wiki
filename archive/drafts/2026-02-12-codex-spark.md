---
title: GPT-5.3-Codex-Spark (OpenAI + Cerebras)
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [openai, cerebras, coding-agents, llm-inference, fast-models]
sources:
  - url: https://openai.com/index/introducing-gpt-5-3-codex-spark/
    fetched: 2026-04-11
  - url: https://cerebras.ai/blog/openai-codexspark
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/12/codex-spark/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# GPT-5.3-Codex-Spark

Ultra-fast coding model from OpenAI, first product of the OpenAI × Cerebras partnership (announced Jan 14, 2026).

## What it is

A smaller, optimized version of GPT-5.3-Codex designed for near-instant developer interaction. The key differentiator is **speed over depth** — 1,000+ tokens/second on Cerebras hardware, compared to standard Codex's much slower response times.

## Key specs

| Property | Value |
|----------|-------|
| Speed | >1,000 tok/s |
| Context | 128k tokens |
| Modality | Text-only (launch) |
| Hardware | Cerebras WSE 3 |
| Benchmarks | SWE-Bench Pro, Terminal-Bench 2.0 (strong) |
| Availability | ChatGPT Pro (research preview), API (design partners) |

## Technical infrastructure

OpenAI built a "latency-first" serving tier for Codex-Spark:
- **Persistent WebSocket connections** — default for Spark (coming to all models)
- **Roundtrip overhead** reduced 80%
- **Per-token overhead** reduced 30%
- **TTFT** reduced 50%

## Design philosophy

"Long-horizon reasoning" vs "real-time collaboration" — OpenAI envisions dual-mode Codex:
1. Autonomous agents working hours/days on complex tasks (standard Codex)
2. Rapid tight-loop iteration where human injects taste and direction (Spark)

Spark is lightweight by default — makes minimal targeted edits, doesn't run tests unless prompted.

## Quality trade-off

Willison's pelican benchmark: Spark produced "an orange duck merged with a bicycle" while Codex Medium produced "a detailed white pelican with motion lines." Speed comes at output quality cost. Best for iterative sessions where you'd rather see results fast and refine than wait for a perfect first draft.

## Relevance to Chris

Codex-Spark's "speed over quality" philosophy aligns with "build function first, optimize later." If API access opens up, could be useful for rapid prototyping in empower/cp7-dashboard workflows. Currently ChatGPT Pro only.

## Chris's preferences

- See `chris-preferences.md#AI-agents` for Chris's stance on coding agents.
- Last sync with chris-preferences: 2026-04-11

## Sources

- [OpenAI announcement](https://openai.com/index/introducing-gpt-5-3-codex-spark/)
- [Cerebras blog](https://cerebras.ai/blog/openai-codexspark)
- [Simon Willison review](https://simonwillison.net/2026/Feb/12/codex-spark/)
