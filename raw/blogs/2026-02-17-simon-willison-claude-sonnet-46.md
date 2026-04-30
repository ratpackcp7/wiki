---
source_url: https://simonwillison.net/2026/Feb/17/claude-sonnet-46/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-claude-sonnet-46
---

# Introducing Claude Sonnet 4.6

On February 17, 2026, Anthropic released **Claude Sonnet 4.6**. This model aims to provide high-tier performance (comparable to the previous Opus 4.5) while maintaining the lower price point of the Sonnet line.

## Model Specifications & Pricing

| Feature | Claude Sonnet 4.6 | Claude Opus 4.5/4.6 | Claude Haiku 4.5 |
| :--- | :--- | :--- | :--- |
| **Input Price** | $3 / million tokens | $5 / million tokens | - |
| **Output Price** | $15 / million tokens | $25 / million tokens | - |
| **Knowledge Cutoff** | August 2025 | May 2025 | February 2025 |
| **Context Window** | 200k (up to 1M in beta) | 200k (up to 1M in beta) | - |

## Technical Implementation & Updates
Simon Willison has updated the `llm-anthropic` tool to version **0.24** to support the new models.

- **Adaptive Thinking:** New models include specific details around adaptive thinking.
- **Prefix Support:** The new models **no longer support prefixes**, as detailed in Anthropic's migration guide.
- **Tooling:** Simon used Claude Code to automate much of the update process for the llm-anthropic library.

## Visual Performance Comparison
Simon uses a recurring prompt—"a pelican riding a bicycle"—to benchmark model improvements in SVG generation:
- **Sonnet 4.6:** Tends to add creative flair, specifically "jaunty top hats." Bicycle frame logic slightly warped, includes descriptive comments in SVG code.
- **Opus 4.5 (Nov 2025):** Produced a "cute" pelican but struggled with bicycle orientation.
- **Opus 4.6 (Feb 2025):** Currently considered the best for anatomical accuracy.
