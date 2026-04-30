---
title: SWE-bench Leaderboard (Feb 2026)
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [benchmarks, llm, coding-agents, swe-bench, model-comparison]
sources:
  - url: https://www.swebench.com/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/19/swe-bench/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# SWE-bench Leaderboard (Feb 2026)

Independent benchmark of LLM coding ability on real-world GitHub issues. February 2026 run uses the "Bash Only" agent harness (mini-swe-bench, ~9000 lines Python) against SWE-bench Verified (500 samples).

## Top 10 (Verified subset)

| Rank | Model | % Resolved | Avg. Cost |
| :--- | :--- | :--- | :--- |
| 1 | Claude 4.5 Opus (high reasoning) | 76.80% | $0.75 |
| 2 | Gemini 3 Flash (high reasoning) | 75.80% | $0.36 |
| 3 | MiniMax M2.5 (high reasoning) | 75.80% | $0.07 |
| 4 | Claude Opus 4.6 | 75.60% | $0.55 |
| 5 | GLM-5 (high reasoning) | 72.80% | $0.53 |
| 6 | GPT-5.2 (high reasoning) | 72.80% | $0.47 |
| 7 | Claude 4.5 Sonnet (high reasoning) | 72.80% | — |
| 8 | Kimi K2.5 (high reasoning) | 71.40% | — |
| 9 | DeepSeek V3.2 (high reasoning) | 70.80% | $0.45 |
| 10 | Claude 4.5 Haiku (high reasoning) | 70.00% | — |

Also: GPT-5-2 Codex scored 72.80% ($0.45 avg) on a later run (2026-02-19).

## Key observations

- **Claude 4.5 Opus > Claude Opus 4.6** by ~1% on coding tasks. The older reasoning model still outperforms on agentic benchmarks.
- **4 Chinese models in top 10:** MiniMax M2.5, GLM-5, Kimi K2.5, DeepSeek V3.2. Cost efficiency is dramatically better (MiniMax at $0.07/issue vs $0.75 for Claude Opus).
- **Gemini 3 Flash** is competitive at half the cost of Claude Opus.
- **Standardized harness** — same system prompt and agent for every model. This is model reasoning comparison, not prompt engineering.

## Dataset composition

| Repo | Samples |
| :--- | :--- |
| django/django | 231 |
| sympy/sympy | 75 |
| sphinx-doc/sphinx | 44 |
| matplotlib/matplotlib | 34 |
| scikit-learn/scikit-learn | 32 |
| astropy, xarray, pytest, etc. | remaining |

## What this means for model selection

For coding-heavy agent workloads:
- **Best quality:** Claude 4.5 Opus (but expensive)
- **Best value:** MiniMax M2.5 or Gemini 3 Flash (both ~75% at fraction of cost)
- **Open-weight contender:** DeepSeek V3.2 at 70.8% with high reasoning

## Chris's preferences

- See `chris-preferences.md` for Chris's stance.
- Delta from best practice: Chris runs Claude Opus 4.6 as primary — this benchmark shows Claude 4.5 Opus still edges it on coding. Worth tracking.
- Last sync with chris-preferences: 2026-04-11

## Sources

- https://www.swebench.com/
- https://simonwillison.net/2026/Feb/19/swe-bench/
- https://github.com/SWE-agent/mini-swe-agent/blob/v2.2.1/src/minisweagent/config/benchmarks/swebench.yaml
