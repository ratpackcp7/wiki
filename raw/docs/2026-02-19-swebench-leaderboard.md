---
source_url: https://www.swebench.com/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-19-swebench-leaderboard
---

# SWE-bench Leaderboards

SWE-bench is a benchmark for evaluating LLMs on their ability to resolve real-world software engineering issues.

## Benchmark Variants

| Variant | Description | Instance Count |
| :--- | :--- | :--- |
| Verified | Human-filtered subset (collaboration with OpenAI). | 500 |
| Full | The complete original benchmark. | 2,294 |
| Lite | Curated subset for faster, less costly evaluation. | 300 |
| Multilingual | Tasks across 9 programming languages. | 300 |
| Multimodal | Issues containing visual elements/images. | 517 |

## Top Performing Models (Verified Subset)
Evaluated using mini-SWE-agent v2.0.0 (as of Feb 2026).

| Model | % Resolved | Avg. Cost ($) | Date |
| :--- | :--- | :--- | :--- |
| Claude 4.5 Opus (high reasoning) | 76.80% | $0.75 | 2026-02-17 |
| Gemini 3 Flash (high reasoning) | 75.80% | $0.36 | 2026-02-17 |
| MiniMax M2.5 (high reasoning) | 75.80% | $0.07 | 2026-02-17 |
| Claude Opus 4.6 | 75.60% | $0.55 | 2026-02-17 |
| GPT-5-2 Codex | 72.80% | $0.45 | 2026-02-19 |
| GLM-5 (high reasoning) | 72.80% | $0.53 | 2026-02-17 |
| GPT-5-2 (high reasoning) | 72.80% | $0.47 | 2026-02-17 |
| Kimi K2.5 (high reasoning) | 70.80% | $0.15 | 2026-02-17 |
| DeepSeek V3.2 (high reasoning) | 70.00% | $0.45 | 2026-02-17 |

## Key Announcements
- **CodeClash:** New evaluation where LMs compete head-to-head to write the best codebase.
- **mini-SWE-agent:** A compact agent (100 lines of Python) that achieved 65% on SWE-bench Verified.
- **SWE-smith:** A tool for training custom models for software engineering agents.
- **SWE-agent 1.0:** Open-source SOTA on SWE-bench Lite.

## Technical Details
- Standardized harness (mini-SWE-agent) ensures fair comparison.
- Primary metric: % Resolved.
- Docker-ized for reproducibility.

Supported by: Open Philanthropy, AWS, Modal, Andreessen Horowitz, OpenAI, and Anthropic.
