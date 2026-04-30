---
source_url: https://www.anthropic.com/news/claude-opus-4-6
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-05-anthropic-opus-4-6
---

# Claude Opus 4.6

**Release Date:** February 5, 2026
**Model Identifier:** `claude-opus-4-6`

Claude Opus 4.6 is Anthropic's upgraded "smartest model," designed for advanced coding, complex reasoning, and autonomous agentic tasks. It introduces a 1M token context window and new developer controls for "thinking" and "effort."

---

## Key Capabilities & Performance

*   **Coding & Agents:** Improved planning, longer task endurance, and better self-debugging. Leads Terminal-Bench 2.0 (agentic coding) and Humanity's Last Exam (multidisciplinary reasoning).
*   **Economic Value:** On GDPval-AA (finance/legal tasks), outperforms GPT-5.2 by ~144 Elo points and Opus 4.5 by 190 points.
*   **Search:** Leads on BrowseComp for locating hard-to-find online information and DeepSearchQA for multi-step agentic search.
*   **Long Context:** 1M token context window (in beta). On MRCR v2 needle-in-haystack: 76% vs Sonnet 4.5's 18.5%.

### Notable Benchmark Scores
- BigLaw Bench: 90.2% (highest of any Claude model)
- SWE-bench Verified: 81.42% (with prompt modification)
- Vending-Bench 2: Earned $3,050.53 more than Opus 4.5
- Life Sciences: ~2x better than Opus 4.5 in computational biology and organic chemistry

## New Developer & API Features

*   **Adaptive Thinking:** Model autonomously decides when to use extended thinking based on task complexity.
*   **Effort Levels:** Four levels: `low`, `medium`, `high` (default), `max`. High effort = better on hard problems but adds latency/cost to simple ones.
*   **Context Compaction (Beta):** Automatically summarizes older context as conversations approach limits.
*   **128k Output Tokens:** Massive single-pass generations without splitting requests.
*   **US-only Inference:** Available at 1.1x pricing for data residency.

## Product Integrations

*   **Claude Code "Agent Teams":** Research preview — spin up multiple agents that coordinate autonomously.
*   **Claude in Excel:** Improved unstructured data ingestion and multi-step planning.
*   **Claude in PowerPoint (Research Preview):** Generate full decks from descriptions while adhering to brand layouts.

## Safety and Security

*   Low rates of deception, sycophancy, and cooperation with misuse.
*   Lowest rate of refusing benign queries among recent models.
*   Six new "probes" to detect misuse. Anthropic using the model to find and patch open-source vulnerabilities.

## Pricing & Availability

*   Available on Claude.ai, API, and major cloud platforms.
*   Standard: $5/1M input tokens, $25/1M output tokens.
*   Premium Context (>200k up to 1M): $10/$37.50 per million tokens.
