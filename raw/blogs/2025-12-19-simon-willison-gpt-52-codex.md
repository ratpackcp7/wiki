---
source_url: https://simonwillison.net/2025/Dec/19/introducing-gpt-52-codex/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-19-simon-willison-gpt-52-codex
---

# Introducing GPT-5.2-Codex

On December 19, 2025, OpenAI announced **GPT-5.2-Codex**, the latest iteration in the Codex family of models. This model is specifically optimized for agentic coding and complex software engineering tasks.

## Key Features and Improvements
The model is a specialized version of GPT-5.2 designed for the "Codex" ecosystem (distinct from the Codex CLI or Cloud agent tools). Key enhancements include:

*   **Context Compaction:** Improved handling of long-horizon work.
*   **Large-Scale Changes:** Stronger performance on refactors and migrations.
*   **Environment Optimization:** Enhanced performance specifically for Windows environments.
*   **Cybersecurity:** Significantly bolstered security capabilities.
*   **Benchmark Performance:** Scored **64% on Terminal-Bench 2.0**, a 1.8% increase over the base GPT-5.2 (62.2%).

> "GPT-5.2-Codex is a version of GPT-5.2 further optimized for agentic coding in Codex, including improvements on long-horizon work through context compaction, stronger performance on large code changes like refactors and migrations, improved performance in Windows environments, and significantly stronger cybersecurity capabilities."

## Availability and Access
*   **Current:** Available immediately via OpenAI's Codex coding agents.
*   **API:** Expected to be released to the general API "in the coming weeks."
*   **Cybersecurity Preview:** A new invite-only process exists for vetted security professionals to access "more permissive models."

## Practical Testing & Insights
Simon Willison tested the model's capabilities using the Codex CLI. Notable observations include:

*   **Agentic Coding:** Willison noted the model's strong ability to handle multi-hour coding challenges (e.g., porting projects).
*   **Visual Generation:** To test the model via the Codex CLI, Willison successfully prompted it to:
    > "Generate an SVG of a pelican riding a bicycle"
*   **Tooling:** The test was documented using Willison's new **Codex CLI timeline viewer**, which tracks model interactions and outputs.
