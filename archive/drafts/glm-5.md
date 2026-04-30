---
title: GLM-5
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [llm, glm, open-source, mit-license, ai-agents, z-ai]
sources:
  - url: https://z.ai/blog/glm-5
    fetched: 2026-04-11
  - url: https://huggingface.co/zai-org/GLM-5
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/11/glm-5/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# GLM-5

## Overview

GLM-5 is a 744B-parameter (40B active) MIT-licensed model from Z.ai, released February 2026. Designed for complex systems engineering and long-horizon agentic tasks. Major upgrade from GLM-4.5 (355B/32B).

## Key Specs

- **Parameters:** 744B total, 40B active
- **Training:** 28.5T tokens
- **Architecture:** DeepSeek Sparse Attention (DSA) for cost-efficient long context
- **Training infra:** slime (async RL framework by THUDM)
- **License:** MIT
- **Context:** Up to 202,752 tokens for tool-based reasoning
- **Max generation:** 131,072 tokens for reasoning

## Benchmark Highlights (Thinking mode)

- **AIME 2026 I:** 92.7 (matches DeepSeek-V3.2, close to Claude Opus 4.5 at 93.3)
- **HMMT Nov 2025:** 96.9 (beats DeepSeek-V3.2: 90.2, Claude Opus 4.5: 91.7)
- **SWE-bench Verified:** 77.8 (DeepSeek-V3.2: 73.1, Claude Opus 4.5: 80.9)
- **Terminal-Bench 2.0:** 56.2/61.1† (DeepSeek-V3.2: 46.4)
- **BrowseComp:** 75.9 (Claude Opus 4.5: 67.8, Gemini 3.0 Pro: 59.2)
- **Vending Bench 2:** #1 open-source, $4,432.12 (Claude Opus 4.5: $4,967.06)

## Notable Features

- End-to-end document creation (.docx, .pdf, .xlsx)
- Z.ai Agent Mode for multi-turn collaboration
- OpenClaw framework for cross-app operation
- Coding agent compatible: Claude Code, Roo Code, Cline, Droid

## Deployment

- API: api.z.ai, BigModel.cn, OpenRouter
- Local: HuggingFace, ModelScope (vLLM, SGLang)
- Hardware: NVIDIA + non-NVIDIA (Ascend, Moore Threads, Cambricon, etc.)

## Relevance to Chris

Not currently in Chris's stack. Worth tracking as a potential alternative for coding tasks or as a model option if OpenRouter pricing is favorable. The MIT license makes it freely deployable.

## Chris's preferences

- See `chris-preferences.md#ai-agents` for Chris's stance.
- Last sync with chris-preferences: 2026-04-11
