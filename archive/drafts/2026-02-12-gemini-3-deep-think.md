---
title: Gemini 3 Deep Think
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [google, gemini, reasoning, llm, science, math, pricing]
sources:
  - url: https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/
    fetched: 2026-04-11
  - url: https://deepmind.google/blog/accelerating-mathematical-and-scientific-discovery-with-gemini-deep-think/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/12/gemini-3-deep-think/
    fetched: 2026-04-11
  - url: https://ai.google.dev/gemini-api/docs/models
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/19/gemini-31-pro/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Gemini 3 Deep Think

Google's advanced reasoning model for science, research, and engineering. Released Feb 12, 2026.

## What it is

A specialized reasoning mode within Gemini 3 designed for problems with messy/incomplete data. Not a general chat model — optimized for complex scientific, mathematical, and engineering tasks.

## Benchmarks

| Benchmark | Score |
|-----------|-------|
| Humanity's Last Exam | 48.4% (no tools) |
| ARC-AGI-2 | 84.6% (ARC Prize verified) |
| Codeforces | 3455 Elo |
| IMO 2025 | Gold-medal level |
| Physics/Chemistry Olympiad | Gold-medal level |
| CMT-Benchmark | 50.5% (theoretical physics) |

## Real-world applications

1. **Theoretical physics** (Lisa Carbone, Rutgers) — identified a logical flaw in gravity/quantum mechanics papers that passed human peer review
2. **Materials science** (Wang Lab, Duke) — designed crystal growth recipe for >100 μm semiconductor thin films
3. **Hardware engineering** (Google) — hand-drawn sketch → 3D-printable file

## Gemini 3.1 Pro (released Feb 19, 2026)

The core intelligence model behind Deep Think. First model in the Gemini 3.1 series.

### Pricing

| Token Count | Input (per 1M) | Output (per 1M) |
| :--- | :--- | :--- |
| Under 200K | $2.00 | $12.00 |
| 200K–1M | $4.00 | $18.00 |

Priced identically to Gemini 3 Pro — less than half the price of Claude Opus 4.6 with similar benchmark scores.

### Model IDs
- `gemini-3.1-pro-preview` — general
- `gemini-3.1-pro-preview-customtools` — optimized for tool calling

### Known issues at launch
- High latency (104s for simple "hi" on launch day)
- "High demand" and "Deadline expired" errors under load

## Gemini 3 series overview

Per Google AI docs (fetched 2026-04-11):
- **Gemini 3.1 Pro** — advanced intelligence, complex problem-solving, "vibe coding"
- **Gemini 3 Flash** — frontier-class at fraction of cost
- **Gemini 3.1 Flash-Lite** — extreme cost-efficiency
- **Gemini 3.1 Flash Live** — real-time dialogue, voice-first

## Availability

- Gemini App: Google AI Ultra subscribers
- API: `gemini-3.1-pro-preview` and `gemini-3.1-pro-preview-customtools` available via Gemini API
- llm-gemini plugin: v0.29+ supports both model IDs

## SVG benchmark

Willison's "pelican riding a bicycle" test: produced "the best one I've seen so far" — correct bicycle frame with spokes, chain, chainring; accurate pelican with breeding plumage, red throat pouch; aerodynamic racing posture.

## Relevance to Chris

High-reasoning model for complex problems. Could be useful for structured data analysis tasks (empower finance patterns, HA automation logic). API availability is limited to early access — watch for broader release.

## Recent changes

- 2026-02-19: Gemini 3.1 Pro released — pricing, model IDs, SVG generation improvements ([source](https://simonwillison.net/2026/Feb/19/gemini-31-pro/))
- 2026-02-19: llm-gemini 0.29 adds `gemini-3.1-pro-preview` and `gemini-3.1-pro-preview-customtools` ([source](https://github.com/simonw/llm-gemini/releases/tag/0.29))

## Chris's preferences

- See `chris-preferences.md#AI-models` for Chris's model preferences.
- Delta from best practice: Chris runs Claude Opus 4.6 as primary. Gemini 3.1 Pro is <half the price — worth evaluating if API access is available.
- Last sync with chris-preferences: 2026-04-11

## Sources

- [Google blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/)
- [DeepMind blog](https://deepmind.google/blog/accelerating-mathematical-and-scientific-discovery-with-gemini-deep-think/)
- [Simon Willison review](https://simonwillison.net/2026/Feb/12/gemini-3-deep-think/)
