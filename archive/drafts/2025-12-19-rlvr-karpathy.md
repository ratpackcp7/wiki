---
title: "RLVR: Reinforcement Learning from Verifiable Rewards"
created: 2026-04-11
updated: 2026-04-11
type: concept
tags: [llm-training, reinforcement-learning, reasoning, ai-agents, karpathy]
sources:
  - url: https://simonwillison.net/2025/Dec/19/andrej-karpathy/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# RLVR: Reinforcement Learning from Verifiable Rewards

## The concept

RLVR is a training methodology where LLMs are trained against **automatically verifiable rewards** — environments where the correct answer can be programmatically checked (math problems, code puzzles, unit tests). Unlike RLHF (human feedback), RLVR doesn't require human judgment — the reward signal is deterministic.

## Why it matters

Andrej Karpathy highlighted RLVR as the pivotal LLM training development of 2025 in his "Year in Review":

> "By training LLMs against automatically verifiable rewards across a number of environments (e.g. think math/code puzzles), the LLMs spontaneously develop strategies that look like 'reasoning' to humans — they learn to break down problem solving into intermediate calculations and they learn a number of problem solving strategies for going back and forth to figure things out."

Key insight: "reasoning" in LLMs is not explicitly programmed — it **emerges** from training on verifiable tasks. The model discovers chain-of-thought as an optimal strategy for maximizing reward, not because it was taught to reason step-by-step.

## How it works

1. **Define verifiable environments** — tasks where success is objectively measurable (math, code, logic puzzles)
2. **Train with RL** — the model generates solutions, gets graded automatically, weights updated
3. **Emergent reasoning** — the model develops intermediate decomposition strategies (chain-of-thought, backtracking, verification) as optimal reward-maximizing behavior
4. **Transfer** — strategies learned in verifiable domains partially transfer to open-ended tasks

## Relationship to other training methods

| Method | Reward signal | Human needed? |
| :--- | :--- | :--- |
| **SFT** (Supervised Fine-Tuning) | Exact match to reference | Yes (annotators) |
| **RLHF** (Human Feedback) | Human preference ranking | Yes (raters) |
| **DPO** (Direct Preference Optimization) | Pairwise preference | Yes (raters) |
| **RLVR** (Verifiable Rewards) | Programmatic correctness | No |

## Relevance to Chris's stacks

- **Hermes agent**: Claude models (Opus 4.6) use RL-based training. Understanding RLVR helps reason about when Claude will vs won't "reason well" — verifiable tasks (code, math) are where RLVR models excel
- **Code generation**: RLVR explains why coding benchmarks (SWE-Bench, Terminal-Bench) have improved faster than open-ended creative tasks
- **Future direction**: As verifiable reward environments expand, expect reasoning capabilities to improve in domains that can be automatically tested

## Why not promoted

- Single primary source (Karpathy quote via Simon Willison's blog)
- RLVR is a research concept, not something directly actionable in Chris's current stacks
- Needs deeper primary sources (research papers on RLVR) before promotion

## Chris's preferences

- No specific section in chris-preferences.md yet
- Last sync with chris-preferences: 2026-04-11
